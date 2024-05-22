BattleCommand_incinerate:
; check if mon has an item
	call .get_item
	ld a, [hl]
	and a
	ret z

; can this item be burnt up?
	call GetItemIndexFromID
	ld b, h
	ld c, l
	call CheckBurnableItem
	ret nc

; it's burnable. is it permanently burnable tho?
	call CheckPermanentBurnableItem
	push af ; remember for later

; clear the item from the mon
	call .get_item
	ld b, [hl]
	xor a
	ld [hl], a

; if it's NOT permanently burnable, skip to the message
	pop af
	jr nc, .burnt_up
; otherwise, also clear it from the party struct
	xor a
	ld [de], a
.burnt_up
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, ItemBurntUpText
	jmp StdBattleTextbox

.get_item
	ldh a, [hBattleTurn]
	and a
	jr z, .enemyitem
;playeritem
	ld a, MON_ITEM
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, wBattleMonItem
	ret

.enemyitem
	ld a, MON_ITEM
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, wEnemyMonItem
	ret

CheckPermanentBurnableItem:
; checks if item bc is permanently burnable
	ld hl, CheckBurnableItem.PermanentBurnables - 1
	jr CheckBurnableItem.CheckList
CheckBurnableItem:
; checks if item bc is burnable (either in-battle or permanently)
	ld hl, .PermanentBurnables - 1
	call .CheckList
	ret c
	ld hl, .TemporaryBurnables - 1
.CheckList:
	inc hl
	ld a, [hli]
	ld e, a
	and [hl]
	inc a
	ret z
	ld a, c
	cp e
	jr nz, .CheckList
	ld a, [hl]
	cp b
	jr nz, .CheckList
	scf
	ret

.PermanentBurnables:
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

.TemporaryBurnables:
	dw SILVERPOWDER
	dw BLACKBELT_I
	dw PINK_BOW
	dw NEVERMELTICE
	dw SPELL_TAG
	dw MIRACLE_SEED
	dw FOCUS_BAND
	dw LEFTOVERS
	dw POLKADOT_BOW
; the rest are for flavor
	dw SILVER_LEAF
	dw GOLD_LEAF
	dw TINYMUSHROOM
	dw BIG_MUSHROOM
	dw CLEANSE_TAG
	dw ENERGYPOWDER
	dw ENERGY_ROOT
	dw HEAL_POWDER
	dw REVIVAL_HERB
	dw -1
