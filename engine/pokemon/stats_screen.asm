	const_def
	const PINK_PAGE   ; 1
	const GREEN_PAGE  ; 2
	const BLUE_PAGE   ; 3
	const ORANGE_PAGE ; 4
DEF NUM_STAT_PAGES EQU const_value

DEF STAT_PAGE_MASK EQU %00000011

StatsScreenInit:
	ld hl, StatsScreenMain
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a ; disable overworld tile animations
	ld a, [wBoxAlignment] ; whether sprite is to be mirrorred
	push af
	ld a, [wJumptableIndex]
	ld b, a
	ld a, [wStatsScreenFlags]
	ld c, a
	call StatsScreenInitDexNumberMode

	push bc
	push hl
	call ClearBGPalettes
	call ClearTilemap
	call UpdateSprites
	farcall StatsScreen_LoadFont
	pop hl
	call _hl_
	call ClearBGPalettes
	call ClearTilemap
	pop bc

	; restore old values
	ld a, b
	ld [wJumptableIndex], a
	ld a, c
	ld [wStatsScreenFlags], a
	pop af
	ld [wBoxAlignment], a
	pop af
	ldh [hMapAnims], a
	ret

StatsScreenInitDexNumberMode:
	ld a, [wLastDexMode]
	cp DEXMODE_ABC
	jr z, .reset
	and a
	ld b, a
	ld a, [wUnlockedDexFlags]
	jr z, .nazoh_check
	dec b
	jr z, .holon_check
; national check
	bit NATIONAL_DEX_UNLOCK_F, a
	ld a, DEXMODE_NATIONAL
	jr nz, .finished
	jr .reset

.nazoh_check
	bit NAZOH_DEX_UNLOCK_F, a
	ld a, DEXMODE_NAZOH
	jr nz, .finished
	jr .reset

.holon_check
	bit NAZOH_DEX_UNLOCK_F, a
	ld a, DEXMODE_HOLON
	jr nz, .finished
.reset
	ld a, 3
.finished
	ld [wStatsScreenDexNumber], a
	ret

StatsScreenMain:
	xor a
	ld [wJumptableIndex], a
	ld [wStatsScreenFlags], a ; PINK_PAGE
.loop
	ld a, [wJumptableIndex]
	and ~(1 << 7)
	ld hl, StatsScreenPointerTable
	call JumpTable
	call StatsScreen_WaitAnim
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop
	ret

StatsScreenPointerTable:
	dw MonStatsInit       ; regular pokémon
	dw EggStatsInit       ; egg
	dw StatsScreenWaitCry
	dw EggStatsJoypad
	dw StatsScreen_LoadPage
	dw StatsScreenWaitCry
	dw MonStatsJoypad
	dw StatsScreen_Exit

StatsScreen_WaitAnim:
	ld hl, wStatsScreenFlags
	bit 6, [hl]
	jr nz, .try_anim
	bit 5, [hl]
	jr nz, .finish
	jmp DelayFrame

.try_anim
	farcall SetUpPokeAnim
	jr nc, .finish
	ld hl, wStatsScreenFlags
	res 6, [hl]
.finish
	ld hl, wStatsScreenFlags
	res 5, [hl]
	farjp HDMATransferTilemapToWRAMBank3

StatsScreen_SetJumptableIndex:
	ld a, [wJumptableIndex]
	and $80
	or h
	ld [wJumptableIndex], a
	ret

StatsScreen_Exit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

MonStatsInit:
	ld hl, wStatsScreenFlags
	res 6, [hl]
	call ClearBGPalettes
	call ClearTilemap
	farcall HDMATransferTilemapToWRAMBank3
	call StatsScreen_CopyToTempMon
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	call StatsScreen_InitUpperHalf
	ld hl, wStatsScreenFlags
	set 4, [hl]
	ld h, 4
	jr StatsScreen_SetJumptableIndex

.egg
	ld h, 1
	jr StatsScreen_SetJumptableIndex

EggStatsInit:
	call EggStatsScreen
	ld hl, wJumptableIndex
	inc [hl]
	ret

EggStatsJoypad:
	call StatsScreen_GetJoypad
	bit A_BUTTON_F, a
	jr nz, .quit
if DEF(_DEBUG)
	cp START
	jr z, .hatch
endc
	and D_DOWN | D_UP | A_BUTTON | B_BUTTON
if DEF(_DEBUG)
	jmp StatsScreen_JoypadAction
else
	jr StatsScreen_JoypadAction ; no-optimize Stub jump
endc

.quit
	ld h, 7
	jr StatsScreen_SetJumptableIndex

if DEF(_DEBUG)
.hatch
	ld a, [wMonType]
	or a
	jr nz, .skip
	push bc
	push de
	push hl
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Happiness
	rst AddNTimes
	ld a, 1 ; no-optimize *hl = N
	ld [hl], a
	ld [wTempMonHappiness], a
	ld a, 127
	ld [wStepCount], a
	ld de, .HatchSoonString
	hlcoord 8, 17
	rst PlaceString
	ld hl, wStatsScreenFlags
	set 5, [hl]
	pop hl
	pop de
	pop bc
.skip
	xor a
if DEF(_DEBUG)
	jr StatsScreen_JoypadAction
else
	jmp StatsScreen_JoypadAction
endc

.HatchSoonString:
	db "▶HATCH SOON!@"
endc

StatsScreen_LoadPage:
	call StatsScreen_LoadGFX
	ld hl, wStatsScreenFlags
	res 4, [hl]
	ld hl, wJumptableIndex
	inc [hl]
	ret

MonStatsJoypad:
	call StatsScreen_GetJoypad
	jr nc, .next
	ld h, 0
if DEF(_DEBUG)
	jmp StatsScreen_SetJumptableIndex
else
	jr StatsScreen_SetJumptableIndex ; no-optimize Stub jump
endc

.next
	and D_DOWN | D_UP | D_LEFT | D_RIGHT | A_BUTTON | B_BUTTON | SELECT
	jr StatsScreen_JoypadAction

StatsScreenWaitCry:
	call IsSFXPlaying
	ret nc
	ld hl, wJumptableIndex
	inc [hl]
	ret

StatsScreen_CopyToTempMon:
	ld a, [wMonType]
	cp BUFFERMON
	jr nz, .not_tempmon
	ld a, [wBufferMonSpecies]
	ld [wCurSpecies], a
	ld a, [wBufferMonCaughtBall]
	ld [wCurDeltaIndex], a
	call GetBaseData
	ld hl, wBufferMon
	ld de, wTempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	jr .done

.not_tempmon
	farcall CopyMonToTempMon
	ld a, [wTempMonCaughtBall]
	ld [wCurDeltaIndex], a
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .done
	ld a, [wMonType]
	cp BOXMON
	jr c, .done
	farcall CalcTempmonStats
.done
	and a
	ret

StatsScreen_GetJoypad:
	call GetJoypad
	ldh a, [hJoyPressed]
	and a
	ret

StatsScreen_JoypadAction:
	push af
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	pop af
	bit SELECT_F, a
	jmp nz, .select
	bit B_BUTTON_F, a
	jmp nz, .b_button
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	ret z
	ld a, [wMonType]
	cp BUFFERMON
	jr z, .next_storage
	cp BOXMON
	ret nc
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]
.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	ret z
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.d_up
	ld a, [wMonType]
	cp BUFFERMON
	jr z, .prev_storage
	ld a, [wCurPartyMon]
	and a
	ret z
	dec a
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.a_button
	ld a, c
	cp ORANGE_PAGE ; last page
	jr z, .b_button
.d_right
	inc c
	ld a, ORANGE_PAGE ; last page
	cp c
	jr nc, .set_page
	ld c, PINK_PAGE ; first page
	jr .set_page

.d_left
	ld a, c
	dec c
	and a ; cp PINK_PAGE
	jr nz, .set_page
	ld c, ORANGE_PAGE ; last page
	jr .set_page

.prev_storage
	farcall PrevStorageBoxMon
	jr nz, .load_storage_mon
	ret

.set_page
	ld a, [wStatsScreenFlags]
	and ~STAT_PAGE_MASK
	or c
	ld [wStatsScreenFlags], a
	ld h, 4
	jmp StatsScreen_SetJumptableIndex

.next_storage
	farcall NextStorageBoxMon
	ret z
.load_storage_mon
	ld a, [wBufferMonAltSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
.load_mon
	ld h, 0
	jmp StatsScreen_SetJumptableIndex

.b_button
	ld h, 7
	jmp StatsScreen_SetJumptableIndex

.select
	ld a, [wStatsScreenDexNumber]
	ld b, a
	push bc
	call StatsScreen_SelectNextNumber
	pop bc
	ld a, [wStatsScreenDexNumber]
	cp b
	jr z, .skip_sfx
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
.skip_sfx
	ld a, [wTempMonSpecies]
	call GetPokemonIndexFromID
	call StatsScreen_UpdateNumber
	ld hl, wStatsScreenFlags
	set 5, [hl]
	ret

StatsScreen_SelectNextNumber:
	ld a, [wStatsScreenDexNumber]
	ld b, a
	and %11
	ld c, a
	ld a, b
	swap a
	and %111
	ld b, a
	xor a
	inc b
.loop
	dec b
	jr z, .done_loop
	add 4
	jr .loop

.done_loop
	add c
	ld c, a
	ld b, 0
	ld hl, .table
	add hl, bc
	ld b, [hl]
	ld a, [wStatsScreenDexNumber]
	and %11110000
	or b
	ld [wStatsScreenDexNumber], a
	ret

.table
	db 3, 3, 3, 3
	db 0, 0, 0, 0
	db 1, 1, 1, 1
	db 1, 0, 0, 0
	db 2, 2, 2, 2
	db 2, 2, 0, 0
	db 1, 2, 1, 1
	db 1, 2, 0, 0

StatsScreen_UpdateNumber:
	call StatsScreen_GetDexNumber
	ld h, e
	ld l, d
	push hl
	ld hl, sp + 0
	ld d, h
	ld e, l
	hlcoord 15, 0
	ld a, "№"
	ld [hli], a
	ld a, [wStatsScreenDexNumber]
	and %11
	ld b, "<NA>"
	jr z, .got_sym
	dec a
	ld b, "<DELTA>"
	jr z, .got_sym
	dec a
	ld b, "."
	jr nz, .unknown_number
.got_sym
	ld a, b
	ld [hli], a
	lb bc, PRINTNUM_LEADINGZEROS | 2, 3
	ld a, [de]
	cp HIGH(1000)
	jr c, .lt_1k
	jr nz, .gt_1k
.next
	inc de
	ld a, [de]
	dec de
	cp LOW(1000)
	jr c, .lt_1k
.gt_1k
	inc c
	dec hl
.lt_1k
	call PrintNum
	add sp, 2
	ret

.unknown_number
	ld a, b
	ld [hli], a
	ld a, "?"
	ld [hli], a
	ld [hli], a
	ld [hl], a
	add sp, 2
	ret

StatsScreen_InitUpperHalf:
	call .PlaceHPBar
	xor a
	ldh [hBGMapMode], a
	ld a, [wBaseSpecies]
	ld [wCurSpecies], a
	call GetPokemonIndexFromID
	push hl
	call StatsScreen_CheckDexNumbers
	jr nc, .no_swappale_number
	hlcoord 17, 1
	ld a, $32
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
.no_swappale_number
	call .CheckForceNumberSwap
	call c, StatsScreen_SelectNextNumber
	pop hl
	call StatsScreen_UpdateNumber
	hlcoord 8, 0
	call PrintLevel
	ld hl, .NicknamePointers
	call GetNicknamePointer
	call CopyNickname
	hlcoord 8, 2
	rst PlaceString
	hlcoord 12, 0
	call .PlaceGenderChar
	hlcoord 9, 4
	ld a, "/"
	ld [hli], a
	ld a, [wBaseSpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	rst PlaceString
	call .PlaceBallIcon
	call StatsScreen_PlaceHorizontalDivider
	call StatsScreen_PlacePageSwitchArrows
	jp StatsScreen_PlaceShinyIcon

.PlaceHPBar:
	ld hl, wTempMonHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP
	ld a, [hli]
	ld d, a
	ld e, [hl]
	farcall ComputeHPBarPixels
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	jmp DelayFrame

.PlaceGenderChar:
	push hl
	farcall GetGender
	pop hl
	ret c
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"
.got_gender
	ld [hl], a
	ret

.PlaceBallIcon:
	hlcoord 7, 5
	ld a, $79
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	hlcoord 7, 6
	ld [hli], a
	inc a
	ld [hl], a
	ret

.NicknamePointers:
	dw wPartyMonNicknames
	dw wOTPartyMonNicknames
	dw wBufferMonNickname ; unused
	dw wBufferMonNickname ; unused
	dw wBufferMonNickname ; unused
	dw wBufferMonNickname

.CheckForceNumberSwap:
	ld a, [wStatsScreenDexNumber]
	ld b, a
	and %11
	jr z, .nazoh
	dec a
	jr z, .holon
	dec a
	jr z, .national
.force
	scf
	ret

.nazoh
	bit 4, b
	jr z, .force
	ret

.holon
	bit 5, b
	jr z, .force
	ret

.national
	bit 6, b
	jr z, .force
	ret

StatsScreen_GetDexNumber:
	ld a, [wStatsScreenDexNumber]
	and %11
	jp z, GetDexNumberNazoh
	dec a
	jp z, GetDexNumberHolon
	dec a
	jp z, GetDexNumberNational
	ld de, -1
	ret

StatsScreen_CheckDexNumbers:
	ld b, 7

	ld a, [wUnlockedDexFlags]
	ld c, a
	bit NAZOH_DEX_UNLOCK_F, c
	jr nz, .got_nazoh
	res 0, b
.got_nazoh
	bit HOLON_DEX_UNLOCK_F, c
	jr nz, .got_holon
	res 1, b
.got_holon
	bit NATIONAL_DEX_UNLOCK_F, c
	jr nz, .got_nat
	res 2, b
.got_nat

	call CheckDexNumberNazoh
	jr nz, .got_nazoh_num
	res 0, b
.got_nazoh_num
	call CheckDexNumberHolon
	jr nz, .got_holon_num
	res 1, b
.got_holon_num
	call CheckDexNumberNational
	jr nz, .got_nat_num
	res 2, b
.got_nat_num

	ld a, [wStatsScreenDexNumber]
	swap b
	and %11
	or b
	ld [wStatsScreenDexNumber], a

	ld a, b
	and a
	jr z, .none
	cp $10
	jr z, .single
	cp $20
	jr z, .single
	cp $40
	jr z, .single
	scf
	ret

.none
.single
	and a
	ret

StatsScreen_PlaceVerticalDivider: ; unreferenced
; The Japanese stats screen has a vertical divider.
	hlcoord 7, 0
	ld bc, SCREEN_WIDTH
	ld d, SCREEN_HEIGHT
.loop
	ld [hl], $31 ; vertical divider
	add hl, bc
	dec d
	jr nz, .loop
	ret

StatsScreen_PlaceHorizontalDivider:
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, $62 ; horizontal divider (empty HP/exp bar)
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

StatsScreen_PlacePageSwitchArrows:
	hlcoord 10, 6
	ld [hl], "◀"
	hlcoord 19, 6
	ld [hl], "▶"
	ret

StatsScreen_PlaceShinyIcon:
	ld bc, wTempMonPersonality
	farcall CheckShininess
	ret nc
	hlcoord 13, 0
	ld [hl], "⁂"
	ret

StatsScreen_LoadGFX:
	ld a, [wBaseSpecies]
	ld [wTempSpecies], a
	ld [wCurSpecies], a
	xor a
	ldh [hBGMapMode], a
	call .ClearBox
	call .PageTilemap
	call .LoadPals
	ld hl, wStatsScreenFlags
	bit 4, [hl]
	jmp z, SetDefaultBGPAndOBP
; load ball gfx
	ld a, [wTempMonCaughtBall]
	and MON_BALL_MASK
	call LoadBallIcon
	jmp StatsScreen_PlaceFrontpic

.ClearBox:
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	call StatsScreen_LoadPageIndicators
	hlcoord 0, 8
	lb bc, 10, 20
	jmp ClearBox

.LoadPals:
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	farcall LoadStatsScreenPals
	call DelayFrame
	ld hl, wStatsScreenFlags
	set 5, [hl]
	ret

.PageTilemap:
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	ld hl, .Jumptable
	jmp JumpTable

.Jumptable:
; entries correspond to *_PAGE constants
	table_width 2, StatsScreen_LoadGFX.Jumptable
	dw LoadPinkPage
	dw LoadGreenPage
	dw LoadBluePage
	dw LoadOrangePage
	assert_table_length NUM_STAT_PAGES

LoadPinkPage:
	hlcoord 0, 9
	ld b, $0
	predef DrawPlayerHP
	hlcoord 8, 9
	ld [hl], $41 ; right HP/exp bar end cap
	ld de, .Status_Type
	hlcoord 0, 12
	rst PlaceString
	ld a, [wTempMonCaughtBall]
	and MON_DELTA_MASK
	jr z, .no_delta
	hlcoord 5, 14
	ld [hl], "<DELTA>"
.no_delta
	ld a, [wTempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .HasPokerus
	ld a, b
	and $f0
	jr z, .NotImmuneToPkrs
	hlcoord 8, 8
	ld [hl], "." ; Pokérus immunity dot
.NotImmuneToPkrs:
	ld a, [wMonType]
	cp BOXMON
	jr z, .StatusOK
	hlcoord 6, 13
	push hl
	ld de, wTempMonStatus
	predef PlaceStatusString
	pop hl
	jr nz, .done_status
	jr .StatusOK
.HasPokerus:
	ld de, .PkrsStr
	hlcoord 1, 13
	rst PlaceString
	jr .done_status
.StatusOK:
	ld de, .OK_str
	rst PlaceString
.done_status
	hlcoord 1, 15
	ld a, [wTempMonCaughtBall]
	ld [wCurDeltaIndex], a
	predef PrintMonTypes
	hlcoord 9, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	ld de, .ExpPointStr
	hlcoord 10, 9
	rst PlaceString
	hlcoord 17, 14
	call .PrintNextLevel
	hlcoord 13, 10
	lb bc, 3, 7
	ld de, wTempMonExp
	call PrintNum
	call .CalcExpToNextLevel
	hlcoord 13, 13
	lb bc, 3, 7
	ld de, wExpToNextLevel
	call PrintNum
	ld de, .LevelUpStr
	hlcoord 10, 12
	rst PlaceString
	ld de, .ToStr
	hlcoord 14, 14
	rst PlaceString
	hlcoord 11, 16
	ld a, [wTempMonLevel]
	ld b, a
	ld de, wTempMonExp + 2
	predef FillInExpBar
	hlcoord 10, 16
	ld [hl], $40 ; left exp bar end cap
	hlcoord 19, 16
	ld [hl], $41 ; right exp bar end cap
	ret

.PrintNextLevel:
	ld a, [wTempMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .AtMaxLevel
	inc a
	ld [wTempMonLevel], a
.AtMaxLevel:
	call PrintLevel
	pop af
	ld [wTempMonLevel], a
	ret

.CalcExpToNextLevel:
	ld a, [wTempMonLevel]
	cp MAX_LEVEL
	jr z, .AlreadyAtMaxLevel
	inc a
	ld d, a
	farcall CalcExpAtLevel
	ld hl, wTempMonExp + 2
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ld [wExpToNextLevel + 2], a
	ldh a, [hQuotient + 2]
	sbc [hl]
	dec hl
	ld [wExpToNextLevel + 1], a
	ldh a, [hQuotient + 1]
	sbc [hl]
	ld [wExpToNextLevel], a
	ret

.AlreadyAtMaxLevel:
	ld hl, wExpToNextLevel
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.Status_Type:
	db   "STATUS/"
	next "TYPE/@"

.OK_str:
	db "OK @"

.ExpPointStr:
	db "EXP POINTS@"

.LevelUpStr:
	db "LEVEL UP@"

.ToStr:
	db "TO@"

.PkrsStr:
	db "#RUS@"

LoadGreenPage:
	ld de, .Item
	hlcoord 0, 8
	rst PlaceString
	call .GetItemName
	hlcoord 8, 8
	rst PlaceString
	ld de, .Move
	hlcoord 0, 10
	rst PlaceString
	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	rst CopyBytes
	hlcoord 8, 10
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	predef ListMoves
	hlcoord 12, 11
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	predef_jump ListMovePP

.GetItemName:
	ld de, .ThreeDashes
	ld a, [wTempMonItem]
	and a
	ret z
	ld [wNamedObjectIndex], a
	jmp GetItemName

.Item:
	db "ITEM@"

.ThreeDashes:
	db "---@"

.Move:
	db "MOVE@"

LoadBluePage:
	call .PlaceOTInfo
	hlcoord 10, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	hlcoord 11, 8
	ld bc, 6
	predef_jump PrintTempMonStats

.PlaceOTInfo:
	ld de, IDNoString
	hlcoord 0, 9
	rst PlaceString
	ld de, OTString
	hlcoord 0, 12
	rst PlaceString
	hlcoord 2, 10
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	ld de, wTempMonID
	call PrintNum
	ld hl, .OTNamePointers
	call GetNicknamePointer
	call CopyNickname
	farcall CorrectNickErrors
	hlcoord 2, 13
	rst PlaceString
	ld a, [wTempMonCaughtGender]
	and a
	ret z
	cp $7f
	ret z
	and CAUGHT_GENDER_MASK
	ld a, "♂"
	jr z, .got_gender
	ld a, "♀"
.got_gender
	hlcoord 9, 13
	ld [hl], a
	ret

.OTNamePointers:
	dw wPartyMonOTs
	dw wOTPartyMonOTs
	dw wBufferMonOT ; unused
	dw wBufferMonOT ; unused
	dw wBufferMonOT ; unused
	dw wBufferMonOT

IDNoString:
	db "<ID>№.@"

OTString:
	db "OT/@"

LoadOrangePage:
	hlcoord 0, 9
	call .PlaceNatureString
	call .PlaceOriginInfo
	hlcoord 2, 13
	call .PlaceAbilityName
	hlcoord 1, 15
	push hl
	ld a, [wTempMonAbility]
	call GetAbilityDescriptionPointer
	ld a, BANK(AbilityDescriptions)
	ld d, h
	ld e, l
	pop hl
	jmp FarPlaceString

.PlaceNatureString
	ld a, [wTempMonPersonality]
	and MON_NATURE_MASK
	push hl
	ld hl, NatureNames
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	rst PlaceString
	ret

.PlaceOriginInfo
	hlcoord 9, 9
	ld a, [wTempMonCaughtLevel]
	and CAUGHT_LEVEL_MASK
	jr z, .fateful_encounter
	cp 1
	jr z, .hatched
	ld d, a
	ld a, [wTempMonLevel]
	push af
	ld a, d
	ld [wTempMonLevel], a
	ld de, .CaughtAtString
	call PlaceString
	hlcoord 16, 11
	call PrintLevel
	pop af
	ld [wTempMonLevel], a
	jr .place_location

.hatched
	ld de, .HatchedAtString
	call PlaceString
.place_location
	ld a, [wTempMonCaughtLocation]
	ld e, a
	farcall GetLandmarkName
	ld de, wStringBuffer1
	hlcoord 0, 11
	jmp PlaceString

.fateful_encounter
	ld de, .FatefulEncounterString1
	call PlaceString
	ld de, .FatefulEncounterString2
	hlcoord 0, 11
	jmp PlaceString

.CaughtAtString:
	db "Caught at@"
.HatchedAtString:
	db "Hatched at@"
.FatefulEncounterString1:
	db "Met in a@"
.FatefulEncounterString2:
	db "fateful encounter@"

.PlaceAbilityName:
	push hl
	ld a, [wTempMonAbility]
	call GetAbilityName
	pop hl
	ld de, wStringBuffer1
	jmp PlaceString

StatsScreen_PlaceFrontpic:
	ld hl, wTempMonDVs
	predef GetUnownLetter
	call StatsScreen_GetAnimationParam
	jr c, .egg
	and a
	jr z, .no_cry
	jr .cry

.egg
	call .AnimateEgg
	jmp SetDefaultBGPAndOBP

.no_cry
	call .AnimateMon
	jmp SetDefaultBGPAndOBP

.cry
	call SetDefaultBGPAndOBP
	call .AnimateMon
	ld a, [wCurPartySpecies]
	jmp PlayMonCry2

.AnimateMon:
	ld hl, wStatsScreenFlags
	set 5, [hl]
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	cp LOW(UNOWN)
	ld a, h
	hlcoord 0, 0
	jmp nz, PrepMonFrontpic
	if HIGH(UNOWN) == 0
		and a
	elif HIGH(UNOWN) == 1
		dec a
	else
		cp HIGH(UNOWN)
	endc
	jmp nz, PrepMonFrontpic
	xor a
	ld [wBoxAlignment], a
	jmp _PrepMonFrontpic

.AnimateEgg:
	ld a, [wCurPartySpecies]
	push hl
	call GetPokemonIndexFromID
	ld a, l
	cp LOW(UNOWN)
	ld a, h
	pop hl
	jr nz, .not_unown_egg
	if HIGH(UNOWN) == 0
		and a
	elif HIGH(UNOWN) == 1
		dec a
	else
		cp HIGH(UNOWN)
	endc
	jr z, .unownegg
.not_unown_egg
	ld a, TRUE
	ld [wBoxAlignment], a
	jr .get_animation
.unownegg
	xor a
	ld [wBoxAlignment], a
	; fallthrough

.get_animation
	ld a, [wCurPartySpecies]
	call IsAPokemon
	ret c
	call StatsScreen_LoadTextboxSpaceGFX
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	hlcoord 0, 0
	lb de, $0, ANIM_MON_MENU
	predef LoadMonAnimation
	ld hl, wStatsScreenFlags
	set 6, [hl]
	ret

StatsScreen_GetAnimationParam:
	ld a, [wMonType]
	ld hl, .Jumptable
	jmp JumpTable

.Jumptable:
	dw .PartyMon
	dw .OTPartyMon
	dw .BoxMon ; unused
	dw .Tempmon ; unused
	dw .Wildmon
	dw .Buffermon

.PartyMon:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld b, h
	ld c, l
	jr .CheckEggFaintedFrzSlp

.OTPartyMon:
	xor a
	ret

.BoxMon:
.Buffermon
.Tempmon:
	ld bc, wTempMonSpecies
; fallthrough
.CheckEggFaintedFrzSlp:
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	call CheckFaintedFrzSlp
	jr c, .FaintedFrzSlp
.egg
	xor a
	scf
	ret

.Wildmon:
	ld a, $1
	and a
	ret

.FaintedFrzSlp:
	xor a
	ret

StatsScreen_LoadTextboxSpaceGFX:
	push hl
	push de
	push bc
	push af
	call DelayFrame
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	ld de, TextboxSpaceGFX
	lb bc, BANK(TextboxSpaceGFX), 1
	ld hl, vTiles2 tile " "
	call Get2bpp
	pop af
	ldh [rVBK], a
	jmp PopAFBCDEHL

EggStatsScreen:
	xor a
	ldh [hBGMapMode], a
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call StatsScreen_PlaceHorizontalDivider
	ld de, EggString
	hlcoord 8, 1
	rst PlaceString
	ld de, IDNoString
	hlcoord 8, 3
	rst PlaceString
	ld de, OTString
	hlcoord 8, 5
	rst PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 3
	rst PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 5
	rst PlaceString
if DEF(_DEBUG)
	ld de, .PushStartString
	hlcoord 8, 17
	rst PlaceString
	jr .placed_push_start

.PushStartString:
	db "▶PUSH START.@"

.placed_push_start
endc
	ld a, [wTempMonHappiness] ; egg status
	ld de, EggSoonString
	cp $6
	jr c, .picked
	ld de, EggCloseString
	cp $b
	jr c, .picked
	ld de, EggMoreTimeString
	cp $29
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 9
	rst PlaceString
	ld hl, wStatsScreenFlags
	set 5, [hl]
	call SetDefaultBGPAndOBP
	call DelayFrame
	hlcoord 0, 0
	call PrepMonFrontpic
	farcall HDMATransferTilemapToWRAMBank3
	call StatsScreen_AnimateEgg

	ld a, [wTempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	jmp PlaySFX

EggString:
	db "EGG@"

FiveQMarkString:
	db "?????@"

EggSoonString:
	db   "It's making sounds"
	next "inside. It's going"
	next "to hatch soon!@"

EggCloseString:
	db   "It moves around"
	next "inside sometimes."
	next "It must be close"
	next "to hatching.@"

EggMoreTimeString:
	db   "Wonder what's"
	next "inside? It needs"
	next "more time, though.@"

EggALotMoreTimeString:
	db   "This EGG needs a"
	next "lot more time to"
	next "hatch.@"

StatsScreen_AnimateEgg:
	call StatsScreen_GetAnimationParam
	ret nc
	ld a, [wTempMonHappiness]
	ld e, $7
	cp 6
	jr c, .animate
	ld e, $8
	cp 11
	ret nc
.animate
	push de
	ld a, $1
	ld [wBoxAlignment], a
	call StatsScreen_LoadTextboxSpaceGFX
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	pop de
	hlcoord 0, 0
	ld d, $0
	predef LoadMonAnimation
	ld hl, wStatsScreenFlags
	set 6, [hl]
	ret

StatsScreen_LoadPageIndicators:
	hlcoord 11, 5
	call .load_square2
	hlcoord 13, 5
	call .load_square2
	hlcoord 15, 5
	call .load_square2
	hlcoord 17, 5
	call .load_square2

	hlcoord 11, 5
	inc a
	inc c
.find_page_loop
	dec c
	jr z, .load_square
	inc hl
	inc hl
	jr .find_page_loop

.load_square
	push bc
	ld [hli], a
	inc a
	ld [hld], a
.join
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	pop bc
	ret

.load_square2
	push bc
	ld a, " "
	ld [hli], a
	ld [hld], a
	ld a, $37
	jr .join

CopyNickname:
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	push de
	rst CopyBytes
	pop de
	ret

GetNicknamePointer:
	ld a, [wMonType]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonType]
	cp BUFFERMON
	ret z
	ld a, [wCurPartyMon]
	jmp SkipNames

CheckFaintedFrzSlp:
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .fainted_frz_slp
	ld hl, MON_STATUS
	add hl, bc
	ld a, [hl]
	and 1 << FRZ | SLP_MASK
	jr nz, .fainted_frz_slp
	and a
	ret

.fainted_frz_slp
	scf
	ret

INCLUDE "data/pokemon/nature_names.asm"
