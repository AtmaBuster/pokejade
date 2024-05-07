	object_const_def

VictoryRoad_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoad_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1, 49, VICTORY_ROAD, 3
	warp_event  1, 35, VICTORY_ROAD, 2
	warp_event 13, 31, VICTORY_ROAD, 5
	warp_event 13, 17, VICTORY_ROAD, 4
	warp_event 17, 33, VICTORY_ROAD, 7
	warp_event 17, 19, VICTORY_ROAD, 6
	warp_event  0, 11, VICTORY_ROAD, 9
	warp_event  0, 27, VICTORY_ROAD, 8

	def_coord_events

	def_bg_events

	def_object_events
