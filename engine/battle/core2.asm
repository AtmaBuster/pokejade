MarvelScaleCheck:
; check ablility
	push bc
	ld bc, -20 ; careful
	add hl, bc
	pop bc
	ld a, [hl]
	cp MARVEL_SCALE
	ret nz
; check stats
	push bc
	ld bc, 11 ; careful 2
	add hl, bc
	pop bc
	ld a, [hl]
	and a
	ret z
; defense *= 1.5
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld b, h
	ld c, l
	ret

GutsToxicBoostCheck:
	cp GUTS
	jr z, .guts
	cp TOXIC_BOOST
	ret nz
;toxic_boost
	bit PSN, e
	jr nz, .mul
	ret

.guts
	ld a, e
	and a
	ret z
.mul
	push bc
	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc
	pop bc
	ret

GetPlayerAbility:
; if a is zero, ignore ability-cancelling effects
	and a
	ld a, [wBattleMonAbility]
	ret z
; ...
	ret

GetEnemyAbility:
; if a is zero, ignore ability-cancelling effects
	and a
	ld a, [wEnemyMonAbility]
	ret z
; ...
	ret

GetUserAbility: ; TO-DO : check for Gastro Acid
	ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonAbility]
	jr z, .got_it
	ld a, [wEnemyMonAbility]
.got_it
	ret

GetOpponentAbility:
	call GetUserAbility
	sub MOLD_BREAKER
	ret z
	call SwitchTurn
	call GetUserAbility
	push af
	call SwitchTurn
	pop af
	ret

AnimateUserAbility:
	ldh a, [hBattleTurn]
	and a
	jr z, AnimatePlayerAbility
	jr AnimateEnemyAbility

AnimateOppAbility:
	ldh a, [hBattleTurn]
	and a
	jr z, AnimateEnemyAbility
AnimatePlayerAbility:
	ldh a, [hBattleTurn]
	and a
	jr z, .Animate
	call SwitchTurn
	call .Animate
	jmp SwitchTurn
.Animate
	xor a
	call GetPlayerAbility
	call GetAbilityName
	ld hl, TempPlayerAbilityText
	farjp StdBattleTextbox

AnimateEnemyAbility:
	ldh a, [hBattleTurn]
	and a
	jr nz, .Animate
	call SwitchTurn
	call .Animate
	jmp SwitchTurn
.Animate
	xor a
	call GetEnemyAbility
	call GetAbilityName
	ld hl, TempPlayerAbilityText
	farjp StdBattleTextbox
