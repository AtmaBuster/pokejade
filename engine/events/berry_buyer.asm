ChooseBerryToBuy:
	ld hl, wBadges
	ld b, 1
	call CountSetBits
	ld b, 0
	ld hl, .ListSizePerBadge
	add hl, bc
	ld a, [hl]
	dec a
	jr z, .got_it ; 1 item, no need to randomize
	inc a
	call RandomRange
.got_it
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, BerryBuyerData
	add hl, bc
	ld a, [hli]
	ld [wBerryBuyerCurrentBerry], a
	ld a, [hl]
	ld [wBerryBuyerCurrentBerry + 1], a
	ret

.ListSizePerBadge
	db 1 ; 0 badges
	db 3 ; 1 badge
	db 3 ; 2 badges
	db 3 ; 3 badges
	db 3 ; 4 badges
	db 3 ; 5 badges
	db 3 ; 6 badges
	db 3 ; 7 badges
	db 3 ; 8 badges

GetBerryTradeItem:
	ld hl, wBerryBuyerCurrentBerry
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, BerryBuyerData
.loop
	ld a, [hli]
	ld e, a
	and [hl]
	inc a
	jp z, Crash_index
	ld a, e
	cp c
	jr nz, .next
	ld a, b
	cp [hl]
	jr nz, .next
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetItemIDFromIndex
	ld [wScriptVar], a
	ret

.next
	inc hl
	inc hl
	inc hl
	jr .loop

BufferBoughtBerryAndTradeItem:
	ld hl, wBerryBuyerCurrentBerry
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, BerryBuyerData
.loop
	ld a, [hli]
	ld e, a
	and [hl]
	inc a
	jp z, Crash_index
	ld a, e
	cp c
	jr nz, .next
	ld a, b
	cp [hl]
	jr nz, .next
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	call GetItemName
	ld h, d
	ld l, e
	ld de, wStringBuffer2
	push bc
	ld bc, STRING_BUFFER_LENGTH
	rst CopyBytes
	pop bc
	ld h, b
	ld l, c
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	jp GetItemName

.next
	inc hl
	inc hl
	inc hl
	jr .loop

TakeBoughtBerry:
; get item
	ld hl, wBerryBuyerCurrentBerry
	ld a, [hli]
	ld d, [hl]
	ld e, a
; count how many owned
	call .CountItems
; if less than 5, can't do it
	ld a, b
	and a
	jr nz, .ok
	ld a, c
	cp 5
	jr c, .fail
.ok
; otherwise, take them
	ld h, d
	ld l, e
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
REPT 5
	call TossItem
ENDR
	ld a, 1
	ld [wScriptVar], a
	ret

.fail
	xor a
	ld [wScriptVar], a
	ret

.CountItems:
	ld hl, wNumItems
	ld a, [hli]
	ld bc, 0
	inc a
.count_items_loop
	dec a
	ret z
	push af
	ld a, [hli]
	cp d
	jr nz, .skip_item
	ld a, [hli]
	cp e
	jr nz, .skip_item_2
	ld a, c
	add [hl]
	ld c, a
	jr nc, .skip_item_2
	inc b
	dec hl
.skip_item
	inc hl
.skip_item_2
	inc hl
	pop af
	jr .count_items_loop
