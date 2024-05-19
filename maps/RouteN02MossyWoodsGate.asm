	object_const_def

RouteN02MossyWoodsGate_MapScripts:
	def_scene_scripts

	def_callbacks

RouteN02MossyWoodsGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, MOSSY_WOODS, 1
	warp_event  5,  0, MOSSY_WOODS, 2
	warp_event  4,  7, ROUTE_N02, 2
	warp_event  5,  7, ROUTE_N02, 2

	def_coord_events

	def_bg_events

	def_object_events

	def_berry_events
