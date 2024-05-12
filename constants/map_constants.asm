MACRO newgroup
;\1: group id
	const_skip
	DEF MAPGROUP_\1 EQU const_value
	DEF CURRENT_NUM_MAPGROUP_MAPS EQUS "NUM_\1_MAPS"
	DEF __map_value__ = 1
ENDM

MACRO map_const
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
	DEF GROUP_\1 EQU const_value
	DEF MAP_\1 EQU __map_value__
	DEF __map_value__ += 1
	DEF \1_WIDTH EQU \2
	DEF \1_HEIGHT EQU \3
ENDM

MACRO endgroup
	DEF {CURRENT_NUM_MAPGROUP_MAPS} EQU __map_value__ - 1
	PURGE CURRENT_NUM_MAPGROUP_MAPS
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; `map_const` indexes are for the sub-tables of MapGroupPointers (see data/maps/maps.asm)
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup CABLE_CLUB                                           ;  1
	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3
	map_const TIME_CAPSULE,                                 5,  4 ;  4
IF DEF(_DEBUG)
	map_const DEBUG_ROOM,                                  10, 10 ;  5
ENDC
	endgroup

	newgroup DUNGEONS                                             ;  2
	map_const VICTORY_ROAD,                                10, 36 ;  1
	endgroup

	newgroup OBSIDIAN                                             ;  3
	map_const OBSIDIAN_TOWN,                               10, 10 ;  1
	map_const OBSIDIAN_MEADOW,                             10, 10 ;  2
	map_const ROUTE_N01,                                   10, 15 ;  3
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  4
	map_const PLAYERS_HOUSE_2F,                             4,  3 ;  5
	map_const PARKS_LAB,                                    5,  6 ;  6
	map_const RIVALS_HOUSE,                                 5,  4 ;  7
	endgroup

	newgroup SHALE                                                ;  4
	map_const SHALE_CITY,                                  20, 10 ;  1
	map_const SHALE_POKECENTER_1F,                          5,  4 ;  2
	map_const SHALE_MART,                                   6,  4 ;  3
	map_const SHALE_HOUSE_1,                                4,  4 ;  4
	map_const SHALE_HOUSE_2,                                4,  4 ;  5
	endgroup

DEF NUM_MAP_GROUPS EQU const_value
