; wEventFlags bit flags

	const_def
; The first eight flags are reset upon reloading the map
	const EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	const EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	const EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	const EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	const EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	const EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	const EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	const EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
; Johto Gym Leader TM gifts
	const EVENT_GOT_TM_X1
	const EVENT_GOT_TM_X2
	const EVENT_GOT_TM_X3
	const EVENT_GOT_TM_X4
	const EVENT_GOT_TM_X5
	const EVENT_GOT_TM_X6
	const EVENT_GOT_TM_X7
	const EVENT_GOT_TM_X8
; HMs (EVENT_GOT_HM07_WATERFALL is with the Johto itemballs)
	const EVENT_GOT_HM01_CUT
	const EVENT_GOT_HM02_FLY
	const EVENT_GOT_HM03_SURF
	const EVENT_GOT_HM04_STRENGTH
	const EVENT_GOT_HM05_ROCK_SMASH
	const EVENT_GOT_HM06_WATERFALL
	const EVENT_GOT_HM07_DIVE
; Rods
	const EVENT_GOT_OLD_ROD
	const EVENT_GOT_GOOD_ROD
	const EVENT_GOT_SUPER_ROD
; Johto story events
	const EVENT_INITIALIZED_EVENTS
; Unused: next 572 events

	const_next 600
; Decorations
	const EVENT_DECO_BED_1
	const EVENT_DECO_BED_2
	const EVENT_DECO_BED_3
	const EVENT_DECO_BED_4
	const EVENT_DECO_CARPET_1
	const EVENT_DECO_CARPET_2
	const EVENT_DECO_CARPET_3
	const EVENT_DECO_CARPET_4
	const EVENT_DECO_PLANT_1
	const EVENT_DECO_PLANT_2
	const EVENT_DECO_PLANT_3
	const EVENT_DECO_POSTER_1
	const EVENT_DECO_POSTER_2
	const EVENT_DECO_POSTER_3
	const EVENT_DECO_POSTER_4
	const EVENT_DECO_FAMICOM
	const EVENT_DECO_SNES
	const EVENT_DECO_N64
	const EVENT_DECO_VIRTUAL_BOY
	const EVENT_DECO_PIKACHU_DOLL
	const EVENT_DECO_SURFING_PIKACHU_DOLL
	const EVENT_DECO_CLEFAIRY_DOLL
	const EVENT_DECO_JIGGLYPUFF_DOLL
	const EVENT_DECO_BULBASAUR_DOLL
	const EVENT_DECO_CHARMANDER_DOLL
	const EVENT_DECO_SQUIRTLE_DOLL
	const EVENT_DECO_POLIWAG_DOLL
	const EVENT_DECO_DIGLETT_DOLL
	const EVENT_DECO_STARYU_DOLL
	const EVENT_DECO_MAGIKARP_DOLL
	const EVENT_DECO_ODDISH_DOLL
	const EVENT_DECO_GENGAR_DOLL
	const EVENT_DECO_SHELLDER_DOLL
	const EVENT_DECO_GRIMER_DOLL
	const EVENT_DECO_VOLTORB_DOLL
	const EVENT_DECO_WEEDLE_DOLL
	const EVENT_DECO_UNOWN_DOLL
	const EVENT_DECO_GEODUDE_DOLL
	const EVENT_DECO_MACHOP_DOLL
	const EVENT_DECO_TENTACOOL_DOLL
	const EVENT_PLAYERS_ROOM_POSTER
	const EVENT_DECO_GOLD_TROPHY
	const EVENT_DECO_SILVER_TROPHY
	const EVENT_DECO_BIG_SNORLAX_DOLL
	const EVENT_DECO_BIG_ONIX_DOLL
	const EVENT_DECO_BIG_LAPRAS_DOLL
; Unused: next 954 events

	const_next 1600
; Sprite visibility flags
; When these events are cleared, the sprite becomes visible; when set, the sprite is hidden.
; The map script command macros `disappear` and `appear` set/clear these flags and immediately apply the effect on visibility.
; The map script command macros `setevent` and `clearevent` set/clear these flags, and their effects will be seen when the map is reloaded.
; Johto itemballs
	const EVENT_PLAYERS_HOUSE_2F_CONSOLE
	const EVENT_PLAYERS_HOUSE_2F_DOLL_1
	const EVENT_PLAYERS_HOUSE_2F_DOLL_2
	const EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	const EVENT_MYSTERY_GIFT_DELIVERY_GUY
; Unused: next 443 events

	const_next 2048
DEF NUM_EVENTS EQU const_value ; 800
