	object_const_def
	const SHALECITY_OFFICER
	const SHALECITY_OB2
	const SHALECITY_OB3
	const SHALECITY_YOUNGSTER
	const SHALECITY_BUG_CATCHER
	const SHALECITY_POKE_BALL

ShaleCity_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_SHALE_CITY_CANT_LEAVE
	scene_script EmptyScript, SCENE_SHALE_CITY_NONE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlypointCallback

.FlypointCallback:
	setflag ENGINE_FLYPOINT_SHALE
	endcallback

ShaleCityCO_CantLeave:
	turnobject SHALECITY_OFFICER, DOWN
	opentext
	writetext .Text_Stop
	waitbutton
	turnobject PLAYER, UP
	checkitem PARKS_NOTE
	iftrue .HaveNote
	checkevent EVENT_STOPPED_AT_SHALE_CHECKPOINT
	iftrue .ReStop
	setevent EVENT_STOPPED_AT_SHALE_CHECKPOINT
	writetext .Text_CantPass
	sjump .ReturnToTown

.ReStop:
	writetext .Text_AlreadyToldYou
.ReturnToTown:
	waitbutton
	closetext
	applymovement PLAYER, .Move_Left
	end

.HaveNote:
	writetext .Text_Pass
	waitbutton
	writetext .Text_GotBadgeCase
	setflag ENGINE_BADGE_CASE
	waitsfx
	playsound SFX_ITEM
	waitbutton
	writetext .Text_GoDoGyms
	waitbutton
	closetext
	setscene SCENE_SHALE_CITY_NONE
	end

.Text_Stop:
	text "Hey, you!"
	line "Stop!"
	done

.Text_CantPass:
	text "Unaccompanied kids"
	line "aren't allowed"
	cont "past here. It's"
	cont "too dangerous."

	para "Huh? A letter from"
	line "PROF.PARK?"

	para "Yeah right."
	line "There's no way you"
	cont "know the PROF."

	para "Besides, he never"
	line "would've sent you"
	cont "on an errand"
	cont "without a #DEX!"

	para "Maybe if you had"
	line "one of those I'd"
	cont "believe you."

	para "Haha!"
	line "As if."
	done

.Text_AlreadyToldYou:
	text "I already told"
	line "you, kid. You"
	cont "can't pass!"

	para "I don't care who"
	line "you think gave you"
	cont "a letter, I'm"
	cont "telling you I"
	cont "don't believe you!"

	para "Maybe if you had a"
	line "#DEX I'd buy"
	cont "your story."

	para "Haha!"
	line "As if."
	done

.Text_Pass:
	text "Hey! I thought I"
	line "told you…"

	para "What? A #DEX?"
	line "Hm…"
	cont "There's no way."
	cont "You must've stolen"
	cont "that!"

	para "A note?"

	para "…"

	para "It's even got"
	line "PROF.PARK's"
	cont "signature…"

	para "What's your name,"
	line "kid?"

	para "… … …"

	para "Well, <PLAYER>, I"
	line "hate to admit it,"
	cont "but I was wrong."
	cont "You can go on"
	cont "ahead."

	para "Oh, and as a token"
	line "of apology, I want"
	cont "you to have this."
	done

.Text_GotBadgeCase:
	text "<PLAYER> got the"
	line "BADGE CASE!"
	done

.Text_GoDoGyms:
	text "While you're"
	line "traveling, you"
	cont "should challenge"
	cont "#MON GYMS."

	para "You'll unlock more"
	line "priveliges around"
	cont "the region as you"
	cont "collect badges."

	para "Plus, you'll get"
	line "stronger as a"
	cont "trainer."

	para "Have a safe"
	line "journey, ki-"
	cont "Er, <PLAYER>!"
	done

.Move_Left:
	step LEFT
	step_end

ShaleCityCO_ApplyLure:
	callasm .SetLure
	end

.SetLure:
	ld a, [wRepelType]
	and a
	jr z, .set
	cp EFF_LURE_HIDDEN
	ret c
.set
	ld a, EFF_LURE_HIDDEN
	ld [wRepelType], a
	ld a, 150 ; 150 steps
	ld [wRepelEffect], a
	ret

ShaleCityOB_Guard:
	faceplayer
	checkscene
	ifequal SCENE_SHALE_CITY_CANT_LEAVE, .CantLeave
	opentext
	writetext .Text_Hello
	waitbutton
	checkevent EVENT_SHALE_CITY_HELP_KID
	iffalse .SkipHelp
	checkevent EVENT_ASKED_SHALE_GUARD_FOR_HELP
	iftrue .SkipHelp
	writetext .Text_HelpKid
	waitbutton
	setevent EVENT_ASKED_SHALE_GUARD_FOR_HELP
.SkipHelp:
	closetext
	turnobject SHALECITY_OFFICER, DOWN
	end

.CantLeave:
	textbox .Text_DontBotherMe
	turnobject SHALECITY_OFFICER, DOWN
	end

.Text_Hello:
	text "Hello, <PLAYER>."
	line "Feel free to pass"
	cont "through!"
	done

.Text_HelpKid:
	text "… … …"

	para "I already told"
	line "that kid he can't"
	cont "pass. He'll get"
	cont "hurt!"

	para "Ah, alright. I"
	line "suppose it"
	cont "wouldn't hurt to"
	cont "let him through."

	para "But he has to"
	line "promise not to go"
	cont "past the gate"
	cont "house!"
	done

.Text_DontBotherMe:
	text "Excuse me."

	para "Please don't"
	line "bother me while"
	cont "I'm working."
	done

ShaleCityBG_NameSign:
	jumptext .Text
.Text: ; TO-DO
	text "SHALE CITY"
	done

ShaleCityBG_PokecenterSign:
	jumpstd PokecenterSignScript

ShaleCityBG_PokemartSign:
	jumpstd MartSignScript

ShaleCityBG_HILure:
	hiddenitem LURE, EVENT_SHALE_CITY_HIDDEN_LURE

ShaleCityOB_Youngster:
	checkscene
	ifnotequal SCENE_SHALE_CITY_NONE, .Stuck
	checkevent EVENT_ASKED_SHALE_GUARD_FOR_HELP
	iffalse .AskGuard
	faceplayer
	textbox .Text_Thanks
	facingparam
	applymovementparam SHALECITY_YOUNGSTER, .Move_Leave
	disappear SHALECITY_YOUNGSTER
	clearevent EVENT_ROUTEN02_YOUNGSTER
	end

.AskGuard:
	setevent EVENT_SHALE_CITY_HELP_KID
	jumptextfaceplayer .Text_Help

.Stuck:
	jumptextfaceplayer .Text_Stuck

.Text_Thanks:
	text "Thank you so much!"

	para "I'm gonna head to"
	line "ROUTE N02 right"
	cont "now and find some"
	cont "rare #MON!"
	done

.Text_Help:
	text "The guard let you"
	line "pass? No way!"

	para "Do you think you"
	line "could ask him to"
	cont "let me go through,"
	cont "too?"
	done

.Text_Stuck:
	text "That mean guard"
	line "won't let me"
	cont "through."

	para "I just wanted to"
	line "search for some"
	cont "#MON!"
	done

.Move_Leave:
	dw .LeaveDown
	dw .LeaveUp
	dw .LeaveLeft
	dw .LeaveRight
.LeaveDown:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
.LeaveUp:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step_end
.LeaveLeft:
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
.LeaveRight:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

ShaleCityOB_BugCatcher:
	jumptextfaceplayer .Text
.Text:
	text "I'm spraying LURE"
	line "in the flowers."

	para "I'm trying to"
	line "attract rare"
	cont "#MON!"
	done

ShaleCityOB_Antidote:
	itemball ANTIDOTE

ShaleCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1, 11, SHALE_POKECENTER_1F, 1
	warp_event 15,  5, SHALE_MART, 2
	warp_event 17, 11, SHALE_HOUSE_1, 1
	warp_event 27,  5, SHALE_HOUSE_2, 1

	def_coord_events
	coord_event 37,  8, SCENE_SHALE_CITY_CANT_LEAVE, 0, ShaleCityCO_CantLeave
	coord_event 29, 16, -1, 0, ShaleCityCO_ApplyLure

	def_bg_events
	bg_event 14, 12, BGEVENT_READ, ShaleCityBG_NameSign
	bg_event  2, 11, BGEVENT_READ, ShaleCityBG_PokecenterSign
	bg_event 16,  5, BGEVENT_READ, ShaleCityBG_PokemartSign
	bg_event 35,  3, BGEVENT_ITEM, ShaleCityBG_HILure

	def_object_events
	object_event 37,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShaleCityOB_Guard, -1
	object_event 11,  4, SPRITE_CHRIS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11, 12, SPRITE_CHRIS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 25, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShaleCityOB_Youngster, EVENT_SHALE_CITY_YOUNGSTER
	object_event 31, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShaleCityOB_BugCatcher, -1
	object_event 36, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ShaleCityOB_Antidote, EVENT_SHALE_CITY_ANTIDOTE

	def_berry_events