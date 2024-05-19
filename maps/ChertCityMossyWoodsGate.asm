	object_const_def

ChertCityMossyWoodsGate_MapScripts:
	def_scene_scripts

	def_callbacks

ChertCityMossyWoodsGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, MOSSY_WOODS, 3
	warp_event  0,  5, MOSSY_WOODS, 4
	warp_event  9,  4, CHERT_CITY, 1
	warp_event  9,  5, CHERT_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	def_berry_events
