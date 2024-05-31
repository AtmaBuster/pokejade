ConsumeHeldItem:
	push hl
	push de
	push bc
	ldh a, [hBattleTurn]
	and a
	ld hl, wOTPartyMon1Item
	ld de, wEnemyMonItem
	ld bc, wEnemyRecycleMemory
	ld a, [wCurOTMon]
	jr z, .theirturn
	ld hl, wPartyMon1Item
	ld de, wBattleMonItem
	ld bc, wPlayerRecycleMemory
	ld a, [wCurBattleMon]

.theirturn
	push af
	add c
	ld c, a
	adc b
	sub c
	ld b, a
	pop af
	push hl
	push af
	push bc
	ld a, [de]
	ld b, a
	farcall GetItemHeldEffect
	ld hl, ConsumableEffects
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc a
	jr nz, .loop
	pop bc
	pop af
	pop hl
	jmp PopBCDEHL

.ok
	pop bc
	ld a, [de]
	ld [bc], a
	xor a
	ld [de], a
	pop af
	pop hl
	call GetPartyLocation
	ldh a, [hBattleTurn]
	and a
	jr nz, .ourturn
	ld a, [wBattleMode]
	dec a
	jr z, .done

.ourturn
	ld [hl], NO_ITEM

.done
	jmp PopBCDEHL

INCLUDE "data/battle/held_consumables.asm"
