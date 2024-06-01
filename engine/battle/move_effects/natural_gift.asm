BattleCommand_naturalgift:
	push bc
	push de
	ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonItem]
	jr z, .go
	ld a, [wEnemyMonItem]
.go
	and a
	jr z, .fail
	call GetItemIndexFromID
	ld b, h
	ld c, l
	ld hl, NaturalGiftItemTable + 1
.loop
	ld a, [hld]
	and [hl]
	inc a
	jr z, .fail
	ld a, [hli]
	cp c
	jr nz, .next
	ld a, [hl]
	cp b
	jr z, .got_it
.next
	inc hl
	inc hl
	inc hl
	inc hl
	jr .loop

.got_it
	inc hl
	ld a, [hli]
	ld d, a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	ld a, [hl]
	and ~TYPE_MASK
	or d
	ld [hl], a
	pop hl

	pop de
	ld d, [hl]
	pop bc
	ret

.fail
	pop de
	pop bc
	farcall AnimateFailedMove
	farcall PrintButItFailed
	farjp EndMoveEffect

INCLUDE "data/battle/natural_gift.asm"

BattleCommand_forceconsumeholditem:
	call StoreRecycleItem

	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonItem
	jr z, .ok
	ld hl, wEnemyMonItem
.ok
	xor a
	ld [hl], a
	jmp UpdateItemInParty
