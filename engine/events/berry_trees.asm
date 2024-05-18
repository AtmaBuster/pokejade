BerryTree:
	call GetPlotData
	call .BerryTree
	jmp SavePlotData

.BerryTree:
	ld hl, wTempBerryTreePlantedBerry
	ld a, [hli]
	or [hl]
	jp z, .NoBerry

	ld a, [hld]
	ld l, [hl]
	ld h, a
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	ld [wCurItem], a
	call GetItemName

	ld a, [wTempBerryTreeGrowthStage]
	and BERRYTREE_GROWTH_STAGE_MASK
	cp BERRYGROWTH_FULLY_GROWN
	jr z, .FullyGrown

	ld hl, BerryText_GrowingNicely
	call PrintText

	ld a, [wTempBerryTreeWater]
	ld e, a
	and BERRYTREE_MULCH_MASK
	cp MULCH_SPONGY
	ld d, BERRY_MAXWATER_SPONGY
	jr z, .got_max_water_level
	ld d, BERRY_MAXWATER_NORMAL
.got_max_water_level
	ld a, e
	and BERRYTREE_WATER_MASK
	cp d
	jr nc, .skip_water
	ld hl, SQUIRTBOTTLE
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jr nc, .skip_water
	push de
	call PromptButton
; ask water
	ld hl, BerryText_AskWater
	call PrintText
	call YesNoBox
	pop de
	ret c
	ld a, [wTempBerryTreeWater]
	and ~BERRYTREE_WATER_MASK
	or d
	ld [wTempBerryTreeWater], a
	ld hl, BerryText_Watered
	call PrintText
.skip_water
	jmp WaitButton

.FullyGrown:
	ld hl, BerryText_FullyGrown
	call PrintText
	call YesNoBox
	ret c
	ld a, [wTempBerryTreeBerriesProduced]
	and BERRYTREE_NUM_PRODUCED_MASK
	swap a
	inc a
	ld e, a
	ld a, [wTempBerryTreeMulch]
	and BERRYTREE_MULCH_MASK
	cp MULCH_FERTILE
	jr nz, .got_berry_ct
	ld a, e
	srl a
	add e
	ld e, a
.got_berry_ct
	ld a, e
	ld [wItemQuantityChange], a
	; wCurItem already has the berry item
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .BagFull
	ld hl, BerryText_ReceivedBerry
	call PrintText
	call PromptButton
	ld hl, BerryText_SoilReturned
	call PrintText
	call WaitButton
	jmp ClearPlotData

.BagFull:
	ld hl, BerryText_BagFull
	call PrintText
	jmp WaitButton

.NoBerry:
	ld hl, BerryText_LoamySoil
	call PrintText
	call MakeBerryList
	ld a, [wBerryListCount]
	and a
	jp z, WaitButton
	call PromptButton
	ld hl, BerryText_PlantBerry
	call PrintText
	call YesNoBox
	ret c
	call GetBerryMenuItems
	call BerryMenu
	ret c

	ld a, [wMenuSelection]
	ld hl, wBerryListItems + 2
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hld]
	ld c, a
	ld a, [hld]
	ld l, [hl]
	ld h, a
	push hl
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	ld [wCurItem], a
	call GetItemName
	pop de

	call GetBerryData
	ret nc ; uh-oh
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld hl, wTempBerryTree
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, [wCurDay]
	ld [hli], a
	ldh a, [hHours]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, c
	dec a
	swap a
	or BERRYGROWTH_PLANTED | (1 << BERRYTREE_VISITED_F)
	ld [hli], a
	ld [hl], b

; TO-DO : mulch

	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call TossItem

	ld hl, BerryText_PlantedBerry
	call PrintText
	jmp WaitButton

BerryMenu:
	xor a
	ld [wMenuCursorPosition], a
	lb bc, 8, 17
	hlcoord 0, 0
	call Textbox
	call SafeUpdateSprites
	call HDMATransferTilemapAndAttrmap_Menu
	call UpdateTimePals
	ldh [hBGMapMode], a
	ld hl, BerryMenuHeader
	call LoadMenuHeader
	call ScrollingMenu
	and B_BUTTON
	jr nz, .b_button
	and a
	ret

.b_button
	scf
	ret

BerryMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, 17, 8
	dw .MenuData
	db 1 ; default selection

.MenuData:
	db 0, 4, 0
	db SCROLLINGMENU_ITEMS_NORMAL
	dba wBerryListMenuItems
	dba .PlaceStrings
	dba NULL

.PlaceStrings:
	push de
	ld a, [wMenuSelection]
	ld hl, wBerryListItems + 2
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hld]
	ld c, a
	ld a, [hld]
	ld l, [hl]
	ld h, a
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	call GetItemName
	pop hl
	ld de, wStringBuffer1
	push bc
	push hl
	call PlaceString
	ld hl, sp+2
	ld d, h
	ld e, l
	pop hl
	ld bc, 13
	add hl, bc
	ld a, "×"
	ld [hli], a
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ret

MakeBerryList:
; clear old list
	ld hl, wBerryList
	ld bc, wBerryListEnd - wBerryList
	xor a
	rst ByteFill

	ld hl, wNumItems
	ld a, [hli]
	and a
	ret z
	ld c, a
	ld de, wBerryListItems
.item_pack_loop
	push bc
	push de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	call CheckIsBerryItem
	ld b, d
	ld c, e
	pop de
	jr nc, .next
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	push hl
	ld hl, wBerryListCount
	inc [hl]
	pop hl
.next
	inc hl
	pop bc
	dec c
	jr nz, .item_pack_loop
	ret

GetBerryData:
	push bc
	ld hl, BerryData - BERRY_DATA_LENGTH
.loop
	ld bc, BERRY_DATA_LENGTH
	add hl, bc
	push hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop hl
;check end
	and b
	inc a
	jr z, .no
; check item
	ld a, b
	cp d
	jr nz, .loop
	ld a, c
	cp e
	jr nz, .loop
	pop bc
	inc hl
	inc hl
	scf
	ret

.no
	pop bc
	and a
	ret

CheckIsBerryItem:
	push hl
	ld hl, BerryData - BERRY_DATA_LENGTH
.loop
	ld bc, BERRY_DATA_LENGTH
	add hl, bc
	push hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop hl
; check end
	and b
	inc a
	jr z, .no
; check item
	ld a, b
	cp d
	jr nz, .loop
	ld a, c
	cp e
	jr nz, .loop
	pop hl
	scf
	ret

.no
	pop hl
	and a
	ret

INCLUDE "data/items/berries.asm"

GetBerryMenuItems:
	ld hl, wBerryListMenuItems
	ld a, [wBerryListCount]
	ld [hli], a
	ld c, a
	xor a
.loop
	ld [hli], a
	inc a
	dec c
	jr nz, .loop
	ld [hl], -1
	ret

ClearPlotData:
	ld hl, wTempBerryTree
	xor a
	ld [hli], a ; item
	ld [hli], a
	ld [hli], a ; last growth day
	ld [hli], a ; last growth hour
	ld [hli], a ; mulch / water
	ld a, (1 << BERRYTREE_VISITED_F)
	ld [hli], a ; production, visited, growth_stage
	xor a
	ld [hl], a ; time to grow
	ret

GetPlotData:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBerryTrees)
	ldh [rSVBK], a

	ld a, [wBerryTreeInteractID]
	ld hl, wBerryTrees
	ld bc, BERRYTREE_STRUCT_LEN
	rst AddNTimes
	ld de, wTempBerryTree
	ld bc, BERRYTREE_STRUCT_LEN
	rst CopyBytes

	pop af
	ldh [rSVBK], a
	ret

SavePlotData:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBerryTrees)
	ldh [rSVBK], a

	ld a, [wBerryTreeInteractID]
	ld hl, wBerryTrees
	ld bc, BERRYTREE_STRUCT_LEN
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, wTempBerryTree
	ld bc, BERRYTREE_STRUCT_LEN
	rst CopyBytes

	pop af
	ldh [rSVBK], a
	ret

SetBerryPlotVisited:
	push bc
	ld hl, wBerryTree1Visited
	ld bc, BERRYTREE_STRUCT_LEN
	rst AddNTimes
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBerryTrees)
	ldh [rSVBK], a
	set BERRYTREE_VISITED_F, [hl]
	pop af
	ldh [rSVBK], a
	pop bc
	ret

InitBerryPlots:
; wram bank should already be BANK(wBerryTrees)
	ld hl, wBerryTrees
	ld de, InitialBerries
	ld c, NUM_BERRY_PLOTS + 1
.loop
	push bc
	call .InitPlot
	pop bc
	dec c
	jr nz, .loop
	ret

.InitPlot:
; set Berry
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
; last growth time ; TO-DO
	xor a
	ld [hli], a
	ld [hli], a
; mulch, water
	xor a
	ld [hli], a
; visited flag, berry ct, growth stage
	ld a, [de]
	inc de
	dec a
	swap a
	or BERRYGROWTH_FULLY_GROWN
	ld [hli], a
; time til next stage
	ld a, 48 ; hours, 2 days
	ld [hli], a
	ret

INCLUDE "data/events/init_berry_plots.asm"

BerryText_GrowingNicely:
	text "The @"
	text_ram wStringBuffer1
	text ""
	line "is growing nicely."
	done

BerryText_AskWater:
	text "Water the"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

BerryText_Watered:
	text "<PLAYER> watered"
	line "the soil!"
	done

BerryText_FullyGrown:
	text "The @"
	text_ram wStringBuffer1
	text ""
	line "is fully grown."

	para "Harvest the"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

BerryText_BagFull:
	text "There's no room…"
	done

BerryText_ReceivedBerry:
	text "<PLAYER> received"
	line "@"
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer1
	text "(S)."
	done

BerryText_SoilReturned:
	text "The soil returned"
	line "to it's original"
	cont "loamy state."
	done

BerryText_LoamySoil:
	text "It's softy, loamy"
	line "soil."
	done

BerryText_PlantBerry:
	text "Plant a BERRY?"
	done

BerryText_PlantedBerry:
	text "Planted the"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

CheckBerryGrowthTick:
	ld a, [wLastBerryCheckHour]
	ld b, a
IF DEF(_DEBUG)
	ldh a, [hMinutes]
ELSE
	ldh a, [hHours]
ENDC
	cp b
	ret z
	ld [wLastBerryCheckHour], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBerryTrees)
	ldh [rSVBK], a
	ld c, NUM_BERRY_PLOTS
	ld hl, wBerryTrees
.loop
	push bc
	push hl
	ld b, h
	ld c, l
	call .TickBerryTree
	pop hl
	pop bc
	dec c
	jr z, .done
	ld de, BERRYTREE_STRUCT_LEN
	add hl, de
	jr .loop

.done
	pop af
	ldh [rSVBK], a
	ret

.TickBerryTree:
	ld hl, BERRYTREE_VISITED
	add hl, bc
	bit BERRYTREE_VISITED_F, [hl]
	ret z
	ld a, [hli]
	and BERRYTREE_GROWTH_STAGE_MASK
	ret z
	dec [hl]
	jr nz, .tick_water
; go to next stage
	dec hl
	ld a, [hl]
	and BERRYTREE_GROWTH_STAGE_MASK
	cp BERRYGROWTH_FULLY_GROWN
	jr z, .drop_berries
	inc [hl]
	ld hl, BERRYTREE_WATER
	add hl, bc
	ld a, [hl]
	and BERRYTREE_WATER_MASK
	jr nz, .watered
	call Random
	and %11
	jr z, .watered ; random chance to skip
	ld hl, BERRYTREE_NUM_PRODUCED
	add hl, bc
	ld a, [hl]
	and BERRYTREE_NUM_PRODUCED_MASK
	jr z, .watered ; already at minimum
	sub $10
	ld e, a
	ld a, [hl]
	and ~BERRYTREE_NUM_PRODUCED_MASK
	or e
	ld [hl], a
.watered
	ld hl, BERRYTREE_GROWTH_STAGE
	add hl, bc
	ld a, [hl]
	and BERRYTREE_GROWTH_STAGE_MASK
	cp BERRYGROWTH_FULLY_GROWN
	ld a, 48 ; 48 hours to drop berries
	jr z, .got_grow_time
	ld hl, BERRYTREE_PLANTED_BERRY
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	call GetBerryData
	ld e, [hl]
	ld hl, BERRYTREE_MULCH
	add hl, bc
	ld a, [hl]
	and BERRYTREE_MULCH_MASK
	cp MULCH_QUICK
	ld a, e
	jr nz, .got_grow_time
	add e
	add e
	srl a
	srl a
	jr nz, .got_grow_time
	inc a
.got_grow_time
	ld hl, BERRYTREE_TIME_TO_GROW
	add hl, bc
	ld [hl], a
	call .ResetPlotTime
.tick_water
	ld hl, BERRYTREE_WATER
	add hl, bc
	ld a, [hl]
	and BERRYTREE_WATER_MASK
	ret z
	dec [hl]
	ret

.drop_berries
	ld hl, BERRYTREE_PLANTED_BERRY
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	call GetBerryData
	ld a, [hli]
	ld e, [hl]
	ld d, a
	ld hl, BERRYTREE_MULCH
	add hl, bc
	ld a, [hl]
	and ~BERRYTREE_MULCH_MASK
	ld [hli], a
	ld a, e
	dec a
	swap a
	or BERRYGROWTH_PLANTED | (1 << BERRYTREE_VISITED_F)
	ld [hli], a
	ld [hl], d
	call .ResetPlotTime
; TO-DO : spread berries to adjacent plots
	ret

.ResetPlotTime:
	ld hl, BERRYTREE_LAST_GROWTH_DAY
	add hl, bc
	ld a, [wCurDay]
	ld [hli], a
	ldh a, [hHours]
	ld [hl], a
	ret

GetBerrySpriteGFXPointer:
	ld hl, wBerryObject1SoilID
	ld bc, 4 ; TO-DO
	rst AddNTimes
	ld e, [hl]
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBerryTrees)
	ldh [rSVBK], a
	ld hl, wBerryTrees
	ld bc, BERRYTREE_STRUCT_LEN
	ld a, e
	rst AddNTimes
	ld b, h
	ld c, l
	ld hl, BERRYTREE_GROWTH_STAGE
	add hl, bc
	ld a, [hl]
	and BERRYTREE_GROWTH_STAGE_MASK
	cp BERRYGROWTH_STAGE1
	jr c, .generic

	ld hl, BERRYTREE_PLANTED_BERRY
	add hl, bc
	push af
	ld a, [hli]
	ld d, [hl]
	ld e, a
	call GetBerryData
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $40
	pop af
	sub 3
	rst AddNTimes
	jr .got_it

.generic
	ld hl, GenericBerryGFX
	ld bc, $40
	rst AddNTimes
.got_it
	ld b, BANK(GenericBerryGFX) ; all in the same bank
	pop af
	ldh [rSVBK], a
	ret
