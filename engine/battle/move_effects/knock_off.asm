BattleCommand_knockoff:
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wCurOTMon]
	ld hl, wEnemyKnockOffFlag
	farcall GetKnockOffFlag
	ret nz
	ld a, 1
	farcall GetEnemyAbility
	cp STICKY_HOLD
	ret z
	ld a, [wEnemyMonItem]
	and a
	ret z
	ld c, a
	ld a, [wCurOTMon]
	jr .set_knock_off

.enemy
	ld a, [wBattleMode]
	cp WILD_BATTLE
	ret z
	ld a, [wCurBattleMon]
	ld hl, wPlayerKnockOffFlag
	farcall GetKnockOffFlag
	ret nz
	ld a, 1
	farcall GetPlayerAbility
	cp STICKY_HOLD
	ret z
	ld a, [wBattleMonItem]
	and a
	ret z
	ld c, a
	ld a, [wCurBattleMon]
.set_knock_off
	farcall SetKnockOffFlag
	ld a, c
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, KnockOffText
	jmp StdBattleTextbox
