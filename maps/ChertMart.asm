	object_const_def

ChertMart_MapScripts:
	def_scene_scripts

	def_callbacks

ChertMartOB_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CHERT
	closetext
	end

ChertMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERT_CITY, 4
	warp_event  3,  7, CHERT_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChertMartOB_Clerk, -1

	def_berry_events
