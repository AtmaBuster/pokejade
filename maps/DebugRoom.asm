	object_const_def

DebugRoom_MapScripts:
	def_scene_scripts

	def_callbacks

DebugRoomBG_TestGenMon:
	callasm .CrashTheGameLmao
	end
.CrashTheGameLmao:
	ldh a, [hJoypadDown]
	and B_BUTTON
	jr z, :+
	ld a, $69
	ldh [rDMA], a
REPT 20
	nop
ENDR
	ret

:
	rst $38
	ret

DebugRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, OBSIDIAN_TOWN, 1

	def_coord_events

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, DebugRoomBG_TestGenMon

	def_object_events

	def_berry_events
