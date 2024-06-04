	object_const_def
	const CHERTCITY_OBJ1
	const CHERTCITY_OBJ2
	const CHERTCITY_OBJ3
	const CHERTCITY_OBJ4
	const CHERTCITY_OFFICER

ChertCity_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_CHERT_CITY_CANT_LEAVE
	scene_script EmptyScript, SCENE_CHERT_CITY_NONE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlypointCallback

.FlypointCallback:
	setflag ENGINE_FLYPOINT_CHERT
	endcallback

ChertCityCO_CantLeave:
	setlasttalked CHERTCITY_OFFICER
	faceplayer
	textbox .Text_HoldIt
	applymovementparam CHERTCITY_OFFICER, .Move_ToPlayer
	pause 1
	applymovement PLAYER, .Move_FixFacing
	follow PLAYER, CHERTCITY_OFFICER
	applymovement PLAYER, .Move_Left
	stopfollow
	applymovement PLAYER, .Move_RemoveFixedFacing
	textbox .Text_CantLeave
	applymovementparam CHERTCITY_OFFICER, .Move_Return
	end

.Text_HoldIt: ; TO-DO
	text "TODO"
	done

.Text_CantLeave: ; TO-DO
	text "TODO"
	done

.Move_ToPlayer:
	dw .ToPlayer1
	dw .ToPlayer2
.ToPlayer1:
	big_step RIGHT
	big_step UP
	turn_head LEFT
	step_end
.ToPlayer2:
	big_step RIGHT
	big_step DOWN
	turn_head LEFT
	step_end

.Move_FixFacing:
	fix_facing
	step_end

.Move_Left:
	step LEFT
	step_end

.Move_RemoveFixedFacing:
	remove_fixed_facing
	step_end

.Move_Return:
	dw .Return1
	dw .Return2
.Return1:
	step DOWN
	step_end
.Return2:
	step UP
	step_end

ChertCityBG_NameSign:
	jumptext .Text
.Text: ; TO-DO
	text "CHERT CITY"
	done
	
ChertCityBG_PokecenterSign:
	jumpstd PokecenterSignScript

ChertCityBG_PokemartSign:
	jumpstd MartSignScript

ChertCityBG_GymSign:
	jumptext .Text
.Text: ; TO-DO
	text "CHERT CITY"
	line "#MON GYM"
	cont "LEADER: KATRINA"

	para "-"
	done

ChertCityBG_FlowerPark:
	jumptext .Text
.Text: ; TO-DO
	text "FLOWER PARK"
	done

ChertCityBG_HISuperPotion:
	hiddenitem SUPER_POTION, EVENT_CHERT_CITY_HIDDEN_SUPER_POTION

ChertCityOB_Officer:
	jumptextfaceplayer .Text
.Text: ; TO-DO
	text "TODO"
	done

ChertCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  6, CHERT_CITY_MOSSY_WOODS_GATE, 3
	warp_event  2,  7, CHERT_CITY_MOSSY_WOODS_GATE, 4
	warp_event  7,  3, CHERT_POKECENTER_1F, 1
	warp_event  3, 11, CHERT_MART, 2
	warp_event 14, 15, CHERT_GYM, 1
	warp_event 17, 25, CHERT_FLOWER_SHOP, 2
	warp_event 15,  3, CHERT_HOUSE_1, 1
	warp_event  1, 29, CHERT_HOUSE_2, 1

	def_coord_events
	coord_event 17,  4, SCENE_CHERT_CITY_CANT_LEAVE, 0, ChertCityCO_CantLeave
	coord_event 17,  6, SCENE_CHERT_CITY_CANT_LEAVE, 1, ChertCityCO_CantLeave

	def_bg_events
	bg_event  8, 10, BGEVENT_READ, ChertCityBG_NameSign
	bg_event  8,  3, BGEVENT_READ, ChertCityBG_PokecenterSign
	bg_event  4, 11, BGEVENT_READ, ChertCityBG_PokemartSign
	bg_event 16, 16, BGEVENT_READ, ChertCityBG_GymSign
	bg_event 15, 31, BGEVENT_READ, ChertCityBG_FlowerPark
	bg_event 11, 14, BGEVENT_ITEM, ChertCityBG_HISuperPotion

	def_object_events
	object_event  6, 17, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10, 34, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11, 29, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13, 26, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17,  5, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChertCityOB_Officer, EVENT_CHERT_CITY_OFFICER

	def_berry_events
	berry_event 10, 24, BERRYPLOT_CHERT_CITY_1
	berry_event 11, 24, BERRYPLOT_CHERT_CITY_2
	berry_event 14, 24, BERRYPLOT_CHERT_CITY_3
	berry_event 15, 24, BERRYPLOT_CHERT_CITY_4
