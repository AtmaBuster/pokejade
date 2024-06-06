	object_const_def

ChertFlowerShop_MapScripts:
	def_scene_scripts

	def_callbacks

ChertFlowerShopOB_Tilly:
	faceplayer
	opentext
	checkevent EVENT_CHERT_FLOWER_SHOP_TALKED_TO_TILLY
	iftrue .SayHello
	setevent EVENT_CHERT_FLOWER_SHOP_TALKED_TO_TILLY
	writetext .Text_Introduction
	promptbutton
	special ChooseBerryToBuy
	sjump .TryBuyBerry

.SayHello:
	writetext .Text_Hello
	promptbutton
.TryBuyBerry:
	special BufferBoughtBerryAndTradeItem
	writetext .Text_AskForBerry
	yesorno
	iffalse .SaidNo
	special TakeBoughtBerry
	iffalse .NotEnough
	writetext .Text_ThankYou
	promptbutton
	special GetBerryTradeItem
	verbosegiveitem ITEM_FROM_MEM ; TO-DO : give berries back if not enough space
	special ChooseBerryToBuy
	sjump .ComeBack

.NotEnough:
	writetext .Text_NotEnough
	promptbutton
.ComeBack:
	writetext .Text_SeeMeAgain
	waitbutton
	closetext
	end

.SaidNo:
	writetext .Text_AnotherTime
	waitbutton
	closetext
	end

.Text_Introduction:
	text "Hi!"
	line "I don't believe"
	cont "we've met."

	para "My name is TILLY!"

	para "I'm here collecting"
	line "BERRIES for my"
	cont "sister, MOLLY."

	para "MOLLY is a baker"
	line "in MONOLITH CITY."
	cont "She likes to use"
	cont "BERRIES in her"
	cont "recipes."

	para "If you have any"
	line "BERRIES, I'd be"
	cont "willing to trade"
	cont "you some items for"
	cont "them."
	done

.Text_Hello:
	text "TILLY: Hey,"
	line "<PLAYER>!"
	done

.Text_AskForBerry:
	text "I'm looking for"
	line "<BUFFER1>."

	para "In return for 5"
	line "of those, I can"
	cont "give you one"
	cont "<BUFFER2>."

	para "What do you say?"
	done

.Text_ThankYou:
	text "Oh, thank you so"
	line "much!"

	para "Here. This is for"
	line "you!"
	done

.Text_SeeMeAgain:
	text "Come by again if"
	line "you have more"
	cont "BERRIES for me."
	done

.Text_AnotherTime:
	text "Oh, ok then."

	para "Maybe another"
	line "time."
	done

.Text_NotEnough:
	text "It looks like you"
	line "don't have enough"
	cont "<BUFFER1>."
	done

ChertFlowerShopOB_WateringGirl:
	faceplayer
	checkevent EVENT_CHERT_FLOWER_SHOP_GOT_WAILMER_PAIL
	iftrue .GotWailmerPail
	opentext
	writetext .Text_Hello
	promptbutton
	verbosegiveitem WAILMER_PAIL
	setevent EVENT_CHERT_FLOWER_SHOP_GOT_WAILMER_PAIL
	writetext .Text_WaterBerries
	waitbutton
	closetext
	end

.GotWailmerPail:
	jumptext .Text_AfterWailmerPail

.Text_Hello:
	text "Hello."

	para "You seem like"
	line "someone who'd like"
	cont "taking care of"
	cont "plants."

	para "Here, take this!"
	done

.Text_WaterBerries:
	text "You can use that"
	line "to water any"
	cont "BERRIES you plant"
	cont "in soft soil."

	para "If you take care"
	line "of them, you'll"
	cont "end up with a"
	cont "plentiful harvest!"

	para "Oh, and don't"
	line "worry about taking"
	cont "that. We have"
	cont "plenty of extras."
	done

.Text_AfterWailmerPail:
	text "Hello, again."

	para "Are you taking"
	line "good care of the"
	cont "BERRIES you plant?"
	done

ChertFlowerShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERT_CITY, 6
	warp_event  3,  7, CHERT_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChertFlowerShopOB_Tilly, -1
	object_event  8,  2, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChertFlowerShopOB_WateringGirl, -1

	def_berry_events
