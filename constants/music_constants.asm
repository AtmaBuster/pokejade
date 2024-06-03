MACRO mus_const
DEF curconstvalue EQUS strfmt("%u", const_value)
DEF MUSCONST_ID_{curconstvalue} EQUS "\1"
	const \1
PURGE curconstvalue

ENDM

; song ids
; Music indexes (see audio/music_pointers.asm)
	const_def
	mus_const MUSIC_NONE                         ; 00
	mus_const MUSIC_TITLE                        ; 01
	mus_const MUSIC_ROUTE_1                      ; 02
	mus_const MUSIC_ROUTE_3                      ; 03
	mus_const MUSIC_ROUTE_12                     ; 04
	mus_const MUSIC_MAGNET_TRAIN                 ; 05
	mus_const MUSIC_KANTO_GYM_LEADER_BATTLE      ; 06
	mus_const MUSIC_KANTO_TRAINER_BATTLE         ; 07
	mus_const MUSIC_KANTO_WILD_BATTLE            ; 08
	mus_const MUSIC_POKEMON_CENTER               ; 09
	mus_const MUSIC_HIKER_ENCOUNTER              ; 0a
	mus_const MUSIC_LASS_ENCOUNTER               ; 0b
	mus_const MUSIC_OFFICER_ENCOUNTER            ; 0c
	mus_const MUSIC_HEAL                         ; 0d
	mus_const MUSIC_LAVENDER_TOWN                ; 0e
	mus_const MUSIC_ROUTE_2                      ; 0f
	mus_const MUSIC_MT_MOON                      ; 10
	mus_const MUSIC_SHOW_ME_AROUND               ; 11
	mus_const MUSIC_GAME_CORNER                  ; 12
	mus_const MUSIC_BICYCLE                      ; 13
	mus_const MUSIC_HALL_OF_FAME                 ; 14
	mus_const MUSIC_VIRIDIAN_CITY                ; 15
	mus_const MUSIC_CELADON_CITY                 ; 16
	mus_const MUSIC_TRAINER_VICTORY              ; 17
	mus_const MUSIC_WILD_VICTORY                 ; 18
	mus_const MUSIC_GYM_VICTORY                  ; 19
	mus_const MUSIC_MT_MOON_SQUARE               ; 1a
	mus_const MUSIC_GYM                          ; 1b
	mus_const MUSIC_PALLET_TOWN                  ; 1c
	mus_const MUSIC_POKEMON_TALK                 ; 1d
	mus_const MUSIC_PROF_OAK                     ; 1e
	mus_const MUSIC_RIVAL_ENCOUNTER              ; 1f
	mus_const MUSIC_RIVAL_AFTER                  ; 20
	mus_const MUSIC_SURF                         ; 21
	mus_const MUSIC_EVOLUTION                    ; 22
	mus_const MUSIC_NATIONAL_PARK                ; 23
	mus_const MUSIC_CREDITS                      ; 24
	mus_const MUSIC_AZALEA_TOWN                  ; 25
	mus_const MUSIC_CHERRYGROVE_CITY             ; 26
	mus_const MUSIC_KIMONO_ENCOUNTER             ; 27
	mus_const MUSIC_UNION_CAVE                   ; 28
	mus_const MUSIC_JOHTO_WILD_BATTLE            ; 29
	mus_const MUSIC_JOHTO_TRAINER_BATTLE         ; 2a
	mus_const MUSIC_ROUTE_30                     ; 2b
	mus_const MUSIC_ECRUTEAK_CITY                ; 2c
	mus_const MUSIC_VIOLET_CITY                  ; 2d
	mus_const MUSIC_JOHTO_GYM_LEADER_BATTLE      ; 2e
	mus_const MUSIC_CHAMPION_BATTLE              ; 2f
	mus_const MUSIC_RIVAL_BATTLE                 ; 30
	mus_const MUSIC_ROCKET_BATTLE                ; 31
	mus_const MUSIC_PROF_ELM                     ; 32
	mus_const MUSIC_DARK_CAVE                    ; 33
	mus_const MUSIC_ROUTE_29                     ; 34
	mus_const MUSIC_ROUTE_36                     ; 35
	mus_const MUSIC_SS_AQUA                      ; 36
	mus_const MUSIC_YOUNGSTER_ENCOUNTER          ; 37
	mus_const MUSIC_BEAUTY_ENCOUNTER             ; 38
	mus_const MUSIC_ROCKET_ENCOUNTER             ; 39
	mus_const MUSIC_POKEMANIAC_ENCOUNTER         ; 3a
	mus_const MUSIC_SAGE_ENCOUNTER               ; 3b
	mus_const MUSIC_OBSIDIAN_TOWN                ; 3c
	mus_const MUSIC_GOLDENROD_CITY               ; 3d
	mus_const MUSIC_VERMILION_CITY               ; 3e
	mus_const MUSIC_POKEMON_CHANNEL              ; 3f
	mus_const MUSIC_POKE_FLUTE_CHANNEL           ; 40
	mus_const MUSIC_TIN_TOWER                    ; 41
	mus_const MUSIC_SPROUT_TOWER                 ; 42
	mus_const MUSIC_BURNED_TOWER                 ; 43
	mus_const MUSIC_LIGHTHOUSE                   ; 44
	mus_const MUSIC_LAKE_OF_RAGE                 ; 45
	mus_const MUSIC_INDIGO_PLATEAU               ; 46
	mus_const MUSIC_ROUTE_37                     ; 47
	mus_const MUSIC_ROCKET_HIDEOUT               ; 48
	mus_const MUSIC_DRAGONS_DEN                  ; 49
	mus_const MUSIC_JOHTO_WILD_BATTLE_NIGHT      ; 4a
	mus_const MUSIC_RUINS_OF_ALPH_RADIO          ; 4b
	mus_const MUSIC_CAPTURE                      ; 4c
	mus_const MUSIC_ROUTE_26                     ; 4d
	mus_const MUSIC_MOM                          ; 4e
	mus_const MUSIC_VICTORY_ROAD                 ; 4f
	mus_const MUSIC_POKEMON_LULLABY              ; 50
	mus_const MUSIC_POKEMON_MARCH                ; 51
	mus_const MUSIC_GS_OPENING                   ; 52
	mus_const MUSIC_GS_OPENING_2                 ; 53
	mus_const MUSIC_MAIN_MENU                    ; 54
	mus_const MUSIC_RUINS_OF_ALPH_INTERIOR       ; 55
	mus_const MUSIC_ROCKET_OVERTURE              ; 56
	mus_const MUSIC_DANCING_HALL                 ; 57
	mus_const MUSIC_BUG_CATCHING_CONTEST_RANKING ; 58
	mus_const MUSIC_BUG_CATCHING_CONTEST         ; 59
	mus_const MUSIC_LAKE_OF_RAGE_ROCKET_RADIO    ; 5a
	mus_const MUSIC_PRINTER                      ; 5b
	mus_const MUSIC_POST_CREDITS                 ; 5c
; new to Crystal
	mus_const MUSIC_CLAIR                        ; 5d
	mus_const MUSIC_MOBILE_ADAPTER_MENU          ; 5e
	mus_const MUSIC_MOBILE_ADAPTER               ; 5f
	mus_const MUSIC_BUENAS_PASSWORD              ; 60
	mus_const MUSIC_MYSTICALMAN_ENCOUNTER        ; 61
	mus_const MUSIC_CRYSTAL_OPENING              ; 62
	mus_const MUSIC_BATTLE_TOWER_THEME           ; 63
	mus_const MUSIC_SUICUNE_BATTLE               ; 64
	mus_const MUSIC_BATTLE_TOWER_LOBBY           ; 65
	mus_const MUSIC_MOBILE_CENTER                ; 66
	mus_const MUSIC_TRAINER_BATTLE               ; 67
	mus_const MUSIC_NAZOH_WILD_BATTLE            ; 68
DEF NUM_MUSIC_SONGS EQU const_value

; GetMapMusic picks music for these values (see home/map.asm)
DEF MUSIC_MAHOGANY_MART EQU $fc
DEF MUSIC_RADIO_TOWER   EQU $fd

; ExitPokegearRadio_HandleMusic uses these values
DEF RESTART_MAP_MUSIC EQU $fe
DEF ENTER_MAP_MUSIC   EQU $ff
