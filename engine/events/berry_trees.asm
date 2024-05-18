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
	call WaitButton
	ret

.FullyGrown:
	ld hl, BerryText_FullyGrown
	call PrintText
	call YesNoBox
	ret c
	ld a, [wTempBerryTreeBerriesProduced]
	and BERRYTREE_NUM_PRODUCED_MASK
	swap a
	inc a
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
