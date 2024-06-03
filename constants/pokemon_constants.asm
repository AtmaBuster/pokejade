; pokemon ids
; indexes for:
; - PokemonNames (see data/pokemon/names.asm)
; - BaseData (see data/pokemon/base_stats.asm)
; - EvosAttacksPointers (see data/pokemon/evos_attacks_pointers.asm)
; - EggMovePointers (see data/pokemon/egg_move_pointers.asm)
; - PokemonCries (see data/pokemon/cries.asm)
; - IconPointers (see data/pokemon/icon_pointers.asm)
; - PokemonPicPointers (see data/pokemon/pic_pointers.asm)
; - PokemonPalettes (see data/pokemon/palettes.asm)
; - PokedexDataPointerTable (see data/pokemon/dex_entry_pointers.asm)
; - AlphabeticalPokedexOrder (see data/pokemon/dex_order_alpha.asm)
; - NewPokedexOrder (see data/pokemon/dex_order_new.asm)
; - Pokered_MonIndices (see data/pokemon/gen1_order.asm)
; - Footprints (see gfx/footprints.asm)
; - AnimationPointers (see gfx/pokemon/anim_pointers.asm)
; - AnimationIdlePointers (see gfx/pokemon/idle_pointers.asm)
; - BitmasksPointers (see gfx/pokemon/bitmask_pointers.asm)
; - FramesPointers (see gfx/pokemon/frame_pointers.asm)
; - EZChat_SortedPokemon (see data/pokemon/ezchat_order.asm)
	const_def 1
	const BULBASAUR  ; 001
	const IVYSAUR    ; 002
	const VENUSAUR   ; 003
	const CHARMANDER ; 004
	const CHARMELEON ; 005
	const CHARIZARD  ; 006
	const SQUIRTLE   ; 007
	const WARTORTLE  ; 008
	const BLASTOISE  ; 009
	const BIDOOF     ; 00a //
	const BIBAREL    ; 00b //
	const KRICKETOT  ; 00c //
	const WEEDLE     ; 00d
	const KAKUNA     ; 00e
	const BEEDRILL   ; 00f
	const PIDGEY     ; 010
	const PIDGEOTTO  ; 011
	const PIDGEOT    ; 012
	const KRICKETUNE ; 013 //
	const COMBEE     ; 014 //
	const VESPIQUEN  ; 015 //
	const PACHIRISU  ; 016 //
	const EKANS      ; 017
	const ARBOK      ; 018
	const PIKACHU    ; 019
	const RAICHU     ; 01a
	const BUIZEL     ; 01b //
	const FLOATZEL   ; 01c //
	const NIDORAN_F  ; 01d
	const NIDORINA   ; 01e
	const NIDOQUEEN  ; 01f
	const NIDORAN_M  ; 020
	const NIDORINO   ; 021
	const NIDOKING   ; 022
	const MISMAGIUS  ; 023 //
	const HONCHKROW  ; 024 //
	const HAPPINY    ; 025 //
	const GIBLE      ; 026 //
	const GABITE     ; 027 //
	const GARCHOMP   ; 028 //
	const ZUBAT      ; 029
	const GOLBAT     ; 02a
	const ODDISH     ; 02b
	const GLOOM      ; 02c
	const VILEPLUME  ; 02d
	const PARAS      ; 02e
	const PARASECT   ; 02f
	const MUNCHLAX   ; 030 //
	const CROAGUNK   ; 031 //
	const TOXICROAK  ; 032 //
	const CARNIVINE  ; 033 //
	const MEOWTH     ; 034
	const PERSIAN    ; 035
	const PSYDUCK    ; 036
	const GOLDUCK    ; 037
	const MANKEY     ; 038
	const PRIMEAPE   ; 039
	const WEAVILE    ; 03a //
	const MAGNEZONE  ; 03b //
	const POLIWAG    ; 03c
	const POLIWHIRL  ; 03d
	const POLIWRATH  ; 03e
	const GELANLA    ; 03f //
	const TANGROWTH  ; 040 //
	const GELANIA    ; 041 //
	const ELECTIVIRE ; 042 //
	const MAGMORTAR  ; 043 //
	const LEAFEON    ; 044 //
	const GLACEON    ; 045 //
	const SYLVEON    ; 046 //
	const PORYGON_Z  ; 047 //
	const LILLIPUP   ; 048 //
	const HERDIER    ; 049 //
	const GEODUDE    ; 04a
	const GRAVELER   ; 04b
	const GOLEM      ; 04c
	const STOUTLAND  ; 04d //
	const TYMPOLE    ; 04e //
	const PALPITOAD  ; 04f //
	const SEISMITOAD ; 050 //
	const MAGNEMITE  ; 051
	const MAGNETON   ; 052
	const THROH      ; 053 //
	const DODUO      ; 054
	const DODRIO     ; 055
	const SAWK       ; 056 //
	const COTTONEE   ; 057 //
	const WHIMSICOTT ; 058 //
	const PETILIL    ; 059 //
	const LILLIGANT  ; 05a //
	const SANDILE    ; 05b //
	const KROKOROK   ; 05c //
	const KROOKODILE ; 05d //
	const FRILLISH   ; 05e //
	const JELLICENT  ; 05f //
	const JOLTIK     ; 060 //
	const GALVANTULA ; 061 //
	const KRABBY     ; 062
	const KINGLER    ; 063
	const VOLTORB    ; 064
	const ELECTRODE  ; 065
	const EXEGGCUTE  ; 066
	const EXEGGUTOR  ; 067
	const CUBONE     ; 068
	const MAROWAK    ; 069
	const LITWICK    ; 06a //
	const LAMPENT    ; 06b //
	const CHANDELURE ; 06c //
	const BOUFFALANT ; 06d //
	const RUFFLET    ; 06e //
	const BRAVIARY   ; 06f //
	const VULLABY    ; 070 //
	const CHANSEY    ; 071
	const TANGELA    ; 072
	const MANDIBUZZ  ; 073 //
	const HORSEA     ; 074
	const SEADRA     ; 075
	const HEATMOR    ; 076 //
	const DURANT     ; 077 //
	const STARYU     ; 078
	const STARMIE    ; 079
	const LARVESTA   ; 07a //
	const SCYTHER    ; 07b
	const VOLCARONA  ; 07c //
	const ELECTABUZZ ; 07d
	const MAGMAR     ; 07e
	const LITLEO     ; 07f //
	const TAUROS     ; 080
	const MAGIKARP   ; 081
	const GYARADOS   ; 082
	const PYROAR     ; 083 //
	const DITTO      ; 084
	const EEVEE      ; 085
	const VAPOREON   ; 086
	const JOLTEON    ; 087
	const FLAREON    ; 088
	const PORYGON    ; 089
	const OMANYTE    ; 08a
	const OMASTAR    ; 08b
	const KABUTO     ; 08c
	const KABUTOPS   ; 08d
	const AERODACTYL ; 08e
	const SNORLAX    ; 08f
	const ARTICUNO   ; 090
	const ZAPDOS     ; 091
	const MOLTRES    ; 092
	const DRATINI    ; 093
	const DRAGONAIR  ; 094
	const DRAGONITE  ; 095
	const MEWTWO     ; 096
	const MEW        ; 097
DEF JOHTO_POKEMON EQU const_value
	const CHIKORITA  ; 098
	const BAYLEEF    ; 099
	const MEGANIUM   ; 09a
	const CYNDAQUIL  ; 09b
	const QUILAVA    ; 09c
	const TYPHLOSION ; 09d
	const TOTODILE   ; 09e
	const CROCONAW   ; 09f
	const FERALIGATR ; 0a0
	const PANCHAM    ; 0a1 //
	const PANGORO    ; 0a2 //
	const SKRELP     ; 0a3 //
	const DRAGALGE   ; 0a4 //
	const CLAUNCHER  ; 0a5 //
	const CLAWITZER  ; 0a6 //
	const HAWLUCHA   ; 0a7 //
	const GRUBBIN    ; 0a8 //
	const CROBAT     ; 0a9
	const CHINCHOU   ; 0aa
	const LANTURN    ; 0ab
	const PICHU      ; 0ac
	const CHARJABUG  ; 0ad //
	const VIKAVOLT   ; 0ae //
	const ROCKRUFF   ; 0af //
	const LYCANROC   ; 0b0 //
	const NATU       ; 0b1
	const XATU       ; 0b2
	const DEWPIDER   ; 0b3 //
	const ARAQUANID  ; 0b4 //
	const MIMIKYU    ; 0b5 //
	const BELLOSSOM  ; 0b6
	const MARILL     ; 0b7
	const AZUMARILL  ; 0b8
	const DHELMISE   ; 0b9 //
	const POLITOED   ; 0ba
	const ROOKIDEE   ; 0bb //
	const CORVSQUIRE ; 0bc //
	const CORVINIGHT ; 0bd //
	const CHEWTLE    ; 0be //
	const DREDNAW    ; 0bf //
	const FALINKS    ; 0c0 //
	const MON_0C1    ; 0c1 //
	const WOOPER     ; 0c2
	const QUAGSIRE   ; 0c3
	const ESPEON     ; 0c4
	const UMBREON    ; 0c5
	const MURKROW    ; 0c6
	const WYRDEER    ; 0c7 //
	const MISDREAVUS ; 0c8
	const UNOWN      ; 0c9
	const KLEAVOR    ; 0ca //
	const GIRAFARIG  ; 0cb
	const URSALUNA   ; 0cc //
	const TINKATINK  ; 0cd //
	const DUNSPARCE  ; 0ce
	const TINKATUFF  ; 0cf //
	const TINKATON   ; 0d0 //
	const ORTHWORM   ; 0d1 //
	const ANNIHILAPE ; 0d2 //
	const DUDUNSPARC ; 0d3 //
	const SCIZOR     ; 0d4
	const SHUCKLE    ; 0d5
	const GIMMIGHOUL ; 0d6 //
	const SNEASEL    ; 0d7
	const TEDDIURSA  ; 0d8
	const URSARING   ; 0d9
	const GHOLDENGO  ; 0da //
	const JAGG       ; 0db //
	const CROCKY     ; 0dc //
	const WULFMAN    ; 0dd //
	const WARWULF    ; 0de //
	const REMORAID   ; 0df
	const OCTILLERY  ; 0e0
	const RINRIN     ; 0e1 //
	const BELLERUN   ; 0e2 //
	const SKARMORY   ; 0e3
	const HOUNDOUR   ; 0e4
	const HOUNDOOM   ; 0e5
	const KINGDRA    ; 0e6
	const KOTORA     ; 0e7 //
	const RAITORA    ; 0e8 //
	const PORYGON2   ; 0e9
	const STANTLER   ; 0ea
	const BOMASHIKA  ; 0eb //
	const _SPACEBOAT ; 0ec //
	const KOKOPELLI  ; 0ed //
	const FARIGIRAF  ; 0ee //
	const ELEKID     ; 0ef
	const MAGBY      ; 0f0
	const MILTANK    ; 0f1
	const BLISSEY    ; 0f2
	const RAIKOU     ; 0f3
	const ENTEI      ; 0f4
	const SUICUNE    ; 0f5
	const LARVITAR   ; 0f6
	const PUPITAR    ; 0f7
	const TYRANITAR  ; 0f8
	const LUGIA      ; 0f9
	const HO_OH      ; 0fa
	const CELEBI     ; 0fb
DEF LATER_POKEMON EQU const_value
	const TREECKO    ; 0fc
	const GROVYLE    ; 0fd
	const SCEPTILE   ; 0fe
	const TORCHIC    ; 0ff
	const COMBUSKEN  ; 100
	const BLAZIKEN   ; 101
	const MUDKIP     ; 102
	const MARSHTOMP  ; 103
	const SWAMPERT   ; 104
	const POOCHYENA  ; 105
	const MIGHTYENA  ; 106
	const ZIGZAGOON  ; 107
	const LINOONE    ; 108
	const WURMPLE    ; 109
	const SILCOON    ; 10a
	const BEAUTIFLY  ; 10b
	const CASCOON    ; 10c
	const DUSTOX     ; 10d
	const LOTAD      ; 10e
	const LOMBRE     ; 10f
	const LUDICOLO   ; 110
	const SEEDOT     ; 111
	const NUZLEAF    ; 112
	const SHIFTRY    ; 113
	const WINGULL    ; 114
	const PELIPPER   ; 115
	const RALTS      ; 116
	const KIRLIA     ; 117
	const GARDEVOIR  ; 118
	const GALLADE    ; 119
	const SHROOMISH  ; 11a
	const BRELOOM    ; 11b
	const SLAKOTH    ; 11c
	const VIGOROTH   ; 11d
	const SLAKING    ; 11e
	const AZURILL    ; 11f
	const SKITTY     ; 120
	const DELCATTY   ; 121
	const SABLEYE    ; 122
	const MAWILE     ; 123
	const ARON       ; 124
	const LAIRON     ; 125
	const AGGRON     ; 126
	const BUDEW      ; 127
	const ROSELIA    ; 128
	const ROSERADE   ; 129
	const GULPIN     ; 12a
	const SWALOT     ; 12b
	const WAILMER    ; 12c
	const WAILORD    ; 12d
	const NUMEL      ; 12e
	const CAMERUPT   ; 12f
	const TRAPINCH   ; 130
	const VIBRAVA    ; 131
	const FLYGON     ; 132
	const CACNEA     ; 133
	const CACTURNE   ; 134
	const SWABLU     ; 135
	const ALTARIA    ; 136
	const ZANGOOSE   ; 137
	const SEVIPER    ; 138
	const BARBOACH   ; 139
	const WHISCASH   ; 13a
	const LILEEP     ; 13b
	const CRADILY    ; 13c
	const ANORITH    ; 13d
	const ARMALDO    ; 13e
	const FEEBAS     ; 13f
	const MILOTIC    ; 140
	const CASTFORM   ; 141
	const KECLEON    ; 142
	const DUSKULL    ; 143
	const DUSCLOPS   ; 144
	const DUSKNOIR   ; 145
	const CHINGLING  ; 146
	const CHIMECHO   ; 147
	const ABSOL      ; 148
	const SNORUNT    ; 149
	const GLALIE     ; 14a
	const FROSLASS   ; 14b
	const SPHEAL     ; 14c
	const SEALEO     ; 14d
	const WALREIN    ; 14e
	const CLAMPERL   ; 14f
	const HUNTAIL    ; 150
	const GOREBYSS   ; 151
	const BAGON      ; 152
	const SHELGON    ; 153
	const SALAMENCE  ; 154
	const BELDUM     ; 155
	const METANG     ; 156
	const METAGROSS  ; 157
	const REGIROCK   ; 158
	const REGICE     ; 159
	const REGISTEEL  ; 15a
	const LATIAS     ; 15b
	const LATIOS     ; 15c
	const KYOGRE     ; 15d
	const GROUDON    ; 15e
	const RAYQUAZA   ; 15f
	const DEOXYS     ; 160
	const MON_161    ; 161
	const MON_162    ; 162
	const MON_163    ; 163
	const MON_164    ; 164
	const MON_165    ; 165
	const MON_166    ; 166
	const MON_167    ; 167
	const MON_168    ; 168
	const MON_169    ; 169
	const MON_16A    ; 16a
	const MON_16B    ; 16b
	const MON_16C    ; 16c
	const MON_16D    ; 16d
	const MON_16E    ; 16e
	const MON_16F    ; 16f
	const MON_170    ; 170
	const MON_171    ; 171
	const MON_172    ; 172
	const MON_173    ; 173
	const MON_174    ; 174
	const MON_175    ; 175
	const MON_176    ; 176
	const MON_177    ; 177
	const MON_178    ; 178
	const MON_179    ; 179
	const MON_17A    ; 17a
	const MON_17B    ; 17b
	const MON_17C    ; 17c
	const MON_17D    ; 17d
	const MON_17E    ; 17e
	const MON_17F    ; 17f
	const MON_180    ; 180
	const MON_181    ; 181
	const MON_182    ; 182
	const MON_183    ; 183
	const MON_184    ; 184
	const MON_185    ; 185
	const MON_186    ; 186
	const MON_187    ; 187
	const MON_188    ; 188
	const MON_189    ; 189
	const MON_18A    ; 18a
	const MON_18B    ; 18b
	const MON_18C    ; 18c
	const MON_18D    ; 18d
	const MON_18E    ; 18e
	const MON_18F    ; 18f
	const MON_190    ; 190
	const MON_191    ; 191
DEF NUM_DEX_POKEMON EQU const_value - 1
	const DEOXYS_ATTACK  ; 192
	const DEOXYS_DEFENSE ; 193
	const DEOXYS_SPEED   ; 194
	const LYCANROC_NITE  ; 195
	const LYCANROC_DUSK  ; 196
	const URSALUNA_BLOOD ; 197
	const CASTFORM_SUNNY ; 198
	const CASTFORM_RAINY ; 199
	const CASTFORM_SNOWY ; 19a
DEF NUM_POKEMON EQU const_value - 1

DEF EGG EQU -3

; limits:
; 999: everything that prints dex counts
; 1407: size of wPokedexOrder
; 4095: hard limit; would require serious redesign to increase
if NUM_POKEMON > 999
	fail "Too many Pokémon defined!"
endc

; Unown forms
; indexes for:
; - UnownWords (see data/pokemon/unown_words.asm)
; - UnownPicPointers (see data/pokemon/unown_pic_pointers.asm)
; - UnownAnimationPointers (see gfx/pokemon/unown_anim_pointers.asm)
; - UnownAnimationIdlePointers (see gfx/pokemon/unown_idle_pointers.asm)
; - UnownBitmasksPointers (see gfx/pokemon/unown_bitmask_pointers.asm)
; - UnownFramesPointers (see gfx/pokemon/unown_frame_pointers.asm)
	const_def 1
	const UNOWN_A ;  1
	const UNOWN_B ;  2
	const UNOWN_C ;  3
	const UNOWN_D ;  4
	const UNOWN_E ;  5
	const UNOWN_F ;  6
	const UNOWN_G ;  7
	const UNOWN_H ;  8
	const UNOWN_I ;  9
	const UNOWN_J ; 10
	const UNOWN_K ; 11
	const UNOWN_L ; 12
	const UNOWN_M ; 13
	const UNOWN_N ; 14
	const UNOWN_O ; 15
	const UNOWN_P ; 16
	const UNOWN_Q ; 17
	const UNOWN_R ; 18
	const UNOWN_S ; 19
	const UNOWN_T ; 20
	const UNOWN_U ; 21
	const UNOWN_V ; 22
	const UNOWN_W ; 23
	const UNOWN_X ; 24
	const UNOWN_Y ; 25
	const UNOWN_Z ; 26
DEF NUM_UNOWN EQU const_value - 1 ; 26
