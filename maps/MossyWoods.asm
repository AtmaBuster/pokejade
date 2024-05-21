	object_const_def

MossyWoods_MapScripts:
	def_scene_scripts

	def_callbacks

Trainer_BugCatcher1:
	trainer BUG_CATCHER, BUG_CATCHER_1, EVENT_TRAINER_BUG_CATCHER_1, .SeenText, .BeatenText, 0, .Script
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

Trainer_BugCatcher2:
	trainer BUG_CATCHER, BUG_CATCHER_2, EVENT_TRAINER_BUG_CATCHER_2, .SeenText, .BeatenText, 0, .Script
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

Trainer_Picnicker1:
	trainer PICNICKER, PICNICKER_1, EVENT_TRAINER_PICNICKER_1, .SeenText, .BeatenText, 0, .Script
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

Trainer_BugCatcher3:
	trainer BUG_CATCHER, BUG_CATCHER_3, EVENT_TRAINER_BUG_CATCHER_3, .SeenText, .BeatenText, 0, .Script
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

Trainer_BugCatcher4:
	trainer BUG_CATCHER, BUG_CATCHER_4, EVENT_TRAINER_BUG_CATCHER_4, .SeenText, .BeatenText, 0, .Script
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

MossyWoodsBG_MossRock:
	jumptext .Text
.Text:
	text "The rock is"
	line "covered in moss."

	para "It feels cool to"
	line "the touch."
	done

MossyWoodsBG_HIHPUp:
	hiddenitem HP_UP, EVENT_MOSSY_WOODS_HIDDEN_HP_UP
MossyWoodsBG_HI2:
	hiddenitem MASTER_BALL, EVENT_MOSSY_WOODS_HIDDEN_2 ; TO-DO
MossyWoodsBG_HIEther:
	hiddenitem ETHER, EVENT_MOSSY_WOODS_HIDDEN_ETHER
MossyWoodsOB_Item1:
	itemball MASTER_BALL ; TO-DO
MossyWoodsOB_GreatBall:
	itemball GREAT_BALL
MossyWoodsOB_Item3:
	itemball MASTER_BALL ; TO-DO
MossyWoodsOB_Item4:
	itemball MASTER_BALL ; TO-DO

MossyWoods_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 35, ROUTE_N02_MOSSY_WOODS_GATE, 1
	warp_event 14, 35, ROUTE_N02_MOSSY_WOODS_GATE, 2
	warp_event 19, 38, CHERT_CITY_MOSSY_WOODS_GATE, 1
	warp_event 19, 39, CHERT_CITY_MOSSY_WOODS_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  4,  4, BGEVENT_READ, MossyWoodsBG_MossRock
	bg_event  5,  4, BGEVENT_READ, MossyWoodsBG_MossRock
	bg_event  4,  5, BGEVENT_READ, MossyWoodsBG_MossRock
	bg_event  5,  5, BGEVENT_READ, MossyWoodsBG_MossRock
	bg_event  5, 27, BGEVENT_ITEM, MossyWoodsBG_HIHPUp
	bg_event 12, 33, BGEVENT_ITEM, MossyWoodsBG_HI2
	bg_event 19, 31, BGEVENT_ITEM, MossyWoodsBG_HIEther

	def_object_events
	object_event  7, 13, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, Trainer_BugCatcher1, -1
	object_event 12,  8, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, Trainer_BugCatcher2, -1
	object_event 20,  3, SPRITE_CHRIS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, Trainer_Picnicker1, -1
	object_event 18, 14, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, Trainer_BugCatcher3, -1
	object_event 36, 27, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, Trainer_BugCatcher4, -1
	object_event 12, 30, SPRITE_CHRIS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MossyWoodsOB_Item1, EVENT_MOSSY_WOODS_ITEM1
	object_event  1,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MossyWoodsOB_GreatBall, EVENT_MOSSY_WOODS_GREAT_BALL
	object_event 27,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MossyWoodsOB_Item3, EVENT_MOSSY_WOODS_ITEM3
	object_event 21, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MossyWoodsOB_Item4, EVENT_MOSSY_WOODS_ITEM4

	def_berry_events
