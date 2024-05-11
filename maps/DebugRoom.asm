	object_const_def

DebugRoom_MapScripts:
	def_scene_scripts

	def_callbacks

DebugRoomBG_TestGenMon:
	callasm .GenMons
	opentext
	writetext .Text_Output
	waitbutton
	closetext
	end
.GenMons:
	ld a, 1
	ld [wShinyEncountersEnabled], a
	ld bc, 8192
	push bc
	ld de, 0
.loop
	push bc
	push de
	farcall GenerateMonPersonality
	pop de
	bit MON_SHINY_F, b
	jr z, .not_shiny
	inc de
.not_shiny
	pop bc
	ld a, b
	ldh [hMoneyTemp + 1], a
	ld a, c
	ldh [hMoneyTemp + 2], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	pop bc
	ld a, d
	ld [wStringBuffer5], a
	ld a, e
	ld [wStringBuffer5 + 1], a
	ld a, b
	ld [wStringBuffer5 + 2], a
	ld a, c
	ld [wStringBuffer5 + 3], a
	ret
.Text_Output:
	text_decimal wStringBuffer5, 2, 5
	text "/@"
	text_decimal wStringBuffer5 + 2, 2, 5
	text ""
	line "shinies generated."
	done

DebugRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, OBSIDIAN_TOWN, 1

	def_coord_events

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, DebugRoomBG_TestGenMon

	def_object_events
