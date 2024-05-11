MACRO spawn
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants
	table_width 4, SpawnPoints

	spawn PLAYERS_HOUSE_2F,            3,  3
IF DEF(_DEBUG)
	spawn DEBUG_ROOM,                  5,  6
ELSE
	spawn PLAYERS_HOUSE_2F,            3,  3
ENDC

	spawn OBSIDIAN_TOWN,               3, 10

	spawn N_A,                        -1, -1

	assert_table_length NUM_SPAWNS + 1
