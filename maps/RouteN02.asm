	object_const_def

RouteN02_MapScripts:
	def_scene_scripts

	def_callbacks

RouteN02BG_HIXAttack:
	hiddenitem X_ATTACK, EVENT_ROUTEN02_HIDDEN_XATTACK

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

	para "Determination is"
	line "key!"
	done

RouteN02OB_Item1:
	itemball MASTER_BALL

RouteN02OB_PokeBall:
	itemball POKE_BALL

RouteN02_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  5, OBSIDIAN_TOWN, 1
	warp_event 33,  3, OBSIDIAN_TOWN, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, BGEvent
	bg_event 23,  7, BGEVENT_READ, BGEvent
	bg_event 32,  6, BGEVENT_READ, BGEvent
	bg_event 30,  6, BGEVENT_ITEM, RouteN02BG_HIXAttack

	def_object_events
	object_event 10, 19, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 10, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 31, 10, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RouteN02OB_Youngster, EVENT_ROUTEN02_YOUNGSTER
	object_event 24,  9, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 27,  6, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BERRY_PLOT_ROUTEN02_1
	object_event  5,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BERRY_PLOT_ROUTEN02_2
	object_event  6,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BERRY_PLOT_ROUTEN02_3
	object_event  7,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BERRY_PLOT_ROUTEN02_4
	object_event 30, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RouteN02OB_Item1, EVENT_ROUTEN02_ITEM1
	object_event 36,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RouteN02OB_PokeBall, EVENT_ROUTEN02_POKEBALL
	object_event 23,  2, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DAY_CARE_MON_1
	object_event 25,  1, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DAY_CARE_MON_2
	object_event -3,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
