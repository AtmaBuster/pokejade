MACRO mon_cry
; index, pitch, length
	dw \1, \2, \3
ENDM

PokemonCries::
; entries correspond to constants/pokemon_constants.asm
	table_width MON_CRY_LENGTH, PokemonCries
	mon_cry CRY_BULBASAUR,   128,  129 ; BULBASAUR
	mon_cry CRY_BULBASAUR,    32,  256 ; IVYSAUR
	mon_cry CRY_BULBASAUR,     0,  320 ; VENUSAUR
	mon_cry CRY_CHARMANDER,   96,  192 ; CHARMANDER
	mon_cry CRY_CHARMANDER,   32,  192 ; CHARMELEON
	mon_cry CRY_CHARMANDER,    0,  256 ; CHARIZARD
	mon_cry CRY_SQUIRTLE,     96,  192 ; SQUIRTLE
	mon_cry CRY_SQUIRTLE,     32,  192 ; WARTORTLE
	mon_cry CRY_BLASTOISE,     0,  256 ; BLASTOISE
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_WEEDLE,      238,  129 ; WEEDLE
	mon_cry CRY_BLASTOISE,   255,  129 ; KAKUNA
	mon_cry CRY_BLASTOISE,    96,  256 ; BEEDRILL
	mon_cry CRY_PIDGEY,      223,  132 ; PIDGEY
	mon_cry CRY_PIDGEOTTO,    40,  320 ; PIDGEOTTO
	mon_cry CRY_PIDGEOTTO,    17,  383 ; PIDGEOT
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_EKANS,        18,  192 ; EKANS
	mon_cry CRY_EKANS,       224,  144 ; ARBOK
	mon_cry CRY_BULBASAUR,   238,  129 ; PIKACHU
	mon_cry CRY_RAICHU,      238,  136 ; RAICHU
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_F,     0,  256 ; NIDORAN_F
	mon_cry CRY_NIDORAN_F,    44,  352 ; NIDORINA
	mon_cry CRY_NIDOQUEEN,     0,  256 ; NIDOQUEEN
	mon_cry CRY_NIDORAN_M,     0,  256 ; NIDORAN_M
	mon_cry CRY_NIDORAN_M,    44,  320 ; NIDORINO
	mon_cry CRY_RAICHU,        0,  256 ; NIDOKING
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_SQUIRTLE,    224,  256 ; ZUBAT
	mon_cry CRY_SQUIRTLE,    250,  256 ; GOLBAT
	mon_cry CRY_ODDISH,      221,  129 ; ODDISH
	mon_cry CRY_ODDISH,      170,  192 ; GLOOM
	mon_cry CRY_VILEPLUME,    34,  383 ; VILEPLUME
	mon_cry CRY_PARAS,        32,  352 ; PARAS
	mon_cry CRY_PARAS,        66,  383 ; PARASECT
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_CLEFAIRY,    119,  144 ; MEOWTH
	mon_cry CRY_CLEFAIRY,    153,  383 ; PERSIAN
	mon_cry CRY_PSYDUCK,      32,  224 ; PSYDUCK
	mon_cry CRY_PSYDUCK,     255,  192 ; GOLDUCK
	mon_cry CRY_NIDOQUEEN,   221,  224 ; MANKEY
	mon_cry CRY_NIDOQUEEN,   175,  192 ; PRIMEAPE
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_PIDGEY,      255,  383 ; POLIWAG
	mon_cry CRY_PIDGEY,      119,  224 ; POLIWHIRL
	mon_cry CRY_PIDGEY,        0,  383 ; POLIWRATH
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_VULPIX,      240,  144 ; GEODUDE
	mon_cry CRY_VULPIX,        0,  256 ; GRAVELER
	mon_cry CRY_GOLEM,       224,  192 ; GOLEM
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_METAPOD,     128,  224 ; MAGNEMITE
	mon_cry CRY_METAPOD,      32,  320 ; MAGNETON
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_DIGLETT,     187,  129 ; DODUO
	mon_cry CRY_DIGLETT,     153,  160 ; DODRIO
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_KRABBY,       32,  352 ; KRABBY
	mon_cry CRY_KRABBY,      238,  352 ; KINGLER
	mon_cry CRY_VOLTORB,     237,  256 ; VOLTORB
	mon_cry CRY_VOLTORB,     168,  272 ; ELECTRODE
	mon_cry CRY_DIGLETT,       0,  256 ; EXEGGCUTE
	mon_cry CRY_DROWZEE,       0,  256 ; EXEGGUTOR
	mon_cry CRY_CLEFAIRY,      0,  256 ; CUBONE
	mon_cry CRY_ODDISH,       79,  224 ; MAROWAK
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_PIDGEOTTO,    10,  320 ; CHANSEY
	mon_cry CRY_GOLEM,         0,  256 ; TANGELA
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_CLEFAIRY,    153,  144 ; HORSEA
	mon_cry CRY_CLEFAIRY,     60,  129 ; SEADRA
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_PARAS,         2,  160 ; STARYU
	mon_cry CRY_PARAS,         0,  256 ; STARMIE
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_CATERPIE,      0,  256 ; SCYTHER
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_VOLTORB,     143,  383 ; ELECTABUZZ
	mon_cry CRY_CHARMANDER,  255,  176 ; MAGMAR
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_SQUIRTLE,     17,  192 ; TAUROS
	mon_cry CRY_EKANS,       128,  128 ; MAGIKARP
	mon_cry CRY_EKANS,         0,  256 ; GYARADOS
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_PIDGEY,      255,  383 ; DITTO
	mon_cry CRY_VENONAT,     136,  224 ; EEVEE
	mon_cry CRY_VENONAT,     170,  383 ; VAPOREON
	mon_cry CRY_VENONAT,      61,  256 ; JOLTEON
	mon_cry CRY_VENONAT,      16,  160 ; FLAREON
	mon_cry CRY_WEEPINBELL,  170,  383 ; PORYGON
	mon_cry CRY_GROWLITHE,   240,  129 ; OMANYTE
	mon_cry CRY_GROWLITHE,   255,  192 ; OMASTAR
	mon_cry CRY_CATERPIE,    187,  192 ; KABUTO
	mon_cry CRY_FEAROW,      238,  129 ; KABUTOPS
	mon_cry CRY_VILEPLUME,    32,  368 ; AERODACTYL
	mon_cry CRY_GRIMER,       85,  129 ; SNORLAX
	mon_cry CRY_RAICHU,      128,  192 ; ARTICUNO
	mon_cry CRY_FEAROW,      255,  256 ; ZAPDOS
	mon_cry CRY_RAICHU,      248,  192 ; MOLTRES
	mon_cry CRY_BULBASAUR,    96,  192 ; DRATINI
	mon_cry CRY_BULBASAUR,    64,  256 ; DRAGONAIR
	mon_cry CRY_BULBASAUR,    60,  320 ; DRAGONITE
	mon_cry CRY_PARAS,       153,  383 ; MEWTWO
	mon_cry CRY_PARAS,       238,  383 ; MEW
	mon_cry CRY_CHIKORITA,   -16,  176 ; CHIKORITA
	mon_cry CRY_CHIKORITA,   -34,  288 ; BAYLEEF
	mon_cry CRY_CHIKORITA,  -183,  512 ; MEGANIUM
	mon_cry CRY_CYNDAQUIL,   839,  128 ; CYNDAQUIL
	mon_cry CRY_CYNDAQUIL,   801,  288 ; QUILAVA
	mon_cry CRY_TYPHLOSION, 3840,  212 ; TYPHLOSION
	mon_cry CRY_TOTODILE,   1132,  232 ; TOTODILE
	mon_cry CRY_TOTODILE,   1088,  272 ; CROCONAW
	mon_cry CRY_TOTODILE,   1020,  384 ; FERALIGATR
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_SQUIRTLE,    -16,  320 ; CROBAT
	mon_cry CRY_CYNDAQUIL,   969,  320 ; CHINCHOU
	mon_cry CRY_CYNDAQUIL,   720,  272 ; LANTURN
	mon_cry CRY_PICHU,         0,  320 ; PICHU
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NATU,       -103,  256 ; NATU
	mon_cry CRY_NATU,       -167,  360 ; XATU
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_CLEFFA,      132,  336 ; BELLOSSOM
	mon_cry CRY_MARILL,      283,  288 ; MARILL
	mon_cry CRY_MARILL,      182,  384 ; AZUMARILL
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_CLEFFA,     -675,  456 ; POLITOED
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_WOOPER,      147,  175 ; WOOPER
	mon_cry CRY_WOOPER,     -198,  320 ; QUAGSIRE
	mon_cry CRY_AIPOM,       162,  320 ; ESPEON
	mon_cry CRY_VENONAT,    -233,  240 ; UMBREON
	mon_cry CRY_MARILL,      -31,  384 ; MURKROW
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_HOOTHOOT,    304,  232 ; MISDREAVUS
	mon_cry CRY_HOOTHOOT,    354,  256 ; UNOWN
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_GIRAFARIG,    65,  512 ; GIRAFARIG
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_DUNSPARCE,   452,  256 ; DUNSPARCE
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_AMPHAROS,      0,  352 ; SCIZOR
	mon_cry CRY_DUNSPARCE,   656,  168 ; SHUCKLE
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_WOOPER,       83,  175 ; SNEASEL
	mon_cry CRY_TEDDIURSA,  1954,  110 ; TEDDIURSA
	mon_cry CRY_TEDDIURSA,  1600,  216 ; URSARING
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_SUNFLORA,     13,  256 ; REMORAID
	mon_cry CRY_TOTODILE,      0,  384 ; OCTILLERY
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_AMPHAROS,   2217,  384 ; SKARMORY
	mon_cry CRY_CYNDAQUIL,    57,  320 ; HOUNDOUR
	mon_cry CRY_TOTODILE,   -266,  256 ; HOUNDOOM
	mon_cry CRY_SLUGMA,      763,  256 ; KINGDRA
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_GIRAFARIG,   115,  576 ; PORYGON2
	mon_cry CRY_AIPOM,      -352,  384 ; STANTLER
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_SLUGMA,        0,  256 ; HITMONTOP
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_SUNFLORA,   -728,  180 ; ELEKID
	mon_cry CRY_TEDDIURSA,   374,   58 ; MAGBY
	mon_cry CRY_GLIGAR,     -461,  416 ; MILTANK
	mon_cry CRY_SLOWKING,    659,  320 ; BLISSEY
	mon_cry CRY_RAIKOU,      558,  288 ; RAIKOU
	mon_cry CRY_ENTEI,         0,  416 ; ENTEI
	mon_cry CRY_MAGCARGO,      0,  384 ; SUICUNE
	mon_cry CRY_RAIKOU,       95,  208 ; LARVITAR
	mon_cry CRY_SPINARAK,   -475,  336 ; PUPITAR
	mon_cry CRY_RAIKOU,     -256,  384 ; TYRANITAR
	mon_cry CRY_TYPHLOSION,    0,  256 ; LUGIA
	mon_cry CRY_AIPOM,         0,  384 ; HO_OH
	mon_cry CRY_ENTEI,       330,  273 ; CELEBI
	mon_cry CRY_NIDORAN_M,     0,    0 ; TREECKO
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	mon_cry CRY_NIDORAN_M,     0,    0 ;
	assert_table_length NUM_POKEMON
