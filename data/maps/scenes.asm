MACRO scene_var
; map, variable
	map_id \1
	dw \2
ENDM

MapScenes::
	scene_var POKECENTER_2F,                               wPokecenter2FSceneID
	scene_var TRADE_CENTER,                                wTradeCenterSceneID
	scene_var COLOSSEUM,                                   wColosseumSceneID
	scene_var TIME_CAPSULE,                                wTimeCapsuleSceneID
	scene_var OBSIDIAN_TOWN,                               wObsidianTownSceneID
	scene_var PARKS_LAB,                                   wParksLabSceneID
	scene_var OBSIDIAN_MEADOW,                             wObsidianMeadowSceneID
	db -1 ; end
