	object_const_def

DeepMossyWoods_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .SetVisited

.SetVisited:
	setevent EVENT_VISITED_DEEP_MOSSY_WOODS
	endcallback

DeepMossyWoods_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events

	def_berry_events
