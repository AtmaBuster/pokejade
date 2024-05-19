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
	map_const MOSSY_WOODS,                                 20, 20 ;  1
	map_const VICTORY_ROAD,                                10, 36 ;  2
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
	map_const ROUTE_N02,                                   20, 10 ;  2
	map_const SHALE_POKECENTER_1F,                          5,  4 ;  3
	map_const SHALE_MART,                                   6,  4 ;  4
	map_const SHALE_HOUSE_1,                                4,  4 ;  5
	map_const SHALE_HOUSE_2,                                4,  4 ;  6
	map_const ROUTE_N02_DAYCARE,                            4,  3 ;  7
	map_const ROUTE_N02_MOSSY_WOODS_GATE,                   5,  4 ;  8
	endgroup

	newgroup CHERT                                                ;  5
	map_const CHERT_CITY,                                  10, 20 ;  1
	map_const ROUTE_N03,                                   20, 10 ;  2
	map_const ROUTE_N08,                                   20, 10 ;  3
	map_const ROUTE_N09,                                   10, 20 ;  4
	map_const CHERT_CITY_MOSSY_WOODS_GATE,                  5,  4 ;  5
	endgroup

	newgroup CITY04                                               ;  6
	map_const CITY_04,                                     20, 20 ;  1
	map_const ROUTE_N04,                                   10, 20 ;  2
	endgroup

	newgroup COQUINA                                              ;  7
	map_const COQUINA_TOWN,                                10, 10 ;  1
	map_const ROUTE_N06,                                   50, 10 ;  2
	map_const ROUTE_N07,                                   10, 20 ;  3
	endgroup

	newgroup TOWN06                                               ;  8
	map_const TOWN_06,                                     10, 10 ;  1
	map_const ROUTE_N05,                                   10, 40 ;  2
	endgroup

	newgroup CITY05                                               ;  9
	map_const CITY_05_WEST,                                20, 20 ;  1
	map_const CITY_05_EAST,                                20, 20 ;  2
	endgroup

	newgroup TOWN08                                               ; 10
	map_const TOWN_08,                                     10, 10 ;  1
	map_const ROUTE_N10,                                   10, 40 ;  2
	endgroup

	newgroup TOWN09                                               ; 11
	map_const TOWN_09,                                     10, 10 ;  1
	map_const ROUTE_N11,                                   30, 10 ;  2
	map_const ROUTE_N12,                                   10, 40 ;  3
	endgroup

	newgroup CITY10                                               ; 12
	map_const CITY_10,                                     10, 20 ;  1
	map_const ROUTE_N13,                                   30, 10 ;  2
	endgroup

	newgroup CITY11                                               ; 13
	map_const CITY_11,                                     20, 20 ;  1
	map_const ROUTE_N14,                                   40, 10 ;  2
	endgroup

	newgroup TOWN12                                               ; 14
	map_const TOWN_12,                                     10, 10 ;  1
	map_const ROUTE_N15,                                   10, 50 ;  2
	endgroup

	newgroup CITY13                                               ; 15
	map_const CITY_13,                                     10, 10 ;  1
	endgroup

DEF NUM_MAP_GROUPS EQU const_value
