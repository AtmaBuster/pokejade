_CrashHandler::
; hard disable all interrupts
; keep flags
	ld a, 0 ; no-optimize a = 0
	ldh [rIE], a
; disable audio
	ldh [rNR52], a
; reset scroll
	ldh [rSCY], a
	ldh [rSCX], a
; remember vram and wram bank
	ldh a, [rVBK]
	ldh [hCrashStoreVRAM_Bank], a
	ldh a, [rSVBK]
	ldh [hCrashStoreWRAM_Bank], a
	ldh a, [hROMBank]
	ldh [hCrashStoreROM_Bank], a
; remember registers
; a gets stored by the handlers for different crash types
	ld a, b
	ldh [hCrashStoreBC + 1], a
	ld a, c
	ldh [hCrashStoreBC], a
	ld a, d
	ldh [hCrashStoreDE + 1], a
	ld a, e
	ldh [hCrashStoreDE], a
	ld a, h
	ldh [hCrashStoreHL + 1], a
	ld a, l
	ldh [hCrashStoreHL], a
; af -> bc, while preserving the rest of the stack
	pop hl
	push af
	pop bc
	push hl
; store flag register
	ld a, c
	ldh [hCrashStoreAF], a
; store contents of stack (4 words above top)
	ld hl, sp - 8
	ld b, 8
	ld c, LOW(hCrashStoreStackContents)
.store_stack_loop
	ld a, [hli]
	ldh [c], a
	inc c
	dec b
	jr nz, .store_stack_loop

	call Crash_RectifyStack

	call DisableLCD
; set up a black/white palette
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld c, LOW(rBGPD)
	ld a, $ff
	ldh [c], a
	ld a, $7f
	ldh [c], a
	xor a
REPT 6
	ldh [c], a
ENDR

	ld bc, Crash_BaseTilemap.end - Crash_BaseTilemap
	ld hl, Crash_BaseTilemap
	ld de, wTilemap
	rst CopyBytes

	call Crash_PutStackData
	call Crash_PutRegisters
	call Crash_PutVars
	call Crash_PutVersion

	ldh a, [hCrashType]
	ld c, a
	ld b, 0
	ld hl, Crash_ErrorStrings
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 5, 5
	call Crash_CopyString

	call Crash_CopyTileMap
	ld de, CrashHandlerFont
	ld hl, vTiles0 tile $20
	ld bc, (96 tiles) / 2
:
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, :-

	ld a, (1 << rLCDC_ENABLE) | (1 << rLCDC_TILE_DATA) | (1 << rLCDC_BG_PRIORITY)
	ldh [rLCDC], a
	call EnableLCD

:
	halt
	nop
	jr :-

Crash_PutStackData:
; put sp
	ld hl, sp + 2
	ld a, l
	push af
	ld a, h
	hlcoord 4, 11
	call Crash_PutHex
	pop af
	call Crash_PutHex
; put stored stack data
; skip if ERR_DMAROM
	ldh a, [hCrashType]
	cp ERR_DMAROM
	jr z, :+
	ld de, hCrashStoreStackContents
	hlcoord 16, 7
	ld c, 4
	call .loop
:
; put current contents
	ld hl, sp + 2
	ld d, h
	ld e, l
	hlcoord 16, 11
	ld c, 9
.loop
	call Crash_PutWord
	push bc
	ld bc, SCREEN_WIDTH - 4
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

Crash_PutRegisters:
	hlcoord 4, 7
	ld de, hCrashStoreAF
	ld c, 4
.loop
	call Crash_PutWord
	dec c
	ret z
	push bc
	ld bc, SCREEN_WIDTH - 4
	add hl, bc
	pop bc
	jr .loop

Crash_PutVars:
	hlcoord 6, 13
	ldh a, [hCrashStoreROM_Bank]
	call Crash_PutHex
	hlcoord 6, 14
	ldh a, [hCrashStoreWRAM_Bank]
	and %111
	call Crash_PutHex
	hlcoord 6, 15
	ldh a, [hCrashStoreVRAM_Bank]
	and %1
	jp Crash_PutHex

Crash_PutVersion:
	hlcoord 0, 17
	ld de, Crash_VersionString

Crash_CopyString:
	ld a, [de]
	and a
	ret z
	ld [hli], a
	inc de
	jr Crash_CopyString

Crash_CopyTileMap:
	call .ClearAttrMap

	xor a
	ldh [rVBK], a
	ld hl, vBGMap0
	ld de, wTilemap
	ld b, SCREEN_HEIGHT
.row_loop
	ld c, SCREEN_WIDTH
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	push bc
	ld bc, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row_loop
	ret

.ClearAttrMap:
	ld a, 1
	ldh [rVBK], a
	ld hl, vBGMap0
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	xor a
	rst ByteFill
	ret

Crash_PutWord:
	ld a, [de]
	push af
	inc de
	ld a, [de]
	inc de
	call Crash_PutHex
	pop af
Crash_PutHex:
; put hex(a) -> hl
	push af
	swap a
	call .put_digit
	pop af
.put_digit
	and $0f
	add $30 ; "0" ascii
	cp $3a ; "9"+1 ascii
	jr c, :+
	add $07 ; "A"-"9"-1 ascii
:	ld [hli], a
	ret

Crash_RectifyStack:
; check if the stack is full of $0039
; if so, it likely came from starting OAM DMA while in ROM
; the caller is very useful information, so undo the stack from it
; also change the crash type
	ld hl, sp+2
	ld c, 5
.loop
	ld a, [hli]
	cp $39
	ret nz
	ld a, [hli]
	and a
	ret nz
	dec c
	jr nz, .loop
; hold onto the return address
	pop de
.pop_loop
	pop hl
	ld a, l
	sub $39
	or h
	jr z, .pop_loop
	push hl
	push de
	ld a, ERR_DMAROM
	ldh [hCrashType], a
	ret

pushc
setcharmap ascii
Crash_BaseTilemap:
	db "An error has occur- "
	db "red. Please send a  "
	db "report & screenshot "
	db "to the developer.   "
	db "                    "
	db "ERR:                "
	db "                    "
	db "af= XX   sp- 8= XXXX"
	db "bc= XXXX   - 6= XXXX"
	db "de= XXXX   - 4= XXXX"
	db "hl= XXXX   - 2= XXXX"
	db "sp= XXXX      > XXXX"
	db "           + 2= XXXX"
	db "ROM  :XX   + 4= XXXX"
	db "RAM  :XX   + 6= XXXX"
	db "VRAM :XX   + 8= XXXX"
	db "           +10= XXXX"
	db "           +12= XXXX"
.end

Crash_ErrorStrings:
	table_width 2, Crash_ErrorStrings
	dw .Err_rst38
	dw .Err_div0
	dw .Err_dmarom
	dw .Err_inttimer
	dw .Err_intjoy
	dw .Err_index
	assert_table_length NUM_CRASH_TYPES

.Err_rst38
	db "0xFF EXEC", 0
.Err_div0
	db "DIVIDE BY ZERO", 0
.Err_dmarom
	db "DMA CALL IN ROM", 0
.Err_inttimer
	db "TIMER INT.", 0
.Err_intjoy
	db "JOYPAD INT.", 0
.Err_index
	db "INDEX OOB", 0

Crash_VersionString:
	db "{VER_STRING}", 0
popc

CrashHandlerFont: INCBIN "gfx/font/ascii_font.1bpp"
