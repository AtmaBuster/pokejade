	object_const_def
	const ROUTEN02_TRAINER_1
	const ROUTEN02_TRAINER_2
	const ROUTEN02_TRAINER_3
	const ROUTEN02_YOUNGSTER
	const ROUTEN02_LASS
	const ROUTEN02_DAYCARE_MAN
	const ROUTEN02_BERRY_1
	const ROUTEN02_BERRY_2
	const ROUTEN02_BERRY_3
	const ROUTEN02_BERRY_4
	const ROUTEN02_POKE_BALL_1
	const ROUTEN02_POKE_BALL_2
	const ROUTEN02_DAYCARE_MON_1
	const ROUTEN02_DAYCARE_MON_2

RouteN02_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_ROUTEN02_BEFORE_DAYCARE
	scene_script EmptyScript, SCENE_ROUTEN02_NONE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RouteN02CB_EggCheck

RouteN02CB_EggCheck:
	checkflag ENGINE_DAY_CARE_HAS_EGG
	iffalse .Mons
	moveobject ROUTEN02_DAYCARE_MAN, 27, 7
.Mons:
	clearevent EVENT_DAY_CARE_MON_1
	clearevent EVENT_DAY_CARE_MON_2
	checkflag ENGINE_DAY_CARE_HAS_MON1
	iftrue .SkipMon1
	setevent EVENT_DAY_CARE_MON_1
.SkipMon1:
	checkflag ENGINE_DAY_CARE_HAS_MON2
	iftrue .SkipMon2
	setevent EVENT_DAY_CARE_MON_2
.SkipMon2:
	endcallback

Trainer_YoungsterDanny:
	trainer YOUNGSTER, YOUNGSTER_DANNY, EVENT_TRAINER_YOUNGSTER_DANNY, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end
.SeenText:
	text "SEEN"
	done
.BeatenText:
	text "BEAT"
	done
.AfterText:
	text "OVER"
	done

Trainer_LassAbby:
	trainer LASS, LASS_ABBY, EVENT_TRAINER_LASS_ABBY, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end
.SeenText:
	text "SEEN"
	done
.BeatenText:
	text "BEAT"
	done
.AfterText:
	text "OVER"
	done

Trainer_Youngster2:
	trainer YOUNGSTER, YOUNGSTER_2, EVENT_TRAINER_YOUNGSTER_2, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end
.SeenText:
	text "SEEN"
	done
.BeatenText:
	text "BEAT"
	done
.AfterText:
	text "OVER"
	done

RouteN02CO_ExplainDaycare:
	turnobject ROUTEN02_DAYCARE_MAN, LEFT
	applymovement ROUTEN02_DAYCARE_MAN, .Move_Left
	turnobject PLAYER, RIGHT
	scall RouteN02_ExplainDayCare
	applymovement ROUTEN02_DAYCARE_MAN, .Move_Right
	end

.Move_Left:
	step LEFT
	step_end

.Move_Right:
	step RIGHT
	step_end

RouteN02OB_Youngster:
	checkevent EVENT_GOT_TM_FROM_ROUTEN02_YOUNGSTER
	iftrue .After
	faceplayer
	opentext
	writetext .Text_HaveThis
	promptbutton
	verbosegiveitem TM_SWEET_SCENT ; TO-DO
	iffalse .NoRoom
	setevent EVENT_GOT_TM_FROM_ROUTEN02_YOUNGSTER
	writetext .Text_ExplainTM
	waitbutton
.NoRoom:
	closetext
	end

.After:
	jumptextfaceplayer .Text_After

.Text_HaveThis:
	text "Hey, <PLAYER>!"

	para "I haven't found"
	line "any rare #MON"
	cont "yet…"

	para "But I found this!"
	line "You can have it!"
	done

.Text_ExplainTM:
	text "That's a TM. You"
	line "can use it on a"
	cont "#MON to teach"
	cont "it a move."

	para "Not every #MON"
	line "is compatible with"
	cont "a TM, though."

	para "Some #MON can"
	line "learn lots of"
	cont "moves! But some"
	cont "#MON can't"
	cont "learn any."
	done

.Text_After:
	text "I'm sure I'll find"
	line "a rare #MON"
	cont "soon."

	para "I just have to"
	line "keep searching."

	para "Persistence is"
	line "key!"
	done

RouteN02OB_Lass:
	jumptextfaceplayer .Text
.Text:
	text "The gate up ahead"
	line "leads into MOSSY"
	cont "WOODS."

	para "If your #MON"
	line "can use CUT, you"
	cont "can bypass the"
	cont "maze."
	done

RouteN02OB_DayCareMan:
	faceplayer
	checkscene
	ifequal SCENE_ROUTEN02_BEFORE_DAYCARE, .Explain
	opentext
	checkflag ENGINE_DAY_CARE_HAS_EGG
	iftrue .GiveEgg
	special DayCareManCompatibilty
	waitbutton
	closetext
	end

.GiveEgg:
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .Done
	clearflag ENGINE_DAY_CARE_HAS_EGG
.Done:
	end

.Explain:
	scall RouteN02_ExplainDayCare
	end

RouteN02_ExplainDayCare:
	textbox .Text
	setscene SCENE_ROUTEN02_NONE
	return
.Text:
	text "Hello there,"
	line "youngster!"

	para "I can just tell by"
	line "looking at you."
	cont "You're a #MON"
	cont "TRAINER!"

	para "My wife and I run"
	line "this here #MON"
	cont "DAYCARE."

	para "We'll look after"
	line "your #MON for"
	cont "you. Sometimes, we"
	cont "even find #MON"
	cont "EGGS!"

	para "Feel free to talk"
	line "to my wife inside"
	cont "if you want us to"
	cont "look after your"
	cont "#MON."
	done

RouteN02BG_HIXAttack:
	hiddenitem X_ATTACK, EVENT_ROUTEN02_HIDDEN_XATTACK
RouteN02OB_Item1:
	itemball MASTER_BALL ; TO-DO
RouteN02OB_PokeBall:
	itemball POKE_BALL

RouteN02_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  5, ROUTE_N02_DAYCARE, 2
	warp_event 33,  3, ROUTE_N02_MOSSY_WOODS_GATE, 3

	def_coord_events
	coord_event 25,  6, SCENE_ROUTEN02_BEFORE_DAYCARE, 0, RouteN02CO_ExplainDaycare

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, BGEvent
	bg_event 23,  7, BGEVENT_READ, BGEvent
	bg_event 32,  6, BGEVENT_READ, BGEvent
	bg_event 30,  6, BGEVENT_ITEM, RouteN02BG_HIXAttack

	def_object_events
	object_event 10, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Trainer_YoungsterDanny, -1
	object_event 14, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Trainer_LassAbby, -1
	object_event 31, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, Trainer_Youngster2, -1
	object_event 11, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RouteN02OB_Youngster, EVENT_ROUTEN02_YOUNGSTER
	object_event 23, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RouteN02OB_Lass, -1
	object_event 27,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RouteN02OB_DayCareMan, -1
	object_event 30, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RouteN02OB_Item1, EVENT_ROUTEN02_ITEM1
	object_event 36,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RouteN02OB_PokeBall, EVENT_ROUTEN02_POKE_BALL
	object_event 23,  2, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DAY_CARE_MON_1
	object_event 25,  1, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DAY_CARE_MON_2
	object_event -3,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	def_berry_events
	berry_event 4, 0, BERRYPLOT_ROUTEN02_1
	berry_event 5, 0, BERRYPLOT_ROUTEN02_2
	berry_event 6, 0, BERRYPLOT_ROUTEN02_3
	berry_event 7, 0, BERRYPLOT_ROUTEN02_4
