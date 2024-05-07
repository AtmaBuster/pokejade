	object_const_def

PlayersHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 1
	warp_event  7,  7, NEW_BARK_TOWN, 1
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
