	object_const_def
	const OBSIDIANTOWN_TEACHER
	const OBSIDIANTOWN_FISHER
	const OBSIDIANTOWN_PROF
	const OBSIDIANTOWN_POKE_BALL

ObsidianTown_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_OBSIDIAN_TOWN_CANT_LEAVE
	scene_script EmptyScript, SCENE_OBSIDIAN_TOWN_FORCE_LAB
	scene_script EmptyScript, SCENE_OBSIDIAN_TOWN_NONE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ObsidianTownFlypointCallback

ObsidianTownFlypointCallback:
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

.Text1: ; TO-DO
	text "bruh what are"
	line "you DOIN"
	done

.Text2: ; TO-DO
	text "get the FUCK"
	line "back in here."

	para "shit's mad scary"
	line "out there"
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
	text "PROF. PARK:"
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
	ld a, [wScriptPos]
	ld l, a
	ld a, [wScriptPos + 1]
	ld h, a
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
	jumptextfaceplayer .Text
.Text: ; TO-DO
	text "TO-DO"
	done

ObsidianTownOB_Fisher:
	jumptextfaceplayer .Text
.Text: ; TO-DO
	text "Technology is"
	line "incredible!"

	para "You can now"
	line "skibidi rizz"
	cont "gyatt ohio"
	cont "sigma fortnite!"
	done

ObsidianTownOB_RareCandy:
	itemball RARE_CANDY

ObsidianTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, PLAYERS_HOUSE_1F, 1
	warp_event 16, 15, PARKS_LAB, 1
	warp_event  9,  9, OBSIDIAN_TOWN, 1

	def_coord_events
	coord_event 16,  3, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 0, ObsidianTownCO_CantLeave
	coord_event 17,  3, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 1, ObsidianTownCO_CantLeave
	coord_event 13, 16, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 0, ObsidianTownCO_ApproachLab
	coord_event 13, 17, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 1, ObsidianTownCO_ApproachLab
	coord_event 13, 18, SCENE_OBSIDIAN_TOWN_CANT_LEAVE, 2, ObsidianTownCO_ApproachLab
	coord_event 12, 16, SCENE_OBSIDIAN_TOWN_FORCE_LAB, 0, ObsidianTownCO_ForceLab
	coord_event 12, 17, SCENE_OBSIDIAN_TOWN_FORCE_LAB, 1, ObsidianTownCO_ForceLab
	coord_event 12, 18, SCENE_OBSIDIAN_TOWN_FORCE_LAB, 2, ObsidianTownCO_ForceLab

	def_bg_events
	bg_event 15,  5, BGEVENT_READ, ObsidianTownBG_NameSign
	bg_event  1,  9, BGEVENT_READ, ObsidianTownBG_PlayersHouse
	bg_event  7,  9, BGEVENT_READ, ObsidianTownBG_RivalsHouse
	bg_event 13, 15, BGEVENT_READ, ObsidianTownBG_Lab

	def_object_events
	object_event 16,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObsidianTownOB_Teacher, -1
	object_event  9, 18, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObsidianTownOB_Fisher, -1
	object_event 16, 15, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_OBSIDIAN_TOWN_PROF
	object_event  2,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ObsidianTownOB_RareCandy, EVENT_OBSIDIAN_TOWN_RARE_CANDY
