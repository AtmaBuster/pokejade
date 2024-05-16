MACRO scene_var
; map, variable
	map_id \1
	dw \2
ENDM

MapScenes::
	scene_var POKECENTER_2F,    wPokecenter2FSceneID
	scene_var TRADE_CENTER,     wTradeCenterSceneID
	scene_var COLOSSEUM,        wColosseumSceneID
	scene_var TIME_CAPSULE,     wTimeCapsuleSceneID
	scene_var OBSIDIAN_TOWN,    wObsidianTownSceneID
	scene_var PARKS_LAB,        wParksLabSceneID
	scene_var OBSIDIAN_MEADOW,  wObsidianMeadowSceneID
	scene_var PLAYERS_HOUSE_1F, wPlayersHouse1FSceneID
	scene_var SHALE_CITY,       wShaleCitySceneID
	scene_var ROUTE_N02,        wRouteN02SceneID
	db -1 ; end
