BattleCommand_wringout:
	call SwitchTurn
	ld d, 120
	call BattleCommand_lifepower
	jp SwitchTurn

BattleCommand_lifepower:
	push bc
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonHP
.ok
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, d
	ldh [hMultiplier], a
	call Multiply
	ld a, [hli]
	ld b, [hl]
	and a
	jr z, .lt_256
	ld c, 2
	cp 1
	jr z, .lt_512
	ld c, 4
	rrca
	rr b
.lt_512
	rrca
	rr b
	ld a, c
	ldh [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
.lt_256
	ld a, b
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	pop bc
	ld d, a
	and a
	ret nz
	inc d
	ret
