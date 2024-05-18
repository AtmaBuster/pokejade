	object_const_def
	const PARKSLAB_PROF
	const PARKSLAB_RIVAL

ParksLab_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_PARKS_LAB_INIT
	scene_script ParksLabSC_AfterStarter, SCENE_PARKS_LAB_AFTER_STARTER
	scene_script EmptyScript, SCENE_PARKS_LAB_DONE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ParksLabCB_MoveRival

ParksLabCB_MoveRival:
	checkscene
	ifnotequal SCENE_PARKS_LAB_AFTER_STARTER, .Skip
	moveobject PARKSLAB_RIVAL, 5, 5
.Skip:
	endcallback

ParksLabSC_AfterStarter:
	callasm .HideMapNameSign
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
	closetext
	applymovement PARKSLAB_PROF, .Move_ToPlayer
	opentext
	verbosegiveitem LETTER
	closetext
	applymovement PARKSLAB_PROF, .Move_Return
	opentext
	writetext .Text_GoodLuck
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	turnobject PARKSLAB_RIVAL, LEFT
	opentext
	writetext .Text_MyOwnMon
	waitbutton
	closetext
	applymovement PARKSLAB_RIVAL, .Move_ToBooks
	setscene SCENE_PARKS_LAB_DONE
	setmapscene OBSIDIAN_TOWN, SCENE_OBSIDIAN_TOWN_RIVAL_BATTLE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.Text_ThanksAskFavor:
	text "PROF.PARK: Thank"
	line "you for your help,"
	cont "<PLAYER>. And you"
	cont "too, <RIVAL>. You"
	cont "both really saved"
	cont "my bacon!"

	para "<PLAYER>, I"
	line "actually wanted to"
	cont "talk to you. I"
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
	text "<RIVAL>, you"
	line "should hold onto"
	cont "the #MON you"
	cont "caught, too."

	para "Capturing a"
	line "#MON creates a"
	cont "strong bond"
	cont "between it and the"
	cont "trainer. I think"
	cont "you'll learn a lot"
	cont "by caring for a"
	cont "#MON."

	para "…"

	para "…"

	para "Oh, of course!"
	line "I'll need to hand"
	cont "the letter over,"
	cont "too."
	done

.Text_GoodLuck:
	text "If you run into"
	line "any problems, come"
	cont "see me."

	para "Thanks again,"
	line "<PLAYER>! You're a"
	cont "real life saver!"
	done

.Text_MyOwnMon:
	text "<RIVAL>: Wow, my"
	line "very own #MON…"

	para "I never would've"
	line "gotten this"
	cont "oppurtunity"
	cont "without your help,"
	cont "<PLAYER>. Thank"
	cont "you!"
	done

.Move_ToPlayer:
	step DOWN
	step_end

.Move_Return:
	step UP
	turn_head DOWN
	step_end

.Move_ToBooks:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

.HideMapNameSign:
	xor a
	ld [wLandmarkSignTimer], a
	ret

ParksLabOB_Prof:
	faceplayer
	opentext
	checkevent EVENT_GOT_POKEDEX
	iftrue .RatePokedex
	checkevent EVENT_STOPPED_AT_SHALE_CHECKPOINT
	iftrue .GivePokedex
	writetext .Text_DeliverLetter
	waitbutton
	closetext
	end

.GivePokedex:
	writetext .Text_GiveDex
	waitbutton
	waitsfx
	writetext .Text_GotDex
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	setflag ENGINE_UNLOCKED_NAZOH_DEX
	setevent EVENT_GOT_POKEDEX
	writetext .Text_GiveBalls
	waitbutton
	verbosegiveitem POKE_BALL, 5
	setval 1
	writemem wShinyEncountersEnabled
	writetext .Text_GiveNote
	waitbutton
	verbosegiveitem PARKS_NOTE
	writetext .Text_GoodLuck
	waitbutton
	closetext
	end

.RatePokedex:
	writetext .Text_RatePokedex
	waitbutton
	special ProfOaksPCBoot
	writetext .Text_Goodbye
	waitbutton
	closetext
	end

.Text_DeliverLetter:
	text "PROF.PARK: Hey,"
	line "<PLAYER>! How's the"
	cont "delivery going?"
	done

.Text_GiveDex:
	text "PROF.PARK: Welcome"
	line "back, <PLAYER>!"

	para "Did you already"
	line "deliver the"
	cont "letter?"

	para "… … …"

	para "Oh, I see."
	line "That guard can be"
	cont "a bit paranoid"
	cont "sometimes."

	para "He's right,"
	line "though. I did"
	cont "forget to give you"
	cont "this!"
	done

.Text_GotDex:
	text "<PLAYER> received"
	line "the #DEX!"
	done

.Text_GiveBalls:
	text "And you can have"
	line "these, too."
	done

.Text_GiveNote:
	text "Use those #"
	line "BALLS to fill up"
	cont "your #DEX!"

	para "Not only does it"
	line "help with my"
	cont "research, but you"
	cont "can make all sorts"
	cont "of new friends"
	cont "that way."

	para "…"

	para "Oh, one more"
	line "thing! Take this."
	done

.Text_GoodLuck:
	text "Show that to the"
	line "guard in case he"
	cont "gives you any more"
	cont "trouble."

	para "Good luck on your"
	line "journey, <PLAYER>."

	para "I know you can do"
	line "it!"
	done

.Text_RatePokedex:
	text "PROF.PARK: Hi,"
	line "<PLAYER>!"

	para "Thanks for"
	line "stopping by. How"
	cont "about I rate your"
	cont "#DEX?"
	done

.Text_Goodbye:
	text "Come by again any"
	line "time!"
	done

ParksLabOB_Rival:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustGotStarter
	writetext .Text_CheckingBooks
	waitbutton
	closetext
	turnobject PARKSLAB_RIVAL, UP
	end

.JustGotStarter:
	writetext .Text_Thanks
	waitbutton
	closetext
	end

.Text_CheckingBooks:
	text "<RIVAL>: Hi,"
	line "<PLAYER>!"

	para "I'm checking"
	line "PROF.PARK's"
	cont "bookshelves for"
	cont "something useful"
	cont "to my research."
	done

.Text_Thanks:
	text "<RIVAL>: Thanks"
	line "for the help,"
	cont "<PLAYER>."

	para "I don't know how"
	line "we would have"
	cont "managed without"
	cont "you!"
	done

ParksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, OBSIDIAN_TOWN, 2
	warp_event  5, 11, OBSIDIAN_TOWN, 2
	warp_event  9,  8, OBSIDIAN_MEADOW, 1
	warp_event  9,  9, OBSIDIAN_MEADOW, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ParksLabOB_Prof, EVENT_PARKS_LAB_PROF
	object_event  2,  8, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ParksLabOB_Rival, EVENT_PARKS_LAB_RIVAL

	def_berry_events