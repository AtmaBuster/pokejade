	object_const_def
	const OBSIDIANMEADOW_PROF
	const OBSIDIANMEADOW_RIVAL
	const OBSIDIANMEADOW_TREECKO
	const OBSIDIANMEADOW_TORCHIC
	const OBSIDIANMEADOW_MUDKIP

ObsidianMeadow_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_OBSIDIAN_MEADOW_INIT
	scene_script EmptyScript, SCENE_OBSIDIAN_MEADOW_STARTER
	scene_script EmptyScript, SCENE_OBSIDIAN_MEADOW_NONE

	def_callbacks

ObsidianMeadowCO_ApproachOak:
	special InitStarterMonData
	turnobject OBSIDIANMEADOW_PROF, LEFT
	opentext
	writetext .Text_ComeHere
	waitbutton
	closetext
	applymovementparam PLAYER, .Move_ApproachOak
	opentext
	writetext .Text_HelpMe
	waitbutton
	verbosegiveitem POKE_BALL
	writetext ObsidianMeadowTx_UseBall
	waitbutton
	closetext
	setscene SCENE_OBSIDIAN_MEADOW_STARTER
	end

.Text_ComeHere:
	text "PROF.PARK: Hurry,"
	line "<PLAYER>, over"
	cont "here!"
	done

.Text_HelpMe:
	text "<PLAYER>, help me"
	line "find the escaped"
	cont "#MON and re-"
	cont "capture them!"

	para "I'll give you this"
	line "# BALL."
	done

.Move_ApproachOak:
	dw .Approach1
	dw .Approach2
.Approach1:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
.Approach2:
	step RIGHT
	step UP
	step RIGHT
	step RIGHT
	step_end

ObsidianMeadowCO_ComeBack:
	turnobject OBSIDIANMEADOW_PROF, LEFT
	opentext
	writetext .Text_ComeBack
	waitbutton
	closetext
	applymovement PLAYER, .Move_Right
	end

.Text_ComeBack:
	text "PROF.PARK: Where"
	line "are you going?"

	para "Come back here,"
	line "<PLAYER>!"
	done

.Move_Right:
	step RIGHT
	step_end

ObsidianMeadowOB_Prof:
	faceplayer
	opentext
	checkitem POKE_BALL
	iftrue .Explain
	writetext .Text_NoBall
	waitbutton
	verbosegiveitem POKE_BALL
.Explain:
	writetext ObsidianMeadowTx_UseBall
	waitbutton
	closetext
	end

.Text_NoBall:
	text "PROF.PARK: What"
	line "happened to the"
	cont "# BALL I gave"
	cont "you?"

	para "Here, have another"
	line "one. Make sure not"
	cont "to lose it!"
	done

ObsidianMeadowTx_UseBall:
	text "Just throw that"
	line "at one of the"
	cont "#MON to capture"
	cont "it."
	done

ObsidianMeadowOB_Treecko:
	reanchormap
	disappear OBSIDIANMEADOW_TREECKO
	pokepic TREECKO
	cry TREECKO
	waitbutton
	closepokepic
	appear OBSIDIANMEADOW_TREECKO
	opentext
	writetext .Text_AskTreecko
	yesorno
	iffalse ObsidianMeadowScr_DidntCapture
	checkitem POKE_BALL
	iffalse ObsidianMeadowScr_TossedBall
	closetext
	loadwildmon TREECKO, 5
	setevent EVENT_GOT_TREECKO
	special CheckStarterForceShiny
	dontrestartmapmusic
	catchtutorial BATTLETYPE_TUTORIAL
	playmusic MUSIC_OBSIDIAN_TOWN
	disappear OBSIDIANMEADOW_TREECKO
	turnobject PLAYER, RIGHT
	readvar VAR_XCOORD
	ifequal 4, .XEQ4
	moveobject OBSIDIANMEADOW_PROF, 9, 13
	moveobject OBSIDIANMEADOW_RIVAL, 9, 13
	appear OBSIDIANMEADOW_PROF
	appear OBSIDIANMEADOW_RIVAL
	follow OBSIDIANMEADOW_PROF, OBSIDIANMEADOW_RIVAL
	applymovement OBSIDIANMEADOW_PROF, .Move_GoToPlayer
	sjump ObsidianMeadowScr_AfterStarter

.XEQ4:
	moveobject OBSIDIANMEADOW_PROF, 10, 14
	moveobject OBSIDIANMEADOW_RIVAL, 10, 14
	appear OBSIDIANMEADOW_PROF
	appear OBSIDIANMEADOW_RIVAL
	follow OBSIDIANMEADOW_PROF, OBSIDIANMEADOW_RIVAL
	applymovement OBSIDIANMEADOW_PROF, .Move_GoToPlayer
	sjump ObsidianMeadowScr_AfterStarter

.Text_AskTreecko:
	text "Capture TREECKO,"
	line "the GRASS #MON?"
	done

.Move_GoToPlayer:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end

ObsidianMeadowOB_Torchic:
	reanchormap
	disappear OBSIDIANMEADOW_TORCHIC
	pokepic TORCHIC
	cry TORCHIC
	waitbutton
	closepokepic
	appear OBSIDIANMEADOW_TORCHIC
	opentext
	writetext .Text_AskTorchic
	yesorno
	iffalse ObsidianMeadowScr_DidntCapture
	checkitem POKE_BALL
	iffalse ObsidianMeadowScr_TossedBall
	closetext
	loadwildmon TORCHIC, 5
	setevent EVENT_GOT_TORCHIC
	special CheckStarterForceShiny
	dontrestartmapmusic
	catchtutorial BATTLETYPE_TUTORIAL
	playmusic MUSIC_OBSIDIAN_TOWN
	disappear OBSIDIANMEADOW_TORCHIC
	turnobject PLAYER, LEFT
	readvar VAR_XCOORD
	ifequal 13, .XEQ13
	moveobject OBSIDIANMEADOW_PROF, 9, 14
	moveobject OBSIDIANMEADOW_RIVAL, 9, 14
	appear OBSIDIANMEADOW_PROF
	appear OBSIDIANMEADOW_RIVAL
	follow OBSIDIANMEADOW_PROF, OBSIDIANMEADOW_RIVAL
	applymovement OBSIDIANMEADOW_PROF, .Move_GoToPlayer1
	turnobject PLAYER, DOWN
	sjump ObsidianMeadowScr_AfterStarter

.XEQ13:
	moveobject OBSIDIANMEADOW_PROF, 8, 14
	moveobject OBSIDIANMEADOW_RIVAL, 8, 14
	appear OBSIDIANMEADOW_PROF
	appear OBSIDIANMEADOW_RIVAL
	follow OBSIDIANMEADOW_PROF, OBSIDIANMEADOW_RIVAL
	applymovement OBSIDIANMEADOW_PROF, .Move_GoToPlayer2
	turnobject PLAYER, DOWN
	sjump ObsidianMeadowScr_AfterStarter

.Text_AskTorchic:
	text "Capture TORCHIC,"
	line "the FIRE #MON?"
	done

.Move_GoToPlayer1:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

.Move_GoToPlayer2:
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

ObsidianMeadowOB_Mudkip:
	reanchormap
	disappear OBSIDIANMEADOW_MUDKIP
	pokepic MUDKIP
	cry MUDKIP
	waitbutton
	closepokepic
	appear OBSIDIANMEADOW_MUDKIP
	opentext
	writetext .Text_AskMudkip
	yesorno
	iffalse ObsidianMeadowScr_DidntCapture
	checkitem POKE_BALL
	iffalse ObsidianMeadowScr_TossedBall
	closetext
	loadwildmon MUDKIP, 5
	setevent EVENT_GOT_MUDKIP
	special CheckStarterForceShiny
	dontrestartmapmusic
	catchtutorial BATTLETYPE_TUTORIAL
	playmusic MUSIC_OBSIDIAN_TOWN
	disappear OBSIDIANMEADOW_MUDKIP
	turnobject PLAYER, LEFT
	moveobject OBSIDIANMEADOW_PROF, 10, 13
	moveobject OBSIDIANMEADOW_RIVAL, 10, 13
	appear OBSIDIANMEADOW_PROF
	appear OBSIDIANMEADOW_RIVAL
	follow OBSIDIANMEADOW_PROF, OBSIDIANMEADOW_RIVAL
	applymovement OBSIDIANMEADOW_PROF, .Move_GoToPlayer
	turnobject OBSIDIANMEADOW_RIVAL, RIGHT
	sjump ObsidianMeadowScr_AfterStarter

.Text_AskMudkip:
	text "Capture MUDKIP,"
	line "the WATER #MON?"
	done

.Move_GoToPlayer:
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

ObsidianMeadowScr_DidntCapture:
	closetext
	end

ObsidianMeadowScr_TossedBall:
	writetext .Text_NoBall
	waitbutton
	closetext
	end
.Text_NoBall:
	text "You don't have a"
	line "# BALL!"

	para "Ask PROF.PARK for"
	line "another one."
	done

ObsidianMeadowScr_AfterStarter:
	takeitem POKE_BALL
	setscene SCENE_OBSIDIAN_MEADOW_NONE
	opentext
	writetext .Text_BackToLab
	waitbutton
	closetext
	special FadeOutToWhite
	disappear OBSIDIANMEADOW_PROF
	disappear OBSIDIANMEADOW_RIVAL
	clearevent EVENT_PARKS_LAB_PROF
	clearevent EVENT_PARKS_LAB_RIVAL
	setmapscene PARKS_LAB, SCENE_PARKS_LAB_AFTER_STARTER
	warpfacing UP, PARKS_LAB, 4, 5
	end

.Text_BackToLab:
	text "PROF.PARK: Good"
	line "work, <PLAYER>!"

	para "<RIVAL> and I"
	line "managed to capture"
	cont "the other two"
	cont "#MON."

	para "Let's head back"
	line "to my lab so we"
	cont "can talk."
	done

ObsidianMeadowOB_Rival:
	faceplayer
	opentext
	writetext .Text_Helping
	waitbutton
	closetext
	end

.Text_Helping:
	text "<RIVAL>: We need"
	line "to rescue the"
	cont "#MON quickly!"
	done

ObsidianMeadow_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  8, PARKS_LAB, 3
	warp_event  0,  9, PARKS_LAB, 4

	def_coord_events
	coord_event  1,  8, SCENE_OBSIDIAN_MEADOW_INIT, 0, ObsidianMeadowCO_ApproachOak
	coord_event  1,  9, SCENE_OBSIDIAN_MEADOW_INIT, 1, ObsidianMeadowCO_ApproachOak
	coord_event  2,  8, SCENE_OBSIDIAN_MEADOW_STARTER, 0, ObsidianMeadowCO_ComeBack
	coord_event  2,  9, SCENE_OBSIDIAN_MEADOW_STARTER, 0, ObsidianMeadowCO_ComeBack

	def_bg_events

	def_object_events
	object_event  5,  8, SPRITE_OAK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObsidianMeadowOB_Prof, EVENT_OBSIDIAN_MEADOW_PROF
	object_event  7,  6, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObsidianMeadowOB_Rival, EVENT_OBSIDIAN_MEADOW_RIVAL
	object_event  3, 16, SPRITE_TREECKO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObsidianMeadowOB_Treecko, EVENT_OBSIDIAN_MEADOW_STARTERS
	object_event 14, 14, SPRITE_TORCHIC, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObsidianMeadowOB_Torchic, EVENT_OBSIDIAN_MEADOW_STARTERS
	object_event 13,  8, SPRITE_MUDKIP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObsidianMeadowOB_Mudkip, EVENT_OBSIDIAN_MEADOW_STARTERS
	object_event -4, 1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
