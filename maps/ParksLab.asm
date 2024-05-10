	object_const_def
	const PARKSLAB_PROF

ParksLab_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_PARKS_LAB_INIT
	scene_script ParksLabSC_AfterStarter, SCENE_PARKS_LAB_AFTER_STARTER
	scene_script EmptyScript, SCENE_PARKS_LAB_DONE

	def_callbacks

ParksLabSC_AfterStarter:
	opentext
	writetext .Text_ThanksAskFavor
.YesNoLoop:
	yesorno
	iftrue .SaidYes
	writetext .Text_Please
	sjump .YesNoLoop

.SaidYes:
	writetext .Text_ThanksTakeMon
	waitbutton
	special GetStarterName
	writetext .Text_GotMon
	playsound SFX_CAUGHT_MON
	waitsfx
	special CheckStarterForceShiny
	checkevent EVENT_GOT_TREECKO
	iftrue .Treecko
	checkevent EVENT_GOT_TORCHIC
	iftrue .Torchic
	checkevent EVENT_GOT_MUDKIP
	iftrue .Mudkip
	sjump @

.Treecko:
	givepoke TREECKO, 5
	sjump .JoinStarter
.Torchic:
	givepoke TORCHIC, 5
	sjump .JoinStarter
.Mudkip:
	givepoke MUDKIP, 5
.JoinStarter:
	setevent EVENT_GOT_STARTER
	writetext .Text_Letter
	waitbutton
	verbosegiveitem LETTER
	writetext .Text_GoodLuck
	waitbutton
	closetext
	setscene SCENE_PARKS_LAB_DONE
	setmapscene OBSIDIAN_TOWN, SCENE_OBSIDIAN_TOWN_NONE
	end

.Text_ThanksAskFavor:
	text "PROF. PARK: Thank"
	line "you for your help,"
	cont "<PLAYER>. You sure"
	cont "saved my bacon!"

	para "I actually wanted"
	line "to talk to you. I"
	cont "want to ask you a"
	cont "favor."

	para "I have a letter"
	line "for a colleague in"
	cont "-------- CITY."

	para "Would you deliver"
	line "it for me?"
	done

.Text_Please:
	text "Are you sure? You'd"
	line "be helping me out"
	cont "a lot if you did."

	para "Could you please"
	line "go deliver this"
	cont "letter for me?"
	done

.Text_ThanksTakeMon:
	text "Thank you so much!"

	para "Oh! You'll need a"
	line "#MON to help"
	cont "you get there."

	para "How about you hold"
	line "onto the #MON"
	cont "you got outside?"

	para "It seems to have"
	line "taken a liking to"
	cont "you!"
	done

.Text_GotMon:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

.Text_Letter:
	text "Oh! I'll need to"
	line "hand the letter"
	cont "over, too."
	done

.Text_GoodLuck:
	text "If you run into"
	line "any problems,"
	cont "come see me."

	para "Thanks again,"
	line "<PLAYER>! You're"
	cont "a life saver!"
	done

ParksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, OBSIDIAN_TOWN, 2
	warp_event  5, 11, OBSIDIAN_TOWN, 2
	warp_event  9,  6, OBSIDIAN_MEADOW, 1
	warp_event  9,  7, OBSIDIAN_MEADOW, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PARKS_LAB_PROF
