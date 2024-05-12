	object_const_def
	const SHALECITY_OFFICER

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

ShaleCityOB_Guard:
	faceplayer
	opentext
	checkscene
	ifequal SCENE_SHALE_CITY_CANT_LEAVE, .CantLeave
	writetext .Text_Hello
	waitbutton
	closetext
	turnobject SHALECITY_OFFICER, DOWN
	end

.CantLeave:
	writetext .Text_DontBotherMe
	waitbutton
	closetext
	turnobject SHALECITY_OFFICER, DOWN
	end

.Text_Hello:
	text "Hello, <PLAYER>."
	line "Feel free to pass"
	cont "through!"
	done

.Text_DontBotherMe:
	text "Excuse me."

	para "Please don't"
	line "bother me while"
	cont "I'm working."
	done

ShaleCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1, 11, SHALE_POKECENTER_1F, 1
	warp_event 15,  5, SHALE_MART, 2
	warp_event 17, 11, SHALE_HOUSE_1, 1
	warp_event 27,  5, SHALE_HOUSE_2, 1

	def_coord_events
	coord_event 38,  8, SCENE_SHALE_CITY_CANT_LEAVE, 0, ShaleCityCO_CantLeave

	def_bg_events
	bg_event 14, 12, BGEVENT_READ, BGEvent
	bg_event  2, 11, BGEVENT_READ, BGEvent
	bg_event 16,  5, BGEVENT_READ, BGEvent

	def_object_events
	object_event 38,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShaleCityOB_Guard, -1
