	object_const_def

ShaleMart_MapScripts:
	def_scene_scripts

	def_callbacks

ShaleMartOB_Clerk:
	opentext
	checkevent EVENT_GOT_POKEDEX
	iftrue .HasBalls
	pokemart MARTTYPE_STANDARD, MART_SHALE
	closetext
	end

.HasBalls:
	pokemart MARTTYPE_STANDARD, MART_SHALE_DEX
	closetext
	end

ShaleMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SHALE_CITY, 2
	warp_event  3,  7, SHALE_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShaleMartOB_Clerk, -1

	def_berry_events