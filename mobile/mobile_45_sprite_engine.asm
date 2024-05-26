Function115d99:
	ld hl, vTiles0 tile $60
	call Get2bpp
	xor a
	ld [wc305], a
	ld [wc306], a
	ld [wc309], a
	ld [wc30a], a
	ld [wc30b], a
	ld [wc30c], a
	ld a, $10
	ld [wc307], a
	ld a, $18
	ld [wc308], a
	ret

Function115dc3:
	xor a
	ld [wc305], a
	ld a, $a0
	ld hl, wShadowOAMSprite31
	ld bc, 8 * SPRITEOAMSTRUCT_LENGTH
	jmp ByteFill

Function115dd3:
	ld a, [wc305]
	and a
	ret z
	ld a, $a0
	ld hl, wShadowOAMSprite31
	ld bc, 8 * SPRITEOAMSTRUCT_LENGTH
	rst ByteFill
	call Function115e22
	ld a, [wc309]
	add a
	ld c, a
	ld b, 0
	ld hl, Unknown_115e86
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld de, wShadowOAMSprite31
	ld a, [wc307]
	ld c, a
	ld a, [wc308]
	ld b, a
	ld a, [hli]
.asm_115e04
	push af
	ld a, [hli]
	add b
	ld [de], a ; y
	inc de
	ld a, [hli]
	add c
	ld [de], a ; x
	inc de
	ld a, [hli]
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	pop af
	dec a
	jr nz, .asm_115e04
	ret

Function115e18:
	ld a, c
	ld [wc30a], a
	xor a
	ld [wc30b], a
	jr Function115e2b

Function115e22:
	ld hl, wc30c
	dec [hl]
	ret nz
	ld hl, wc30b
	inc [hl]

Function115e2b:
	ld a, [wc30a]
	add a
	ld c, a
	ld b, 0
	ld hl, Unknown_115e59
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	pop hl
	ld a, [wc30b]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	cp $ff
	jr nz, .not_end
	xor a
	ld [wc30b], a
	jr Function115e2b

.not_end
	ld [wc309], a
	ld a, [hl]
	ld [wc30c], a
	ret

Unknown_115e59:
	dw Unknown_115e61
	dw Unknown_115e6c
	dw Unknown_115e76
	dw Unknown_115e79

; OAM idx (see Unknown_115e86), flip flags/duration
Unknown_115e61:
	db $04, $08
	db $05, $08
	db $06, $08
	db $07, $08
	db $08, $08
	db -1

Unknown_115e6c:
	db $01, $08
	db $02, $08
	db $03, $08
	db $09, $08
	db $0a, $08
Unknown_115e76:
	db $00, $08
	db -1

Unknown_115e79:
	db $0b, $08
	db $0c, $08
	db $0d, $08
	db $0e, $08
	db $0f, $08
	db $00, $08
	db -1

Unknown_115e86:

Function11615a:
	xor a
	ld [wc30d], a
	ld [wc319], a
	ld [wc310], a
	ld [wc311], a
	ld [wc312], a
	ld [wc313], a
	ld [wc314], a
	ld [wc314 + 1], a
	ld [wc314 + 4], a
	ld [wc3f6], a
	ld [wc3f8], a
	ld [wc3f2], a
	ld [wc3f4], a
	ld a, $24
	ld [wc3f5], a
	ld a, $7
	ld [wc3f7], a
	ld a, $b0
	ld [wc30e], a
	ld [wc3f1], a
	ld a, $48
	ld [wc30f], a
	ld [wc3f3], a
	ret

Function11619d:
	ld a, [wc30d]
	and a
	ret z
	ld a, [wc319]
	cp $2
	ld a, $a0
	ld hl, wShadowOAM
	ld bc, 25 * SPRITEOAMSTRUCT_LENGTH
	rst ByteFill
