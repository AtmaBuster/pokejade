	object_const_def
	const OBSIDIANTOWN_TEACHER
	const OBSIDIANTOWN_FISHER
	const OBSIDIANTOWN_PROF
	const OBSIDIANTOWN_RIVAL
	const OBSIDIANTOWN_POKE_BALL

ObsidianTown_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_OBSIDIAN_TOWN_CANT_LEAVE
	scene_script EmptyScript, SCENE_OBSIDIAN_TOWN_FORCE_LAB
	scene_script EmptyScript, SCENE_OBSIDIAN_TOWN_RIVAL_BATTLE
	scene_script EmptyScript, SCENE_OBSIDIAN_TOWN_NONE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlypointCallback

.FlypointCallback:
	setflag ENGINE_FLYPOINT_OBSIDIAN
	endcallback

ObsidianTownCO_CantLeave:
	turnobject OBSIDIANTOWN_TEACHER, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, OBSIDIANTOWN_TEACHER, 15
	applymovementparam OBSIDIANTOWN_TEACHER, .Move_ApproachPlayer
	opentext
	writetext .Text1
	waitbutton
	closetext
	follow OBSIDIANTOWN_TEACHER, PLAYER
	applymovement OBSIDIANTOWN_TEACHER, .Move_WalkBack
	stopfollow
	opentext
	writetext .Text2
	waitbutton
	closetext
	applymovementparam OBSIDIANTOWN_TEACHER, .Move_Return
	end

.Text1:
	text "<PLAYER>, wait!"
	line "Come back here!"
	done

.Text2:
	text "You can't go out"
	line "without a #MON"
	cont "to protect you."
	done

.Move_ApproachPlayer:
	dw .ApproachL
	dw .ApproachR
.ApproachR:
	step RIGHT
.ApproachL:
	step UP
	step UP
	step UP
	step_end

.Move_WalkBack:
	step DOWN
	turn_head UP
	step_end

.Move_Return:
	dw .ReturnL
	dw .ReturnR
.ReturnL:
	step DOWN
	step DOWN
	step_end
.ReturnR:
	step DOWN
	step DOWN
	step LEFT
	step_end

ObsidianTownCO_ApproachLab:
	appear OBSIDIANTOWN_PROF
	playsound SFX_ENTER_DOOR
	applymovement OBSIDIANTOWN_PROF, .Move_WalkDown
	waitsfx
	turnobject OBSIDIANTOWN_PROF, LEFT
	showemote EMOTE_SHOCK, OBSIDIANTOWN_PROF, 15
	playmusic MUSIC_OFFICER_ENCOUNTER ; TO-DO
	callasm .SetMapMusic
	applymovementparam OBSIDIANTOWN_PROF, .Move_ApproachPlayer
	opentext
	writetext .Text_ComeWithMe
	waitbutton
	closetext
	applymovementparam OBSIDIANTOWN_PROF, .Move_ReturnToLab
	disappear OBSIDIANTOWN_PROF
	playsound SFX_ENTER_DOOR
	waitsfx
	pause 15
	appear OBSIDIANTOWN_PROF
	playsound SFX_ENTER_DOOR
	applymovement OBSIDIANTOWN_PROF, .Move_WalkDown
	waitsfx
	turnobject OBSIDIANTOWN_PROF, LEFT
	opentext
	writetext .Text_Hurry
	waitbutton
	closetext
	applymovement OBSIDIANTOWN_PROF, .Move_WalkUp
	disappear OBSIDIANTOWN_PROF
	playsound SFX_ENTER_DOOR
	waitsfx
	setscene SCENE_OBSIDIAN_TOWN_FORCE_LAB
	end

.Text_ComeWithMe:
	text "PROF.PARK:"
	line "<PLAYER>! I need"
	cont "your help!"

	para "The #MON that"
	line "I keep in my lab…"

	para "They've escaped!"
	line "Into the meadow!"

	para "You need to help"
	line "me capture them!"
	done

.Text_Hurry:
	text "What are you"
	line "waiting for?"

	para "Hurry!"
	done

.Move_WalkDown:
	step DOWN
	step_end

.Move_ApproachPlayer:
	dw .Approach1
	dw .Approach2
	dw .Approach3
.Approach3:
	big_step DOWN
.Approach2:
	big_step DOWN
.Approach1:
	big_step LEFT
	big_step LEFT
	step_end

.Move_ReturnToLab:
	dw .Return1
	dw .Return2
	dw .Return3
.Return1:
	big_step RIGHT
	big_step RIGHT
.Move_WalkUp:
	big_step UP
	step_end
.Return2:
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	step_end
.Return3:
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	step_end

.SetMapMusic:
	ld hl, wScriptPos
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, -6
	add hl, bc
	ld a, [hl]
	ld [wMapMusic], a
	ret

ObsidianTownCO_ForceLab:
	applymovementparam OBSIDIANTOWN_FISHER, .Move_ApproachPlayer
	opentext
	writetext .Text
	waitbutton
	closetext
	applymovementparam OBSIDIANTOWN_FISHER, .Move_Return
	applymovement PLAYER, .Move_Right
	end

.Text:
	text "Where are you"
	line "going, <PLAYER>?"

	para "The PROF. needs"
	line "your help!"
	done

.Move_ApproachPlayer:
	dw .Approach1
	dw .Approach2
	dw .Approach3
.Approach1:
	step UP
.Approach2:
	step UP
.Approach3:
	step RIGHT
	step RIGHT
	step_end

.Move_Return:
	dw .Return1
	dw .Return2
	dw .Return3
.Return1:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end
.Return2:
	step LEFT
	step LEFT
	step DOWN
	step_end
.Return3:
	step LEFT
	step LEFT
	step_end

.Move_Right:
	step RIGHT
	step_end

ObsidianTownCO_RivalBattle:
	opentext
	writetext .Text_Wait
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	playmusic MUSIC_RIVAL_ENCOUNTER
	sjumpparam .MoveIfParam1
.MoveIfParam1:
	dw .Param0
	dw .Param1
.Param1:
	moveobject OBSIDIANTOWN_RIVAL, 10, 11
.Param0:
	appear OBSIDIANTOWN_RIVAL
	applymovement OBSIDIANTOWN_RIVAL, .Move_ApproachPlayer
	opentext
	writetext .Text_Battle
	waitbutton
	closetext
	winlosstext .Text_PlayerWin, .Text_PlayerLose
	setlasttalked OBSIDIANTOWN_RIVAL
	loadrival RIVAL1, RIVAL1_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext .Text_BackToLab
	waitbutton
	closetext
	applymovement OBSIDIANTOWN_RIVAL, .Move_Leave
	disappear OBSIDIANTOWN_RIVAL
	setscene SCENE_OBSIDIAN_TOWN_NONE
	special HealParty
	playmapmusic
	end

.Text_Wait:
	text "<RIVAL>: <PLAYER>!"
	line "Wait up!"
	done

.Text_Battle:
	text "<RIVAL>: <PLAYER>!"
	line "We both have"
	cont "#MON now. Do"
	cont "you know what that"
	cont "means?"

	para "It means we're"
	line "both #MON"
	cont "trainers! And"
	cont "#MON trainers"
	cont "have to battle!"

	para "I won't take “no”"
	line "for an answer!"
	done

.Text_PlayerWin:
	text "<RIVAL>: Man."
	line "You're tough"
	cont "<PLAYER>."
	done

.Text_PlayerLose:
	text "<RIVAL>: That was"
	line "a good battle,"
	cont "<PLAYER>."
	done

.Text_BackToLab:
	text "It's hard to tell"
	line "early on who the"
	cont "better trainer is."

	para "We should battle"
	line "again later to"
	cont "figure out who's"
	cont "the best!"

	para "Anyway, I need to"
	line "head back to the"
	cont "lab. I've got more"
	cont "work to do."

	para "See you around!"
	done

.Move_ApproachPlayer:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

.Move_Leave:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

ObsidianTownBG_NameSign:
	jumptext .Text
.Text:
	text "OBSIDIAN TOWN"

	para "A rock-solid"
	line "foundation for a"
	cont "new journey."
	done

ObsidianTownBG_PlayersHouse:
	jumptext .Text
.Text:
	text "<PLAYER>'s House"
	done

ObsidianTownBG_RivalsHouse:
	jumptext .Text
.Text:
	text "<RIVAL>'s House"
	done

ObsidianTownBG_Lab:
	jumptext .Text
.Text:
	text "PARK #MON LAB"
	done

ObsidianTownOB_Teacher:
	faceplayer
	opentext
	writetext .Text
	waitbutton
	closetext
	turnobject OBSIDIANTOWN_TEACHER, DOWN
	end
.Text:
	text "I love watching"
	line "the stream flow."

	para "Sometimes I wish I"
	line "could just lie"
	cont "down on the water"
	cont "and let it take me"
	cont "wherever it thinks"
	cont "I need to go."
	done

ObsidianTownOB_Fisher:
	jumptextfaceplayer .Text
.Text:
	text "Technology is"
	line "incredible!"

	para "You can now take"
	line "the code from your"
	cont "favorite games and"
	cont "change it to make"
	cont "your very own"
	cont "masterpiece!"
	done

ObsidianTownOB_RareCandy:
	itemball RARE_CANDY

ObsidianTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, PLAYERS_HOUSE_1F, 1
	warp_event 16, 15, PARKS_LAB, 1
	warp_event  9,  9, RIVALS_HOUSE, 2

	def_coord_events
	coord_event 16,  3, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 0, ObsidianTownCO_CantLeave
	coord_event 17,  3, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 1, ObsidianTownCO_CantLeave
	coord_event 13, 16, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 0, ObsidianTownCO_ApproachLab
	coord_event 13, 17, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 1, ObsidianTownCO_ApproachLab
	coord_event 13, 18, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 2, ObsidianTownCO_ApproachLab
	coord_event 12, 16, SCENE_OBSIDIAN_TOWN_FORCE_LAB, 0, ObsidianTownCO_ForceLab
	coord_event 12, 17, SCENE_OBSIDIAN_TOWN_FORCE_LAB, 1, ObsidianTownCO_ForceLab
	coord_event 12, 18, SCENE_OBSIDIAN_TOWN_FORCE_LAB, 2, ObsidianTownCO_ForceLab
	coord_event 14,  8, SCENE_OBSIDIAN_TOWN_RIVAL_BATTLE, 0, ObsidianTownCO_RivalBattle
	coord_event 15,  8, SCENE_OBSIDIAN_TOWN_RIVAL_BATTLE, 1, ObsidianTownCO_RivalBattle

	def_bg_events
	bg_event 15,  5, BGEVENT_READ, ObsidianTownBG_NameSign
	bg_event  1,  9, BGEVENT_READ, ObsidianTownBG_PlayersHouse
	bg_event  7,  9, BGEVENT_READ, ObsidianTownBG_RivalsHouse
	bg_event 13, 15, BGEVENT_READ, ObsidianTownBG_Lab

	def_object_events
	object_event 16,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObsidianTownOB_Teacher, -1
	object_event  9, 18, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObsidianTownOB_Fisher, -1
	object_event 16, 15, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_OBSIDIAN_TOWN_PROF
	object_event  9, 11, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_OBSIDIAN_TOWN_RIVAL
	object_event  2,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ObsidianTownOB_RareCandy, EVENT_OBSIDIAN_TOWN_RARE_CANDY

	def_berry_events