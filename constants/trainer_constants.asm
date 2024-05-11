DEF __trainer_class__ = 0

MACRO trainerclass
	DEF \1 EQU __trainer_class__
	DEF __trainer_class__ += 1
	const_def 1
ENDM

; trainer class ids
; `trainerclass` indexes are for:
; - TrainerClassNames (see data/trainers/class_names.asm)
; - TrainerClassAttributes (see data/trainers/attributes.asm)
; - TrainerClassDVs (see data/trainers/dvs.asm)
; - TrainerGroups (see data/trainers/party_pointers.asm)
; - TrainerEncounterMusic (see data/trainers/encounter_music.asm)
; - TrainerPicPointers (see data/trainers/pic_pointers.asm)
; - TrainerPalettes (see data/trainers/palettes.asm)
; - BTTrainerClassSprites (see data/trainers/sprites.asm)
; - BTTrainerClassGenders (see data/trainers/genders.asm)
; trainer constants are Trainers indexes, for the sub-tables of TrainerGroups (see data/trainers/parties.asm)
DEF CHRIS EQU __trainer_class__
	trainerclass TRAINER_NONE ; 0
	const PHONECONTACT_MOM
	const PHONECONTACT_BIKESHOP
	const PHONECONTACT_BILL
	const PHONECONTACT_ELM
	const PHONECONTACT_BUENA
DEF NUM_NONTRAINER_PHONECONTACTS EQU const_value - 1

DEF KRIS EQU __trainer_class__
	trainerclass FALKNER ; 1

	trainerclass WHITNEY ; 2

	trainerclass BUGSY ; 3

	trainerclass MORTY ; 4

	trainerclass PRYCE ; 5

	trainerclass JASMINE ; 6

	trainerclass CHUCK ; 7

	trainerclass CLAIR ; 8

	trainerclass RIVAL1 ; 9
	const RIVAL1_1_CHIKORITA
	const RIVAL1_1_CYNDAQUIL
	const RIVAL1_1_TOTODILE
DEF RIVAL1_1 EQU const_value - 3

	trainerclass POKEMON_PROF ; a

	trainerclass WILL ; b

	trainerclass CAL ; c
	const CAL1 ; unused
	const CAL2
	const CAL3

	trainerclass BRUNO ; d

	trainerclass KAREN ; e

	trainerclass KOGA ; f

	trainerclass CHAMPION ; 10

	trainerclass BROCK ; 11

	trainerclass MISTY ; 12

	trainerclass LT_SURGE ; 13

	trainerclass SCIENTIST ; 14

	trainerclass ERIKA ; 15

	trainerclass YOUNGSTER ; 16

	trainerclass SCHOOLBOY ; 17

	trainerclass BIRD_KEEPER ; 18

	trainerclass LASS ; 19

	trainerclass JANINE ; 1a

	trainerclass COOLTRAINERM ; 1b

	trainerclass COOLTRAINERF ; 1c

	trainerclass BEAUTY ; 1d

	trainerclass POKEMANIAC ; 1e

	trainerclass GRUNTM ; 1f

	trainerclass GENTLEMAN ; 20

	trainerclass SKIER ; 21

	trainerclass TEACHER ; 22

	trainerclass SABRINA ; 23

	trainerclass BUG_CATCHER ; 24

	trainerclass FISHER ; 25

	trainerclass SWIMMERM ; 26

	trainerclass SWIMMERF ; 27

	trainerclass SAILOR ; 28

	trainerclass SUPER_NERD ; 29

	trainerclass RIVAL2 ; 2a

	trainerclass GUITARIST ; 2b

	trainerclass HIKER ; 2c

	trainerclass BIKER ; 2d

	trainerclass BLAINE ; 2e

	trainerclass BURGLAR ; 2f

	trainerclass FIREBREATHER ; 30

	trainerclass JUGGLER ; 31

	trainerclass BLACKBELT_T ; 32

	trainerclass EXECUTIVEM ; 33

	trainerclass PSYCHIC_T ; 34

	trainerclass PICNICKER ; 35

	trainerclass CAMPER ; 36

	trainerclass EXECUTIVEF ; 37

	trainerclass SAGE ; 38

	trainerclass MEDIUM ; 39

	trainerclass BOARDER ; 3a

	trainerclass POKEFANM ; 3b

	trainerclass KIMONO_GIRL ; 3c

	trainerclass TWINS ; 3d

	trainerclass POKEFANF ; 3e

	trainerclass RED ; 3f

	trainerclass BLUE ; 40

	trainerclass OFFICER ; 41

	trainerclass GRUNTF ; 42

	trainerclass MYSTICALMAN ; 43

	trainerclass LINK_KRIS ; 44
	const LINK_KRIS1

DEF NUM_TRAINER_CLASSES EQU __trainer_class__ - 1
