; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    FOR EACH
;        trainer_mon species, level, ability, gender, [caughtball], [deltaindex], [shiny]
;        IF TRAINERTYPE_NICKNAME
;                mon_nick nickname
;        IF TRAINERTYPE_ITEM
;                mon_item item
;        IF TRAINERTYPE_MOVES
;                mon_move move1, move2, move3, move4
;        IF TRAINERTYPE_EVDV
;                mon_stat dvs*6, happiness
; - db -1 ; end

MACRO trainer_mon
	db \2
	dw \1
IF _NARG < 7
	db \4 << MON_GENDER_F
ELSE
	db (\4 << MON_GENDER_F) | (\7 << MON_SHINY_F)
ENDC
	db \3
IF _NARG < 5
	db POKE_BALL - FIRST_BALL_ITEM
ELIF _NARG < 6
	db \5 - FIRST_BALL_ITEM
ELSE
	db (\5 - FIRST_BALL_ITEM) | \6
ENDC
ENDM

MACRO starter_mon
	db \2
	dw \1
	db \4 + $fd
	db \3
	db POKE_BALL - FIRST_BALL_ITEM
ENDM

MACRO mon_item
	dw \1
ENDM

MACRO mon_move
	dw \1, \2, \3, \4
ENDM

MACRO mon_nick
	db \1, "@"
ENDM

MACRO mon_stat
REPT 6
	db \1
	SHIFT
ENDR
REPT 3
	dn \1, \2
	SHIFT 2
ENDR
	db \1
ENDM

SECTION "Enemy Trainer Parties 1", ROMX

FalknerGroup:
; testing
	next_list_item
	db "DICKS@", TRAINERTYPE_ITEM
	trainer_mon  CHARMANDER, 10, VOLT_ABSORB, MALE
	    mon_item ORAN_BERRY
	trainer_mon  BULBASAUR, 10, NO_ABILITY, MALE
	    mon_item MIRACLE_SEED
	trainer_mon  PIKACHU, 10, NO_ABILITY, MALE
	    mon_item LIGHT_BALL
	trainer_mon  SQUIRTLE, 10, NO_ABILITY, MALE
	    mon_item NO_ITEM
	db -1 ; end
	end_list_items

WhitneyGroup:

BugsyGroup:

MortyGroup:

PryceGroup:

JasmineGroup:

ChuckGroup:

ClairGroup:

Rival1Group:
	next_list_item ; RIVAL1 (1)
	db "?@", TRAINERTYPE_NORMAL
	starter_mon  TORCHIC, 5, BLAZE, 1
	db -1 ; end

	next_list_item ; RIVAL1 (2)
	db "?@", TRAINERTYPE_NORMAL
	starter_mon  MUDKIP, 5, TORRENT, 2
	db -1 ; end

	next_list_item ; RIVAL1 (3)
	db "?@", TRAINERTYPE_NORMAL
	starter_mon  TREECKO, 5, OVERGROW, 0
	db -1 ; end

	end_list_items

PokemonProfGroup:

WillGroup:

PKMNTrainerGroup:
	next_list_item ; CAL (1)
	db "CAL@", TRAINERTYPE_NORMAL
	trainer_mon  CHIKORITA, 10, NO_ABILITY, MALE
	trainer_mon  CYNDAQUIL, 10, NO_ABILITY, MALE
	trainer_mon  TOTODILE, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAL (2)
	db "CAL@", TRAINERTYPE_NORMAL
	trainer_mon  BAYLEEF, 30, NO_ABILITY, MALE
	trainer_mon  QUILAVA, 30, NO_ABILITY, MALE
	trainer_mon  CROCONAW, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAL (3)
	db "CAL@", TRAINERTYPE_NORMAL
	trainer_mon  MEGANIUM, 50, NO_ABILITY, MALE
	trainer_mon  TYPHLOSION, 50, NO_ABILITY, MALE
	trainer_mon  FERALIGATR, 50, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

BrunoGroup:

KarenGroup:

KogaGroup:

ChampionGroup:

BrockGroup:

MistyGroup:

LtSurgeGroup:

ScientistGroup:

ErikaGroup:

YoungsterGroup:
	next_list_item ; YOUNGSTER (1)
	db "DANNY@", TRAINERTYPE_NORMAL
	trainer_mon  BIDOOF, 4, UNAWARE, MALE
	trainer_mon  PIDGEY, 4, KEEN_EYE, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (2)
	db "-@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 5, OVERGROW, MALE
	db -1 ; end

	end_list_items

SECTION "Enemy Trainer Parties 2", ROMX

SchoolboyGroup:

BirdKeeperGroup:

LassGroup:
	next_list_item ; LASS (1)
	db "ABBY@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 5, OVERGROW, MALE
	db -1 ; end

	end_list_items

JanineGroup:

CooltrainerMGroup:

CooltrainerFGroup:

BeautyGroup:

PokemaniacGroup:

GruntMGroup:

GentlemanGroup:

SkierGroup:

TeacherGroup:

SabrinaGroup:

BugCatcherGroup:
	next_list_item ; BUG_CATCHER (1)
	db "-@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 5, OVERGROW, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (2)
	db "-@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 5, OVERGROW, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (3)
	db "-@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 5, OVERGROW, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (4)
	db "-@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 5, OVERGROW, MALE
	db -1 ; end

	end_list_items

FisherGroup:

SwimmerMGroup:

SwimmerFGroup:

SailorGroup:

SuperNerdGroup:

Rival2Group:

GuitaristGroup:

HikerGroup:

BikerGroup:

BlaineGroup:

BurglarGroup:

FirebreatherGroup:

JugglerGroup:

BlackbeltGroup:

ExecutiveMGroup:

PsychicGroup:

PicnickerGroup:
	next_list_item ; PICNICKER (1)
	db "-@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 5, OVERGROW, MALE
	db -1 ; end

	end_list_items

CamperGroup:

ExecutiveFGroup:

SageGroup:

MediumGroup:

BoarderGroup:

PokefanMGroup:

KimonoGirlGroup:

TwinsGroup:

PokefanFGroup:

RedGroup:

BlueGroup:

OfficerGroup:

GruntFGroup:

MysticalmanGroup:

KrisGroup:

ENDSECTION
