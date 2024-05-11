; Johto Pokémon in grass

JohtoGrassWildMons:

IF DEF(_DEBUG)
	map_id DEBUG_ROOM
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	dbw 30, BULBASAUR
	dbw 30, CHARMANDER
	dbw 20, SQUIRTLE
	dbw 10, WEEDLE
	dbw  5, PIDGEY
	dbw  4, EKANS
	dbw  1, PIKACHU
	; day
	dbw 30, NIDORAN_F
	dbw 30, NIDORAN_M
	dbw 20, ZUBAT
	dbw 10, ODDISH
	dbw  5, PARAS
	dbw  4, MEOWTH
	dbw  1, PSYDUCK
	; nite
	dbw 30, MANKEY
	dbw 30, POLIWAG
	dbw 20, GEODUDE
	dbw 10, MAGNEMITE
	dbw  5, DODUO
	dbw  4, KRABBY
	dbw  1, VOLTORB
ENDC
	db -1 ; end
