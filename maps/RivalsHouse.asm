	object_const_def

RivalsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

RivalsHouseOB_Mom:
	faceplayer
	opentext
	checkevent EVENT_GOT_STARTER
	iffalse .NoStarter
	checkevent EVENT_STOPPED_AT_SHALE_CHECKPOINT
	iffalse .SkipTownMap
	checkevent EVENT_GOT_TOWN_MAP
	iftrue .SkipTownMap
	writetext .Text_TakeMap
	waitbutton
	verbosegiveitem TOWN_MAP
	setevent EVENT_GOT_TOWN_MAP
.SkipTownMap:
	writetext .Text_TakeCareOfRival
	waitbutton
	closetext
	end

.NoStarter:
	writetext .Text_RivalAtLab
	waitbutton
	closetext
	end

.Text_TakeMap:
	text "<RIVAL>'s MOM: Oh,"
	line "<PLAYER>!"

	para "I heard you helped"
	line "<RIVAL> out at the"
	cont "lab."

	para "As a token of my"
	line "thanks, I want to"
	cont "give you this."

	para "I'm sure it will"
	line "help you out on"
	cont "your travels!"
	done

.Text_TakeCareOfRival:
	text "<RIVAL>'s MOM:"
	line "Please look after"
	cont "<RIVAL> for me!"
	done

.Text_RivalAtLab:
	text "<RIVAL>'s MOM:"
	line "Hello, <PLAYER>."

	para "My son is working"
	line "at the #MON lab"
	cont "today."
	done

RivalsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, OBSIDIAN_TOWN, 3
	warp_event  7,  7, OBSIDIAN_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RivalsHouseOB_Mom, -1

	def_berry_events