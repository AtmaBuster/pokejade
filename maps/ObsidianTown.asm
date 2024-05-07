	object_const_def

ObsidianTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ObsidianTownFlypointCallback

ObsidianTownFlypointCallback:
	setflag ENGINE_FLYPOINT_OBSIDIAN
	endcallback

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
	text "PROF #MON LAB"
	done

ObsidianTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, PLAYERS_HOUSE_1F, 1
	warp_event 14, 15, OBSIDIAN_TOWN, 1
	warp_event  9,  9, OBSIDIAN_TOWN, 1

	def_coord_events

	def_bg_events
	bg_event 15,  5, BGEVENT_READ, ObsidianTownBG_NameSign
	bg_event  1,  9, BGEVENT_READ, ObsidianTownBG_PlayersHouse
	bg_event  7,  9, BGEVENT_READ, ObsidianTownBG_RivalsHouse
	bg_event 11, 15, BGEVENT_READ, ObsidianTownBG_Lab

	def_object_events
