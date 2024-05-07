	object_const_def

NewBarkTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NewBarkTownFlypointCallback

NewBarkTownFlypointCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	endcallback

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, PLAYERS_HOUSE_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
