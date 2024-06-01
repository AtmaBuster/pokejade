BattleCommand_endeavor:
	ld hl, wBattleMonHP
	ld de, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonHP
	ld de, wBattleMonHP
.ok
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a

	ld a, h
	cp b
	jr c, .do_effect
	ld a, l
	cp c
	jr nc, .fail
.do_effect
	ld a, b
	sub h
	ld h, a
	ld a, c
	sbc l
	ld [wCurDamage + 1], a
	ld a, h
	ld [wCurDamage], a
	ret

.fail
	ld a, 1
	ld [wAttackMissed], a
	ret
