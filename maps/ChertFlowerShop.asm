	object_const_def

ChertFlowerShop_MapScripts:
	def_scene_scripts

	def_callbacks

ChertFlowerShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERT_CITY, 6
	warp_event  3,  7, CHERT_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  2, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	def_berry_events
