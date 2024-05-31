BattleCommand_pluck:
	ldh a, [hBattleTurn]
	and a
	ld de, wEnemyMonItem
	jr z, .go
	ld de, wBattleMonItem
.go
	ld a, [de]
	and a
	ret z
	call GetItemIndexFromID
	ld b, h
	ld c, l
	ld hl, .PluckItems
.loop
	ld a, [hli]
	and [hl]
	inc a
	ret z
	ld a, [hld]
	cp b
	jr nz, .next
	ld a, [hl]
	cp c
	jr z, .got_it
.next
	inc hl
	inc hl
	jr .loop

.got_it
; clear item in battle mon struct
	ld a, [de]
	ld [wNamedObjectIndex], a
	push de
	call GetItemName
	pop de
	xor a
	ld [de], a
; update item in party
	call SwitchTurn
	call UpdateItemInParty
	call SwitchTurn
; try effect
	call GetItemHeldEffectFromIndex
	ld a, b
	cp HELD_BERRY
	jr z, .held_berry
	cp HELD_RESTORE_PP
	jr z, .restore_pp
	cp HELD_HEAL_POISON
	ret c
	cp HELD_HEAL_CONFUSION
	jr z, .heal_confusion
	ret nc
;heal_status
	call SwitchTurn
	farcall UseStatusHealingItemEffect
	call SwitchTurn
	jr .done

.heal_confusion
	call SwitchTurn
	farcall UseConfusionHealingItemAlt
	call SwitchTurn
	jr .done

.held_berry
	call SwitchTurn
	call PluckHPRecovery
	call SwitchTurn
	jr .done

.restore_pp
	call PluckLeppaBerry
.done
	ld hl, PluckText
	jmp StdBattleTextbox

.PluckItems:
	dw CHERI_BERRY
        dw CHESTO_BERRY
        dw PECHA_BERRY
        dw RAWST_BERRY
        dw ASPEAR_BERRY
        dw LEPPA_BERRY
        dw ORAN_BERRY
        dw PERSIM_BERRY
        dw LUM_BERRY
        dw SITRUS_BERRY
	dw -1

GetItemHeldEffectFromIndex:
	ld a, BANK(ItemAttributes)
	ld hl, ItemAttributes
	call LoadIndirectPointer

	ld bc, ITEMATTR_EFFECT
	add hl, bc

	ld a, BANK(ItemAttributes)
	call GetFarByte

	ld b, a

	inc hl
	ld a, BANK(ItemAttributes)
	call GetFarByte

	ld c, a
	ret

PluckHPRecovery:
	ldh a, [hBattleTurn]
	and a
	ld de, wEnemyMonHP + 1
	ld hl, wEnemyMonMaxHP
	jr z, .go
	ld de, wBattleMonHP + 1
	ld hl, wBattleMonMaxHP
.go
	ld a, [de]
	ld [wHPBuffer2], a
	dec de
	ld a, [de]
	ld [wHPBuffer2 + 1], a
	cp [hl]
	jr nz, .diff
	inc de
	inc hl
	ld a, [de]
	cp [hl]
	ret z
	dec hl
	dec de
.diff
	inc de
	farcall ItemRecoveryAnim
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	ld a, [de]
	add c
	ld [wHPBuffer3], a
	ld c, a
	dec de
	ld a, [de]
	adc 0
	ld [wHPBuffer3 + 1], a
	ld b, a
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	jr nc, .ok
	ld a, [hli]
	ld [wHPBuffer3 + 1], a
	ld a, [hl]
	ld [wHPBuffer3], a
.ok
	ld a, [wHPBuffer3 + 1]
	ld [de], a
	inc de
	ld a, [wHPBuffer3]
	ld [de], a
	ldh a, [hBattleTurn]
	ld [wWhichHPBar], a
	and a
	hlcoord 2, 2
	jr z, .got_hp_bar_coords
	hlcoord 10, 9
.got_hp_bar_coords
	ld [wWhichHPBar], a
	predef_jump AnimateHPBar

PluckLeppaBerry:
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVar
	bit SUBSTATUS_TRANSFORMED, a
	ret nz
	push bc

	ldh a, [hBattleTurn]
	and a
	jr z, .got_battle_type
	ld a, [wBattleMode]
	and a
	ld a, OTPARTYMON
	jr z, .got_battle_type
	ld a, WILDMON
.got_battle_type
	ld [wMonType], a
; get pointers to moves and pp
	ld hl, wPartyMon1PP
	ld a, [wCurBattleMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, wPartyMon1Moves - wPartyMon1PP
	add hl, de
	ldh a, [hBattleTurn]
	and a
	jr z, .got_ptrs
	ld de, wWildMonPP
	ld hl, wWildMonMoves
	ld a, [wBattleMode]
	dec a
	jr z, .got_ptrs
	ld hl, wOTPartyMon1PP
	ld a, [wCurOTMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, wOTPartyMon1Moves - wOTPartyMon1PP
	add hl, de
.got_ptrs
	push de
	push hl
; loop over moves, check if any has 0 pp
	ld c, 0
.loop
	ld a, [hl]
	and a
	jr z, .no_empty
	ld a, [de]
	and PP_MASK
	jr z, .got_empty
	inc hl
	inc de
	inc c
	ld a, c
	cp NUM_MOVES
	jr nz, .loop
.no_empty
	pop hl
	pop de
; none were empty, now check for first move that isn't at max pp
	ld c, 0
.loop2
	ld a, [hl]
	and a
	jr z, .done
	ld a, c
	ld [wMenuCursorY], a
	push hl
	push de
	farcall GetMaxPPOfMove
	pop de
	pop hl
	ld a, [wTempPP]
	ld b, a
	ld a, [de]
	and PP_MASK
	cp b
	jr nz, .restore
	inc hl
	inc de
	inc c
	ld a, c
	cp NUM_MOVES
	jr nz, .loop2
.done
	pop bc
	ret

.got_empty
	add sp, 4
.restore
	ld a, c
	ld [wMenuCursorY], a
	push hl
	push de
	farcall GetMaxPPOfMove
	pop de
	pop hl
	ld a, c
	ldh [hMathBuffer], a
	pop bc
	ld a, [wTempPP]
	ld b, a
	ld a, [de]
	and PP_MASK
	add c
	cp b
	jr c, .got_new_pp
	ld a, b
.got_new_pp
	ld b, a
	ld a, [de]
	and ~PP_MASK
	or b
	ld [de], a
	ld c, a

	ldh a, [hMathBuffer]
	ld b, a
	ld a, [hl]
	ld [wTempByteValue], a

	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonMoves
	ld de, wBattleMonPP
	jr z, .got_pp_ptrs
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonPP
.got_pp_ptrs
	ld a, b
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [wTempByteValue]
	cp [hl]
	jr nz, .skip_checks
	ld a, b
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	ld a, c
	ld [de], a
.skip_checks
	ret
