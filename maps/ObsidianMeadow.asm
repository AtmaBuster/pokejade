	object_const_def
	const OBSIDIANMEADOW_PROF

ObsidianMeadow_MapScripts:
	def_scene_scripts
	scene_script .GoToProf, SCENE_OBSIDIAN_MEADOW_INIT
	scene_script EmptyScript, SCENE_OBSIDIAN_MEADOW_STARTER

	def_callbacks

.GoToProf:
	sdefer ObsidianMeadowSC_GoToProf

ObsidianMeadowSC_GoToProf:
	readvar VAR_YCOORD
	ifequal 8, .Param0
; Param1
	setscriptparam 1
	sjump .Join

.Param0:
	setscriptparam 0
.Join:
	turnobject OBSIDIANMEADOW_PROF, LEFT
	opentext
	writetext .Text_ComeHere
	waitbutton
	closetext
	end

.Text_ComeHere:
	text "PROF. PARK: Hurry,"
	line "<PLAYER>, over here!"
	done

ObsidianMeadow_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  8, PARKS_LAB, 3
	warp_event  0,  9, PARKS_LAB, 4

	def_coord_events
	coord_event 0, 1, SCENE_OBSIDIAN_MEADOW_STARTER, 0, CoordinatesEvent
	coord_event 1, 1, SCENE_OBSIDIAN_MEADOW_STARTER, 0, CoordinatesEvent

	def_bg_events

	def_object_events
	object_event 0, 0, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_OBSIDIAN_MEADOW_PROF
