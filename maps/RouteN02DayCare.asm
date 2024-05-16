	object_const_def
	const ROUTEN02DAYCARE_GRANNY

RouteN02DayCare_MapScripts:
	def_scene_scripts

	def_callbacks

DayCareWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_HAS_EGG
	iftrue .Egg
.Loop
	special DayCareWoman
	iffalse .Done
	closetext
	applymovement ROUTEN02DAYCARE_GRANNY, .Move_GetMon
	pause 15
	applymovement ROUTEN02DAYCARE_GRANNY, .Move_Return
	opentext
	sjump .Loop

.Done
	waitbutton
	closetext
	end

.Egg:
	waitbutton
	closetext
	end

.Move_GetMon:
	step UP
	step UP
	step_end

.Move_Return:
	step DOWN
	step DOWN
	turn_head LEFT
	step_end

RouteN02DayCare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, ROUTE_N02, 1
	warp_event  3,  5, ROUTE_N02, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareWomanScript, -1
