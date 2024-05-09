	object_const_def
	const PARKSLAB_PROF

ParksLab_MapScripts:
	def_scene_scripts
	scene_script EmptyScript, SCENE_PARKS_LAB_INIT

	def_callbacks

ParksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, OBSIDIAN_TOWN, 2
	warp_event  5, 11, OBSIDIAN_TOWN, 2
	warp_event  9,  6, OBSIDIAN_MEADOW, 1
	warp_event  9,  7, OBSIDIAN_MEADOW, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PARKS_LAB_PROF
