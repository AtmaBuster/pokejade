; Johto Pokémon in grass

JohtoGrassWildMons:

	map_id OBSIDIAN_MEADOW
	db 10 percent
	dbw  2, PIDGEY
	dbw  2, BIDOOF
	dbw  3, PIDGEY
	dbw  3, BIDOOF
	dbw  2, POLIWAG
	dbw  3, POLIWAG
	dbw  3, GELANLA

	map_id ROUTE_N01
	db 10 percent
	dbw  2, PIDGEY
	dbw  2, BIDOOF
	dbw  3, PIDGEY
	dbw  3, BIDOOF
	dbw  2, POLIWAG
	dbw  3, POLIWAG
	dbw  3, GELANLA

IF DEF(_DEBUG)
	map_id DEBUG_ROOM
	db 10 percent
	dbw 99, BULBASAUR
	dbw 99, CHARMANDER
	dbw 99, SQUIRTLE
	dbw 10, WEEDLE
	dbw  5, PIDGEY
	dbw  4, EKANS
	dbw  1, PIKACHU
ENDC
	db -1 ; end
