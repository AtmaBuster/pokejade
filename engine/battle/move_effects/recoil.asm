BattleCommand_recoil:
; if move is Struggle, ignore Rock Head
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld bc, STRUGGLE
	farcall CompareMove
	jr z, .skip_rock_head_check
; no recoil if user has Rock Head
	farcall GetUserAbility
	cp ROCK_HEAD
	ret z
.skip_rock_head_check
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld d, a
; get move to figure out how much recoil damage
	push hl
	ld hl, .RecoilMoves
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld e, a
.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	and c
	inc a
	jr z, .none
	ld a, e
	farcall CompareMove
	jr z, .got_move
	inc hl
	inc hl
	jr .loop

.got_move
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call .GetDamage
	pop de
	push de
	call _hl_
	jr .done

.none
	call .Quarter
.done
	ld a, b
	or c
	jr nz, .got_damage
	inc c ; min 1
.got_damage
	pop hl
IF 0
; get 1/4 damage or 1 HP, whichever is higher
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .min_damage
	inc c
.min_damage
ENDC

	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	dec hl
	dec hl
	ld a, [hl]
	ld [wHPBuffer2], a
	sub c
	ld [hld], a
	ld [wHPBuffer3], a
	ld a, [hl]
	ld [wHPBuffer2 + 1], a
	sbc b
	ld [hl], a
	ld [wHPBuffer3 + 1], a
	jr nc, .dont_ko
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wHPBuffer3
	ld [hli], a
	ld [hl], a
.dont_ko
	hlcoord 10, 9
	ldh a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .animate_hp_bar
	hlcoord 2, 2
	xor a
.animate_hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	call RefreshBattleHuds
	ld hl, RecoilText
	jmp StdBattleTextbox

.RecoilMoves:
	dw TAKE_DOWN,   .Quarter
	dw DOUBLE_EDGE, .Half
	dw SUBMISSION,  .Quarter
	dw STRUGGLE,    .QuarterMax
	dw VOLT_TACKLE, .Third
	dw FLARE_BLITZ, .Third
	dw BRAVE_BIRD,  .Third
	dw WOOD_HAMMER, .Third
	dw -1

.QuarterMax:
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	dec de
	ld c, a
.Quarter:
	srl b
	rr c
.Half:
	srl b
	rr c
	ret

.Third:
	xor a
	ldh [hDividend + 0], a
	ldh [hDividend + 1], a
	ld a, b
	ldh [hDividend + 2], a
	ld a, c
	ldh [hDividend + 3], a
	ld a, 3
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hDividend + 2]
	ld b, a
	ldh a, [hDividend + 3]
	ld c, a
	ret

.GetDamage:
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
	ret
