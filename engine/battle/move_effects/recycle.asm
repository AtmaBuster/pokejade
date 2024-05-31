BattleCommand_recycle:
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerRecycleMemory
	ld de, wBattleMonItem
	ld a, [wCurBattleMon]
	jr z, .got_turn
	ld hl, wEnemyRecycleMemory
	ld de, wEnemyMonItem
	ld a, [wCurOTMon]
.got_turn
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	and a
	jr z, .fail
	ld a, [de]
	and a
	jr nz, .fail
	ld a, [hl]
	push af
	ld [de], a
	ld [wNamedObjectIndex], a
	xor a
	ld [hl], a
	call GetItemName
	farcall AnimateCurrentMove
	ld hl, RecycleText
	call StdBattleTextbox

	jr UpdateItemInParty

.fail
	farjp FailMove

StoreRecycleItem:
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerRecycleMemory
	ld de, wBattleMonItem
	ld a, [wCurBattleMon]
	jr z, .got_turn
	ld hl, wEnemyRecycleMemory
	ld de, wEnemyMonItem
	ld a, [wCurOTMon]
.got_turn
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [de]
	ld [hl], a
	ret

UpdateItemInParty:
	ldh a, [hBattleTurn]
	and a
	ld hl, BattlePartyAttr
	ld de, wBattleMonItem
	jr z, .got
	ld a, [wBattleMode]
	dec a
	ret z
	ld hl, OTPartyAttr
	ld de, wEnemyMonItem
.got
	ld a, MON_ITEM
	call _hl_
	ld a, [de]
	ld [hl], a
	ret
