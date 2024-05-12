	object_const_def
	const ROUTEN01_YOUNGSTER
	const ROUTEN01_LASS
	const ROUTEN01_POKE_BALL

RouteN01_MapScripts:
	def_scene_scripts

	def_callbacks

RouteN01BG_CitySign:
	jumptext .Text
.Text:
	text "ROUTE N01"
	line "SHALE CITY AHEAD"
	done

RouteN01BG_TrainerTips:
	jumptext .Text
.Text:
	text "TRAINER TIPS"

	para "Weakening a"
	line "#MON makes it"
	cont "easier to capture."

	para "Applying a status"
	line "condition also"
	cont "helps!"
	done

RouteN01BG_HIRepel:
	hiddenitem REPEL, EVENT_ROUTEN01_HIDDEN_REPEL

RouteN01OB_Youngster:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .Jumped
	writetext .Text_Explain
	waitbutton
	closetext
	readvar VAR_XCOORD
	ifnotequal 6, .NoPlayerMove
	readvar VAR_YCOORD
	ifnotequal 14, .NoPlayerMove
	applymovement PLAYER, .Move_PlayerOutOfTheWay
	pause 5
.NoPlayerMove:
	applymovement ROUTEN01_YOUNGSTER, .Move_WalkToLedge
	playsound SFX_JUMP_OVER_LEDGE
	applymovement ROUTEN01_YOUNGSTER, .Move_JumpOverLedge
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	moveobject ROUTEN01_YOUNGSTER, 8, 16
	end

.Jumped:
	writetext .Text_OneWay
	waitbutton
	closetext
	end

.Text_Explain:
	text "Do you see this"
	line "ledge?"

	para "You can jump over"
	line "it for a shortcut"
	cont "back to OBSIDIAN"
	cont "TOWN."

	para "Watch this!"
	done

.Text_OneWay:
	text "I forgot that"
	line "jumping over a"
	cont "ledge is a one-way"
	cont "trip…"
	done

.Move_PlayerOutOfTheWay:
	step LEFT
	step UP
	turn_head DOWN
	step_end

.Move_WalkToLedge:
	step DOWN
	step_end

.Move_JumpOverLedge:
	jump_step DOWN
	step_sleep 5
	step RIGHT
	step RIGHT
	step_end

RouteN01OB_Lass:
	jumptextfaceplayer .Text
.Text:
	text "If your #MON"
	line "are hurt, you"
	cont "should avoid the"
	cont "tall grass."

	para "Resting up at home"
	line "or at a #MON"
	cont "CENTER will let"
	cont "your #MON"
	cont "recover."
	done

RouteN01OB_Potion:
	itemball POTION

RouteN01_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 11, 15, BGEVENT_READ, RouteN01BG_TrainerTips
	bg_event  5,  2, BGEVENT_READ, RouteN01BG_CitySign
	bg_event 16, 19, BGEVENT_ITEM, RouteN01BG_HIRepel

	def_object_events
	object_event  6, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RouteN01OB_Youngster, -1
	object_event 15,  7, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RouteN01OB_Lass, -1
	object_event  5, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RouteN01OB_Potion, EVENT_ROUTEN01_POTION
