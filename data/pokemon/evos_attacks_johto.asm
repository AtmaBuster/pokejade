SECTION "Evolutions and Attacks 2", ROMX

EvosAttacksPointers2::
	dw ChikoritaEvosAttacks
	dw BayleefEvosAttacks
	dw MeganiumEvosAttacks
	dw CyndaquilEvosAttacks
	dw QuilavaEvosAttacks
	dw TyphlosionEvosAttacks
	dw TotodileEvosAttacks
	dw CroconawEvosAttacks
	dw FeraligatrEvosAttacks
	dw PanchamEvosAttacks
	dw PangoroEvosAttacks
	dw SkrelpEvosAttacks
	dw DragalgeEvosAttacks
	dw ClauncherEvosAttacks
	dw ClawitzerEvosAttacks
	dw HawluchaEvosAttacks
	dw GrubbinEvosAttacks
	dw CrobatEvosAttacks
	dw ChinchouEvosAttacks
	dw LanturnEvosAttacks
	dw PichuEvosAttacks
	dw CharjabugEvosAttacks
	dw VikavoltEvosAttacks
	dw RockruffEvosAttacks
	dw LycanrocEvosAttacks
	dw NatuEvosAttacks
	dw XatuEvosAttacks
	dw DewpiderEvosAttacks
	dw AraquanidEvosAttacks
	dw MimikyuEvosAttacks
	dw BellossomEvosAttacks
	dw MarillEvosAttacks
	dw AzumarillEvosAttacks
	dw DhelmiseEvosAttacks
	dw PolitoedEvosAttacks
	dw RookideeEvosAttacks
	dw CorvsquireEvosAttacks
	dw CorvinightEvosAttacks
	dw ChewtleEvosAttacks
	dw DrednawEvosAttacks
	dw FalinksEvosAttacks
	dw EiscueEvosAttacks
	dw WooperEvosAttacks
	dw QuagsireEvosAttacks
	dw EspeonEvosAttacks
	dw UmbreonEvosAttacks
	dw MurkrowEvosAttacks
	dw WyrdeerEvosAttacks
	dw MisdreavusEvosAttacks
	dw UnownEvosAttacks
	dw KleavorEvosAttacks
	dw GirafarigEvosAttacks
	dw UrsalunaEvosAttacks
	dw TinkatinkEvosAttacks
	dw DunsparceEvosAttacks
	dw TinkatuffEvosAttacks
	dw TinkatonEvosAttacks
	dw OrthwormEvosAttacks
	dw AnnihilapeEvosAttacks
	dw DudunsparcEvosAttacks
	dw ScizorEvosAttacks
	dw ShuckleEvosAttacks
	dw GimmighoulEvosAttacks
	dw SneaselEvosAttacks
	dw TeddiursaEvosAttacks
	dw UrsaringEvosAttacks
	dw GholdengoEvosAttacks
	dw JaggEvosAttacks
	dw CrockyEvosAttacks
	dw WulfmanEvosAttacks
	dw WarwulfEvosAttacks
	dw RemoraidEvosAttacks
	dw OctilleryEvosAttacks
	dw RinrinEvosAttacks
	dw BellerunEvosAttacks
	dw SkarmoryEvosAttacks
	dw HoundourEvosAttacks
	dw HoundoomEvosAttacks
	dw KingdraEvosAttacks
	dw KotoraEvosAttacks
	dw RaitoraEvosAttacks
	dw Porygon2EvosAttacks
	dw StantlerEvosAttacks
	dw BomashikaEvosAttacks
	dw SpaceboatEvosAttacks
	dw KokopelliEvosAttacks
	dw FarigirafEvosAttacks
	dw ElekidEvosAttacks
	dw MagbyEvosAttacks
	dw MiltankEvosAttacks
	dw BlisseyEvosAttacks
	dw RaikouEvosAttacks
	dw EnteiEvosAttacks
	dw SuicuneEvosAttacks
	dw LarvitarEvosAttacks
	dw PupitarEvosAttacks
	dw TyranitarEvosAttacks
	dw LugiaEvosAttacks
	dw HoOhEvosAttacks
	dw CelebiEvosAttacks
.IndirectEnd::

ChikoritaEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PanchamEvosAttacks:
	dbbw EVOLVE_LEVEL_WITH_DARK, 32, PANGORO
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PangoroEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SkrelpEvosAttacks:
	dbbw EVOLVE_LEVEL, 48, DRAGALGE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DragalgeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ClauncherEvosAttacks:
	dbbw EVOLVE_LEVEL, 37, CLAWITZER
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ClawitzerEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

HawluchaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GrubbinEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, CHARJABUG
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	dbbw EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PichuEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CharjabugEvosAttacks:
	dbbw EVOLVE_LANDMARK, LANDMARKGROUP_ELECTRIC, VIKAVOLT
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

VikavoltEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

RockruffEvosAttacks:
	dbbbw EVOLVE_LEVEL_ABILITY, 25, KEEN_EYE, LYCANROC
	dbbbw EVOLVE_LEVEL_ABILITY, 25, VITAL_SPIRIT, LYCANROC_NITE
	dbbbw EVOLVE_LEVEL_ABILITY, 25, OWN_TEMPO, LYCANROC_DUSK
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LycanrocEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

NatuEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DewpiderEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARAQUANID
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

AraquanidEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MimikyuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MarillEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DhelmiseEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLEBEAM
	dbw 1, DOUBLESLAP
	dbw 1, HYPNOSIS
	dbw 1, PERISH_SONG
	dbw 27, SWAGGER
	dbw 37, BOUNCE
	dbw 48, HYPER_VOICE
	db 0 ; no more level-up moves

RookideeEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, CORVSQUIRE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CorvsquireEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, CORVINIGHT
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CorvinightEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ChewtleEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, DREDNAW
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DrednawEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

FalinksEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

EiscueEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

WooperEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	dbww EVOLVE_ITEM, DUSK_STONE, HONCHKROW
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

WyrdeerEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	dbww EVOLVE_ITEM, DUSK_STONE, MISMAGIUS
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KleavorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	dbww EVOLVE_LEVEL_MOVE, TWIN_BEAM, FARIGIRAF
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

UrsalunaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

TinkatinkEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, TINKATUFF
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	dbww EVOLVE_LEVEL_MOVE, HYPER_DRILL, DUDUNSPARC
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

TinkatuffEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, TINKATON
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

TinkatonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

OrthwormEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

AnnihilapeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

DudunsparcEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GimmighoulEvosAttacks:
	dbww EVOLVE_COINS, 999, GHOLDENGO
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	dbww EVOLVE_LEVEL_ITEM_NITE, RAZOR_CLAW, WEAVILE
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	dbww EVOLVE_ITEM_BLOODMOON, PEAT_BLOCK, URSALUNA_BLOOD
	dbww EVOLVE_ITEM_NITE, PEAT_BLOCK, URSALUNA
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

GholdengoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

JaggEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CrockyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

WulfmanEvosAttacks:
	dbbw EVOLVE_LEVEL, 1, WARWULF ; TO-DO
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

WarwulfEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

RinrinEvosAttacks:
	dbbw EVOLVE_LEVEL, 1, BELLERUN ; TO-DO
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BellerunEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KotoraEvosAttacks:
	dbbw EVOLVE_LEVEL, 1, RAITORA ; TO-DO
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

RaitoraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	dbww EVOLVE_TRADE, DUBIOUS_DISC, PORYGON_Z
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	dbww EVOLVE_LEVEL_MOVE, BARRIER_BASH, WYRDEER
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BomashikaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SpaceboatEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

KokopelliEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

FarigirafEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves

ENDSECTION
