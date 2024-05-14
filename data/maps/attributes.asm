MACRO map_attributes
;\1: map name
;\2: map id
;\3: border block
;\4: connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
	DEF CURRENT_MAP_WIDTH = \2_WIDTH
	DEF CURRENT_MAP_HEIGHT = \2_HEIGHT
\1_MapAttributes::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	db BANK(\1_Blocks)
	dw \1_Blocks
	db BANK(\1_MapScripts) ; aka BANK(\1_MapEvents)
	dw \1_MapScripts
	dw \1_MapEvents
	db \4
ENDM

; Connections go in order: north, south, west, east
MACRO connection
;\1: direction
;\2: map name
;\3: map id
;\4: offset of the target map relative to the current map
;    (x offset for east/west, y offset for north/south)

	; LEGACY: Support for old connection macro
	if _NARG == 6
		connection \1, \2, \3, (\4) - (\5)
	else

		; Calculate tile offsets for source (current) and target maps
		DEF _src = 0
		DEF _tgt = (\4) + MAP_CONNECTION_PADDING_WIDTH
		if _tgt < 0
			DEF _src = -_tgt
			DEF _tgt = 0
		endc

		if !STRCMP("\1", "north")
			DEF _blk = \3_WIDTH * (\3_HEIGHT - MAP_CONNECTION_PADDING_WIDTH) + _src
			DEF _map = _tgt
			DEF _win = (\3_WIDTH + MAP_CONNECTION_PADDING_WIDTH * 2) * \3_HEIGHT + 1
			DEF _y = \3_HEIGHT * 2 - 1
			DEF _x = (\4) * -2
			DEF _len = CURRENT_MAP_WIDTH + MAP_CONNECTION_PADDING_WIDTH - (\4)
			if _len > \3_WIDTH
				DEF _len = \3_WIDTH
			endc

		elif !STRCMP("\1", "south")
			DEF _blk = _src
			DEF _map = (CURRENT_MAP_WIDTH + MAP_CONNECTION_PADDING_WIDTH * 2) * (CURRENT_MAP_HEIGHT + MAP_CONNECTION_PADDING_WIDTH) + _tgt
			DEF _win = \3_WIDTH + MAP_CONNECTION_PADDING_WIDTH * 2 + 1
			DEF _y = 0
			DEF _x = (\4) * -2
			DEF _len = CURRENT_MAP_WIDTH + MAP_CONNECTION_PADDING_WIDTH - (\4)
			if _len > \3_WIDTH
				DEF _len = \3_WIDTH
			endc

		elif !STRCMP("\1", "west")
			DEF _blk = (\3_WIDTH * _src) + \3_WIDTH - MAP_CONNECTION_PADDING_WIDTH
			DEF _map = (CURRENT_MAP_WIDTH + MAP_CONNECTION_PADDING_WIDTH * 2) * _tgt
			DEF _win = (\3_WIDTH + MAP_CONNECTION_PADDING_WIDTH * 2) * 2 - MAP_CONNECTION_PADDING_WIDTH * 2
			DEF _y = (\4) * -2
			DEF _x = \3_WIDTH * 2 - 1
			DEF _len = CURRENT_MAP_HEIGHT + MAP_CONNECTION_PADDING_WIDTH - (\4)
			if _len > \3_HEIGHT
				DEF _len = \3_HEIGHT
			endc

		elif !STRCMP("\1", "east")
			DEF _blk = (\3_WIDTH * _src)
			DEF _map = (CURRENT_MAP_WIDTH + MAP_CONNECTION_PADDING_WIDTH * 2) * _tgt + CURRENT_MAP_WIDTH + MAP_CONNECTION_PADDING_WIDTH
			DEF _win = \3_WIDTH + MAP_CONNECTION_PADDING_WIDTH * 2 + 1
			DEF _y = (\4) * -2
			DEF _x = 0
			DEF _len = CURRENT_MAP_HEIGHT + MAP_CONNECTION_PADDING_WIDTH - (\4)
			if _len > \3_HEIGHT
				DEF _len = \3_HEIGHT
			endc

		else
			fail "Invalid direction for 'connection'."
		endc

	map_id \3
	dw \2_Blocks + _blk
	dw wOverworldMapBlocks + _map
	db _len - _src
	db \3_WIDTH
	db _y, _x
	dw wOverworldMapBlocks + _win

	endc
ENDM


	map_attributes ObsidianTown, OBSIDIAN_TOWN, $05, NORTH | EAST
	connection north, RouteN01, ROUTE_N01, 0
	connection east, ObsidianMeadow, OBSIDIAN_MEADOW, 3

	map_attributes ObsidianMeadow, OBSIDIAN_MEADOW, $05, WEST
	connection west, ObsidianTown, OBSIDIAN_TOWN, -3

	map_attributes RouteN01, ROUTE_N01, $05, NORTH | SOUTH
	connection north, ShaleCity, SHALE_CITY, 0
	connection south, ObsidianTown, OBSIDIAN_TOWN, 0

	map_attributes ShaleCity, SHALE_CITY, $05, SOUTH | EAST
	connection south, RouteN01, ROUTE_N01, 0
	connection east, RouteN02, ROUTE_N02, 0

	map_attributes RouteN02, ROUTE_N02, $05, WEST | EAST
	connection west, ShaleCity, SHALE_CITY, 0
	connection east, City03, CITY_03, 0

	map_attributes City03, CITY_03, $05, SOUTH | WEST | EAST
	connection south, RouteN09, ROUTE_N09, 0
	connection west, RouteN02, ROUTE_N02, 0
	connection east, RouteN03, ROUTE_N03, 0

	map_attributes RouteN03, ROUTE_N03, $05, WEST | EAST
	connection west, City03, CITY_03, 0
	connection east, City04, CITY_04, 0

	map_attributes RouteN08, ROUTE_N08, $05, SOUTH | WEST
	connection south, RouteN07, ROUTE_N07, 10
	connection west, RouteN09, ROUTE_N09, -10

	map_attributes RouteN09, ROUTE_N09, $05, NORTH | EAST
	connection north, City03, CITY_03, 0
	connection east, RouteN08, ROUTE_N08, 10

	map_attributes City04, CITY_04, $05, WEST | EAST
	connection west, RouteN03, ROUTE_N03, 0
	connection east, RouteN04, ROUTE_N04, 0

	map_attributes RouteN04, ROUTE_N04, $05, NORTH | WEST
	connection north, City05West, CITY_05_WEST, 0
	connection west, City04, CITY_04, 0

	map_attributes Town07, TOWN_07, $05, WEST | EAST
	connection west, RouteN07, ROUTE_N07, -10
	connection east, RouteN06, ROUTE_N06, 0

	map_attributes RouteN06, ROUTE_N06, $05, NORTH | WEST
	connection north, Town06, TOWN_06, 40
	connection west, Town07, TOWN_07, 0

	map_attributes RouteN07, ROUTE_N07, $05, NORTH | EAST
	connection north, RouteN08, ROUTE_N08, -10
	connection east, Town07, TOWN_07, 10

	map_attributes Town06, TOWN_06, $05, NORTH | SOUTH
	connection north, RouteN05, ROUTE_N05, 0
	connection south, RouteN06, ROUTE_N06, -40

	map_attributes RouteN05, ROUTE_N05, $05, NORTH | SOUTH
	connection north, City05East, CITY_05_EAST, -10
	connection south, Town06, TOWN_06, 0

	map_attributes City05West, CITY_05_WEST, $05, NORTH | SOUTH | EAST
	connection north, RouteN11, ROUTE_N11, -20
	connection south, RouteN04, ROUTE_N04, 0
	connection east, City05East, CITY_05_EAST, 0

	map_attributes City05East, CITY_05_EAST, $05, NORTH | SOUTH | WEST
	connection north, RouteN10, ROUTE_N10, 10
	connection south, RouteN05, ROUTE_N05, 10
	connection west, City05West, CITY_05_WEST, 0

	map_attributes Town08, TOWN_08, $05, SOUTH
	connection south, RouteN10, ROUTE_N10, 0

	map_attributes RouteN10, ROUTE_N10, $05, NORTH | SOUTH
	connection north, Town08, TOWN_08, 0
	connection south, City05East, CITY_05_EAST, -10

	map_attributes Town09, TOWN_09, $05, WEST | EAST
	connection west, RouteN12, ROUTE_N12, -30
	connection east, RouteN11, ROUTE_N11, 0

	map_attributes RouteN11, ROUTE_N11, $05, SOUTH | WEST
	connection south, City05West, CITY_05_WEST, 20
	connection west, Town09, TOWN_09, 0

	map_attributes RouteN12, ROUTE_N12, $05, NORTH | WEST | EAST
	connection north, City13, CITY_13, 0
	connection west, RouteN13, ROUTE_N13, 10
	connection east, Town09, TOWN_09, 30

	map_attributes City10, CITY_10, $05, WEST | EAST
	connection west, RouteN14, ROUTE_N14, 10
	connection east, RouteN13, ROUTE_N13, 10

	map_attributes RouteN13, ROUTE_N13, $05, WEST | EAST
	connection west, City10, CITY_10, -10
	connection east, RouteN12, ROUTE_N12, -10

	map_attributes City11, CITY_11, $05, EAST
	connection east, RouteN14, ROUTE_N14, 0

	map_attributes RouteN14, ROUTE_N14, $05, SOUTH | WEST | EAST
	connection south, RouteN15, ROUTE_N15, 10
	connection west, City11, CITY_11, 0
	connection east, City10, CITY_10, -10

	map_attributes Town12, TOWN_12, $05, NORTH
	connection north, RouteN15, ROUTE_N15, 0

	map_attributes RouteN15, ROUTE_N15, $05, NORTH | SOUTH
	connection north, RouteN14, ROUTE_N14, -10
	connection south, Town12, TOWN_12, 0

	map_attributes City13, CITY_13, $05, SOUTH
	connection south, RouteN12, ROUTE_N12, 0

	map_attributes Pokecenter2F, POKECENTER_2F, $00, 0
	map_attributes TradeCenter, TRADE_CENTER, $00, 0
	map_attributes Colosseum, COLOSSEUM, $00, 0
	map_attributes TimeCapsule, TIME_CAPSULE, $00, 0
IF DEF(_DEBUG)
	map_attributes DebugRoom, DEBUG_ROOM, $0f, 0
ENDC
	map_attributes VictoryRoad, VICTORY_ROAD, $1d, 0
	map_attributes PlayersHouse1F, PLAYERS_HOUSE_1F, $00, 0
	map_attributes PlayersHouse2F, PLAYERS_HOUSE_2F, $00, 0
	map_attributes ParksLab, PARKS_LAB, $00, 0
	map_attributes RivalsHouse, RIVALS_HOUSE, $00, 0
	map_attributes ShalePokecenter1F, SHALE_POKECENTER_1F, $00, 0
	map_attributes ShaleMart, SHALE_MART, $00, 0
	map_attributes ShaleHouse1, SHALE_HOUSE_1, $00, 0
	map_attributes ShaleHouse2, SHALE_HOUSE_2, $00, 0
