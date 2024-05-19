SECTION "Evolutions and Attacks 1", ROMX

EvosAttacksPointers1::
	dw BulbasaurEvosAttacks
	dw IvysaurEvosAttacks
	dw VenusaurEvosAttacks
	dw CharmanderEvosAttacks
	dw CharmeleonEvosAttacks
	dw CharizardEvosAttacks
	dw SquirtleEvosAttacks
	dw WartortleEvosAttacks
	dw BlastoiseEvosAttacks
	dw BidoofEvosAttacks
	dw BibarelEvosAttacks
	dw KricketotEvosAttacks
	dw WeedleEvosAttacks
	dw KakunaEvosAttacks
	dw BeedrillEvosAttacks
	dw PidgeyEvosAttacks
	dw PidgeottoEvosAttacks
	dw PidgeotEvosAttacks
	dw KricketuneEvosAttacks
	dw CombeeEvosAttacks
	dw VespiquenEvosAttacks
	dw PachirisuEvosAttacks
	dw EkansEvosAttacks
	dw ArbokEvosAttacks
	dw PikachuEvosAttacks
	dw RaichuEvosAttacks
	dw BuizelEvosAttacks
	dw FloatzelEvosAttacks
	dw NidoranFEvosAttacks
	dw NidorinaEvosAttacks
	dw NidoqueenEvosAttacks
	dw NidoranMEvosAttacks
	dw NidorinoEvosAttacks
	dw NidokingEvosAttacks
	dw MismagiusEvosAttacks
	dw HonchkrowEvosAttacks
	dw HappinyEvosAttacks
	dw GibleEvosAttacks
	dw GabiteEvosAttacks
	dw GarchompEvosAttacks
	dw ZubatEvosAttacks
	dw GolbatEvosAttacks
	dw OddishEvosAttacks
	dw GloomEvosAttacks
	dw VileplumeEvosAttacks
	dw ParasEvosAttacks
	dw ParasectEvosAttacks
	dw MunchlaxEvosAttacks
	dw CroagunkEvosAttacks
	dw ToxicroakEvosAttacks
	dw CarnivineEvosAttacks
	dw MeowthEvosAttacks
	dw PersianEvosAttacks
	dw PsyduckEvosAttacks
	dw GolduckEvosAttacks
	dw MankeyEvosAttacks
	dw PrimeapeEvosAttacks
	dw WeavileEvosAttacks
	dw MagnezoneEvosAttacks
	dw PoliwagEvosAttacks
	dw PoliwhirlEvosAttacks
	dw PoliwrathEvosAttacks
	dw GelanlaEvosAttacks
	dw TangrowthEvosAttacks
	dw GelaniaEvosAttacks
	dw ElectivireEvosAttacks
	dw MagmortarEvosAttacks
	dw LeafeonEvosAttacks
	dw GlaceonEvosAttacks
	dw SylveonEvosAttacks
	dw PorygonZEvosAttacks
	dw LillipupEvosAttacks
	dw HerdierEvosAttacks
	dw GeodudeEvosAttacks
	dw GravelerEvosAttacks
	dw GolemEvosAttacks
	dw StoutlandEvosAttacks
	dw TympoleEvosAttacks
	dw PalpitoadEvosAttacks
	dw SeismitoadEvosAttacks
	dw MagnemiteEvosAttacks
	dw MagnetonEvosAttacks
	dw ThrohEvosAttacks
	dw DoduoEvosAttacks
	dw DodrioEvosAttacks
	dw SawkEvosAttacks
	dw CottoneeEvosAttacks
	dw WhimsicottEvosAttacks
	dw PetililEvosAttacks
	dw LilligantEvosAttacks
	dw SandileEvosAttacks
	dw KrokorokEvosAttacks
	dw KrookodileEvosAttacks
	dw FrillishEvosAttacks
	dw JellicentEvosAttacks
	dw JoltikEvosAttacks
	dw GalvantulaEvosAttacks
	dw KrabbyEvosAttacks
	dw KinglerEvosAttacks
	dw VoltorbEvosAttacks
	dw ElectrodeEvosAttacks
	dw ExeggcuteEvosAttacks
	dw ExeggutorEvosAttacks
	dw CuboneEvosAttacks
	dw MarowakEvosAttacks
	dw LitwickEvosAttacks
	dw LampentEvosAttacks
	dw ChandelureEvosAttacks
	dw BouffalantEvosAttacks
	dw RuffletEvosAttacks
	dw BraviaryEvosAttacks
	dw VullabyEvosAttacks
	dw ChanseyEvosAttacks
	dw TangelaEvosAttacks
	dw MandibuzzEvosAttacks
	dw HorseaEvosAttacks
	dw SeadraEvosAttacks
	dw HeatmorEvosAttacks
	dw DurantEvosAttacks
	dw StaryuEvosAttacks
	dw StarmieEvosAttacks
	dw LarvestaEvosAttacks
	dw ScytherEvosAttacks
	dw VolcaronaEvosAttacks
	dw ElectabuzzEvosAttacks
	dw MagmarEvosAttacks
	dw LitleoEvosAttacks
	dw TaurosEvosAttacks
	dw MagikarpEvosAttacks
	dw GyaradosEvosAttacks
	dw PyroarEvosAttacks
	dw DittoEvosAttacks
	dw EeveeEvosAttacks
	dw VaporeonEvosAttacks
	dw JolteonEvosAttacks
	dw FlareonEvosAttacks
	dw PorygonEvosAttacks
	dw OmanyteEvosAttacks
	dw OmastarEvosAttacks
	dw KabutoEvosAttacks
	dw KabutopsEvosAttacks
	dw AerodactylEvosAttacks
	dw SnorlaxEvosAttacks
	dw ArticunoEvosAttacks
	dw ZapdosEvosAttacks
	dw MoltresEvosAttacks
	dw DratiniEvosAttacks
	dw DragonairEvosAttacks
	dw DragoniteEvosAttacks
	dw MewtwoEvosAttacks
	dw MewEvosAttacks
.IndirectEnd::

BulbasaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BidoofEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, BIBAREL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, GROWL
	dbw 9, DEFENSE_CURL
	dbw 13, ROLLOUT
	dbw 17, HEADBUTT
	dbw 21, HYPER_FANG
	dbw 25, YAWN
	dbw 29, AMNESIA
	dbw 33, TAKE_DOWN
	dbw 37, SUPER_FANG
	dbw 41, SUPERPOWER
	dbw 45, CURSE
	db 0 ; no more level-up moves

BibarelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 5, GROWL
	dbw 9, DEFENSE_CURL
	dbw 13, ROLLOUT
	dbw 15, WATER_GUN
	dbw 18, HEADBUTT
	dbw 23, HYPER_FANG
	dbw 28, YAWN
	dbw 33, AMNESIA
	dbw 38, TAKE_DOWN
	dbw 43, SUPER_FANG
	dbw 48, SUPERPOWER
	dbw 53, CURSE
	db 0 ; no more level-up moves

KricketotEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BIBAREL
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	dbbw EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, SAND_ATTACK
	dbw 9, GUST
	dbw 13, QUICK_ATTACK
	dbw 17, WHIRLWIND
	dbw 21, TWISTER
	dbw 25, FEATHERDANCE
	dbw 29, AGILITY
	dbw 33, WING_ATTACK
	dbw 37, ROOST
	dbw 41, TAILWIND
	dbw 45, MIRROR_MOVE
	dbw 49, AIR_SLASH
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 1, GUST
	dbw 5, SAND_ATTACK
	dbw 9, GUST
	dbw 13, QUICK_ATTACK
	dbw 17, WHIRLWIND
	dbw 22, TWISTER
	dbw 27, FEATHERDANCE
	dbw 32, AGILITY
	dbw 37, WING_ATTACK
	dbw 42, ROOST
	dbw 47, TAILWIND
	dbw 52, MIRROR_MOVE
	dbw 57, AIR_SLASH
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 1, GUST
	dbw 1, QUICK_ATTACK
	dbw 5, SAND_ATTACK
	dbw 9, GUST
	dbw 13, QUICK_ATTACK
	dbw 17, WHIRLWIND
	dbw 22, TWISTER
	dbw 27, FEATHERDANCE
	dbw 32, AGILITY
	dbw 38, WING_ATTACK
	dbw 44, ROOST
	dbw 50, TAILWIND
	dbw 56, MIRROR_MOVE
	dbw 62, AIR_SLASH
	db 0 ; no more level-up moves

KricketuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CombeeEvosAttacks:
	dbbw EVOLVE_LEVEL_FEMALE, 21, VESPIQUEN
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

VespiquenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PachirisuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

EkansEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BuizelEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, FLOATZEL
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

FloatzelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MismagiusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

HappinyEvosAttacks:
	dbww EVOLVE_LEVEL_ITEM, OVAL_STONE, CHANSEY
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GibleEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, GABITE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GabiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 48, GARCHOMP
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GarchompEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

OddishEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GloomEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	dbww EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ParasEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MunchlaxEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, SNORLAX
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CroagunkEvosAttacks:
	dbbw EVOLVE_LEVEL, 37, TOXICROAK
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ToxicroakEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CarnivineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	dbbw EVOLVE_LEVEL, 27, PERSIAN
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	dbww EVOLVE_LEVEL_MOVE, RAGE_FIST, ANNIHILAPE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

WeavileEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, POUND
	dbw 8, HYPNOSIS
	dbw 11, WATER_GUN
	dbw 15, DOUBLESLAP
	dbw 18, RAIN_DANCE
	dbw 21, BODY_SLAM
	dbw 25, BUBBLEBEAM
	dbw 28, MUD_SHOT
	dbw 31, BELLY_DRUM
	dbw 35, WAKE_UP_SLAP
	dbw 38, HYDRO_PUMP
	dbw 41, MUD_BOMB
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, POLIWRATH
	dbww EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, POUND
	dbw 1, HYPNOSIS
	dbw 5, POUND
	dbw 8, HYPNOSIS
	dbw 11, WATER_GUN
	dbw 15, DOUBLESLAP
	dbw 18, RAIN_DANCE
	dbw 21, BODY_SLAM
	dbw 27, BUBBLEBEAM
	dbw 32, MUD_SHOT
	dbw 37, BELLY_DRUM
	dbw 43, WAKE_UP_SLAP
	dbw 48, HYDRO_PUMP
	dbw 53, MUD_BOMB
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLEBEAM
	dbw 1, DOUBLESLAP
	dbw 1, HYPNOSIS
	dbw 1, SUBMISSION
	dbw 43, DYNAMICPUNCH
	dbw 53, MIND_READER
	db 0 ; no more level-up moves

GelanlaEvosAttacks:
	dbww EVOLVE_LEVEL_MOVE, VINE_WHIP, TANGELA
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 5, SLEEP_POWDER
	dbw 8, ABSORB
	dbw 12, GROWTH
	dbw 15, POISONPOWDER
	dbw 19, VINE_WHIP
	dbw 21, BIND
	dbw 24, MEGA_DRAIN
	dbw 26, STUN_SPORE
	dbw 29, ANCIENTPOWER
	dbw 31, KNOCK_OFF
	dbw 34, NATURAL_GIFT
	dbw 36, POWER_WHIP
	dbw 39, TICKLE
	dbw 41, WRING_OUT
	db 0 ; no more level-up moves

TangrowthEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, INGRAIN
	dbw 1, CONSTRICT
	dbw 5, SLEEP_POWDER
	dbw 8, ABSORB
	dbw 12, GROWTH
	dbw 15, POISONPOWDER
	dbw 19, VINE_WHIP
	dbw 22, BIND
	dbw 26, MEGA_DRAIN
	dbw 29, STUN_SPORE
	dbw 33, ANCIENTPOWER
	dbw 36, KNOCK_OFF
	dbw 40, NATURAL_GIFT
	dbw 43, POWER_WHIP
	dbw 47, TICKLE
	dbw 50, WRING_OUT
	dbw 54, BLOCK
	db 0 ; no more level-up moves

GelaniaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, INGRAIN
	dbw 1, CONSTRICT
	dbw 5, SLEEP_POWDER
	dbw 8, ABSORB
	dbw 12, GROWTH
	dbw 15, POISONPOWDER
	dbw 19, VINE_WHIP
	dbw 22, BIND
	dbw 26, MEGA_DRAIN
	dbw 29, STUN_SPORE
	dbw 33, ANCIENTPOWER
	dbw 36, KNOCK_OFF
	dbw 40, NATURAL_GIFT
	dbw 43, POWER_WHIP
	dbw 47, TRAILBLAZE
	dbw 50, WRING_OUT
	dbw 54, WOOD_HAMMER
	db 0 ; no more level-up moves

ElectivireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MagmortarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LeafeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GlaceonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SylveonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PorygonZEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LillipupEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, HERDIER
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

HerdierEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, STOUTLAND
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, GOLEM
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	dbww EVOLVE_TRADE, -1, GOLEM
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

StoutlandEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

TympoleEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, PALPITOAD
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PalpitoadEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SEISMITOAD
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SeismitoadEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	dbbw EVOLVE_LANDMARK, LANDMARK_OBSIDIAN_TOWN, MAGNEZONE ; TO-DO
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ThrohEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SawkEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CottoneeEvosAttacks:
	dbww EVOLVE_ITEM, SUN_STONE, WHIMSICOTT
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

WhimsicottEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PetililEvosAttacks:
	dbww EVOLVE_ITEM, SUN_STONE, LILLIGANT
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LilligantEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SandileEvosAttacks:
	dbbw EVOLVE_LEVEL, 29, KROKOROK
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KrokorokEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, KROOKODILE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KrookodileEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

FrillishEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, JELLICENT
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

JellicentEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

JoltikEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, GALVANTULA
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GalvantulaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LitwickEvosAttacks:
	dbbw EVOLVE_LEVEL, 41, LAMPENT
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LampentEvosAttacks:
	dbww EVOLVE_ITEM, DUSK_STONE, CHANDELURE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ChandelureEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BouffalantEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

RuffletEvosAttacks:
	dbbw EVOLVE_LEVEL, 54, BRAVIARY
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BraviaryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

VullabyEvosAttacks:
	dbbw EVOLVE_LEVEL, 54, MANDIBUZZ
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	dbww EVOLVE_LEVEL_MOVE, ANCIENTPOWER, TANGROWTH
	dbww EVOLVE_LEVEL_MOVE, POWER_WHIP, GELANIA
	db 0 ; no more evolutions
	dbw 1, INGRAIN
	dbw 1, CONSTRICT
	dbw 5, SLEEP_POWDER
	dbw 8, ABSORB
	dbw 12, GROWTH
	dbw 15, POISONPOWDER
	dbw 19, VINE_WHIP
	dbw 22, BIND
	dbw 26, MEGA_DRAIN
	dbw 29, STUN_SPORE
	dbw 33, ANCIENTPOWER
	dbw 36, KNOCK_OFF
	dbw 40, NATURAL_GIFT
	dbw 43, POWER_WHIP
	dbw 47, TICKLE
	dbw 50, WRING_OUT
	db 0 ; no more level-up moves

MandibuzzEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

HeatmorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DurantEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LarvestaEvosAttacks:
	dbbw EVOLVE_LEVEL, 59, VOLCARONA
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	dbww EVOLVE_TRADE, METAL_COAT, SCIZOR
	dbww EVOLVE_TRADE, BLACK_AUGITE, KLEAVOR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

VolcaronaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	dbww EVOLVE_TRADE, ELECTIRIZER, ELECTIVIRE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	dbww EVOLVE_TRADE, MAGMARIZER, MAGMORTAR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LitleoEvosAttacks:
	dbbw EVOLVE_LEVEL, 35, PYROAR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 5, EMBER
	dbw 8, WORK_UP
	dbw 11, HEADBUTT
	dbw 15, NOBLE_ROAR
	dbw 20, BITE
	dbw 23, TAKE_DOWN
	dbw 28, FIRE_FANG
	dbw 33, ENDEAVOR
	dbw 36, FLAMETHROWER
	dbw 39, CRUNCH
	dbw 43, HYPER_VOICE
	dbw 46, INCINERATE
	dbw 50, OVERHEAT
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PyroarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYPER_BEAM
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 5, EMBER
	dbw 8, WORK_UP
	dbw 11, HEADBUTT
	dbw 15, NOBLE_ROAR
	dbw 20, BITE
	dbw 23, TAKE_DOWN
	dbw 28, FIRE_FANG
	dbw 33, ENDEAVOR
	dbw 38, FLAMETHROWER
	dbw 43, CRUNCH
	dbw 49, HYPER_VOICE
	dbw 54, INCINERATE
	dbw 60, OVERHEAT
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, VAPOREON
	dbww EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	dbww EVOLVE_ITEM, FIRE_STONE, FLAREON
	dbw EVOLVE_SYLVEON, SYLVEON
	dbbw EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	dbbw EVOLVE_HAPPINESS, TR_EVENITE, UMBREON
	dbbw EVOLVE_LANDMARK, LANDMARK_OBSIDIAN_TOWN, LEAFEON ; TO-DO
	dbbw EVOLVE_LANDMARK, LANDMARK_OBSIDIAN_TOWN, GLACEON ; TO-DO
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	dbww EVOLVE_TRADE, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ENDSECTION
