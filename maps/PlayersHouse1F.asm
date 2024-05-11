	object_const_def
	const PLAYERSHOUSE1F_MOM

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_PLAYERS_HOUSE_1F_INTRO
	scene_script EmptyScript, SCENE_PLAYERS_HOUSE_1F_NONE

	def_callbacks

PlayersHouse1FSC_MeetMom:
	faceobject PLAYERSHOUSE1F_MOM, PLAYER
	faceobject PLAYER, PLAYERSHOUSE1F_MOM
	opentext
	writetext .Text_Wait
	waitbutton
	sjumpparam .MoveIfParam
.MoveIfParam:
	dw .Join
	dw .DoMoveLeft
	dw .Join
	dw .DoMoveDown

.DoMoveLeft:
	closetext
	applymovement PLAYER, .Move_Left
	opentext
	sjump .Join

.DoMoveDown:
	closetext
	applymovement PLAYER, .Move_Down
	opentext
.Join:
	writetext .Text_ProfCalled
	yesorno
	iftrue .SaidYes
	writetext .Text_Directions
	sjump .JoinYesNo

.SaidYes:
	writetext .Text_GoodToGo
.JoinYesNo:
	waitbutton
	writetext .Text_GoGetEm
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_MOM, LEFT
	setscene SCENE_PLAYERS_HOUSE_1F_NONE
	end

.Text_Wait:
	text "MOM: Oh, <PLAYER>,"
	line "wait up!"
	done

.Text_ProfCalled:
	text "PROF.PARK came by"
	line "earlier. He said"
	cont "he wanted to talk"
	cont "with you about"
	cont "something."

	para "Why don't you head"
	line "over to his lab?"

	para "You remember where"
	line "it is, right?"
	done

.Text_Directions:
	text "It's just to the"
	line "south. You know,"
	cont "the big building?"
	cont "You can't miss it!"
	done

.Text_GoodToGo:
	text "Alright, sounds"
	line "good."
	done

.Text_GoGetEm:
	text "Go get 'em, honey!"
	done

.Move_Left:
	step LEFT
	step_end
.Move_Down:
	step DOWN
	step_end

PlayersHouse1FOB_Mom:
	faceplayer
	opentext
	checkevent EVENT_GOT_STARTER
	iftrue .HaveStarter
	writetext .Text_GoToLab
	waitbutton
	closetext
	end

.HaveStarter:
	writetext .Text_CuteMon
	waitbutton
	closetext
	end

.Text_GoToLab:
	text "MOM: PROF.PARK is"
	line "waiting for you."

	para "Head over to the"
	line "#MON lab."
	done

.Text_CuteMon:
	text "MOM: Oh, what a"
	line "cute #MON!"

	para "Did PROF.PARK"
	line "give that to you?"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, OBSIDIAN_TOWN, 1
	warp_event  7,  7, OBSIDIAN_TOWN, 1
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  8,  3, SCENE_PLAYERS_HOUSE_1F_INTRO, 0, PlayersHouse1FSC_MeetMom
	coord_event  9,  3, SCENE_PLAYERS_HOUSE_1F_INTRO, 1, PlayersHouse1FSC_MeetMom
	coord_event  7,  2, SCENE_PLAYERS_HOUSE_1F_INTRO, 2, PlayersHouse1FSC_MeetMom
	coord_event  7,  1, SCENE_PLAYERS_HOUSE_1F_INTRO, 3, PlayersHouse1FSC_MeetMom

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouse1FOB_Mom, -1
