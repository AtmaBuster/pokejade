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
	next_list_item ; FALKNER (1)
	db "FALKNER@", TRAINERTYPE_MOVES
	trainer_mon  PIDGEY, 7, KEEN_EYE, MALE
	    mon_move TACKLE, MUD_SLAP, NO_MOVE, NO_MOVE
	trainer_mon  PIDGEOTTO, 7, KEEN_EYE, FEMALE, MASTER_BALL, TRUE
	    mon_move TACKLE, MUD_SLAP, GUST, NO_MOVE
	db -1 ; end

	end_list_items

WhitneyGroup:
	next_list_item ; WHITNEY (1)
	db "WHITNEY@", TRAINERTYPE_MOVES | TRAINERTYPE_ITEM
	trainer_mon  BULBASAUR, 10, THICK_FAT, FEMALE, POKE_BALL, DELTA_VENUSAUR_PSYCHIC_TYPE_STEEL, TRUE
	    mon_item MOOMOO_MILK
	    mon_move SPLASH, NO_MOVE, NO_MOVE, NO_MOVE
	db -1 ; end

	end_list_items

BugsyGroup:
	next_list_item ; BUGSY (1)
	db "BUGSY@", TRAINERTYPE_MOVES
	trainer_mon  METAPOD, 14, SHED_SKIN, MALE
	    mon_move TACKLE, STRING_SHOT, HARDEN, NO_MOVE
	trainer_mon  KAKUNA, 14, SHED_SKIN, MALE
	    mon_move POISON_STING, STRING_SHOT, HARDEN, NO_MOVE
	trainer_mon  SCYTHER, 16, TECHNICIAN, MALE
	    mon_move QUICK_ATTACK, LEER, FURY_CUTTER, NO_MOVE
	db -1 ; end

	end_list_items

MortyGroup:
	next_list_item ; MORTY (1)
	db "MORTY@", TRAINERTYPE_MOVES
	trainer_mon  GASTLY, 21, NO_ABILITY, MALE
	    mon_move LICK, SPITE, MEAN_LOOK, CURSE
	trainer_mon  HAUNTER, 21, NO_ABILITY, MALE
	    mon_move HYPNOSIS, MIMIC, CURSE, NIGHT_SHADE
	trainer_mon  GENGAR, 25, NO_ABILITY, MALE
	    mon_move HYPNOSIS, SHADOW_BALL, MEAN_LOOK, DREAM_EATER
	trainer_mon  HAUNTER, 23, NO_ABILITY, MALE
	    mon_move SPITE, MEAN_LOOK, MIMIC, NIGHT_SHADE
	db -1 ; end

	end_list_items

PryceGroup:
	next_list_item ; PRYCE (1)
	db "PRYCE@", TRAINERTYPE_MOVES
	trainer_mon  SEEL, 27, NO_ABILITY, MALE
	    mon_move HEADBUTT, ICY_WIND, AURORA_BEAM, REST
	trainer_mon  DEWGONG, 29, NO_ABILITY, MALE
	    mon_move HEADBUTT, ICY_WIND, AURORA_BEAM, REST
	trainer_mon  PILOSWINE, 31, NO_ABILITY, MALE
	    mon_move ICY_WIND, FURY_ATTACK, MIST, BLIZZARD
	db -1 ; end

	end_list_items

JasmineGroup:
	next_list_item ; JASMINE (1)
	db "JASMINE@", TRAINERTYPE_MOVES
	trainer_mon  MAGNEMITE, 30, NO_ABILITY, MALE
	    mon_move THUNDERBOLT, SUPERSONIC, SONICBOOM, THUNDER_WAVE
	trainer_mon  MAGNEMITE, 30, NO_ABILITY, MALE
	    mon_move THUNDERBOLT, SUPERSONIC, SONICBOOM, THUNDER_WAVE
	trainer_mon  STEELIX, 35, NO_ABILITY, MALE
	    mon_move SCREECH, SUNNY_DAY, ROCK_THROW, IRON_TAIL
	db -1 ; end

	end_list_items

ChuckGroup:
	next_list_item ; CHUCK (1)
	db "CHUCK@", TRAINERTYPE_MOVES
	trainer_mon  PRIMEAPE, 27, NO_ABILITY, MALE
	    mon_move LEER, RAGE, KARATE_CHOP, FURY_SWIPES
	trainer_mon  POLIWRATH, 30, NO_ABILITY, MALE
	    mon_move HYPNOSIS, MIND_READER, SURF, DYNAMICPUNCH
	db -1 ; end

	end_list_items

ClairGroup:
	next_list_item ; CLAIR (1)
	db "CLAIR@", TRAINERTYPE_MOVES
	trainer_mon  DRAGONAIR, 37, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, SURF, SLAM, DRAGONBREATH
	trainer_mon  DRAGONAIR, 37, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, THUNDERBOLT, SLAM, DRAGONBREATH
	trainer_mon  DRAGONAIR, 37, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, ICE_BEAM, SLAM, DRAGONBREATH
	trainer_mon  KINGDRA, 40, NO_ABILITY, MALE
	    mon_move SMOKESCREEN, SURF, HYPER_BEAM, DRAGONBREATH
	db -1 ; end

	end_list_items

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
	next_list_item ; WILL (1)
	db "WILL@", TRAINERTYPE_MOVES
	trainer_mon  XATU, 40, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, FUTURE_SIGHT, CONFUSE_RAY, PSYCHIC_M
	trainer_mon  JYNX, 41, NO_ABILITY, MALE
	    mon_move DOUBLESLAP, LOVELY_KISS, ICE_PUNCH, PSYCHIC_M
	trainer_mon  EXEGGUTOR, 41, NO_ABILITY, MALE
	    mon_move REFLECT, LEECH_SEED, EGG_BOMB, PSYCHIC_M
	trainer_mon  SLOWBRO, 41, NO_ABILITY, MALE
	    mon_move CURSE, AMNESIA, BODY_SLAM, PSYCHIC_M
	trainer_mon  XATU, 42, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, FUTURE_SIGHT, CONFUSE_RAY, PSYCHIC_M
	db -1 ; end

	end_list_items

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
	next_list_item ; BRUNO (1)
	db "BRUNO@", TRAINERTYPE_MOVES
	trainer_mon  BULBASAUR, 42, NO_ABILITY, MALE
	    mon_move PURSUIT, QUICK_ATTACK, DIG, DETECT
	trainer_mon  HITMONLEE, 42, NO_ABILITY, MALE
	    mon_move SWAGGER, DOUBLE_KICK, HI_JUMP_KICK, FORESIGHT
	trainer_mon  HITMONCHAN, 42, NO_ABILITY, MALE
	    mon_move THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, MACH_PUNCH
	trainer_mon  ONIX, 43, NO_ABILITY, MALE
	    mon_move BIND, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	trainer_mon  MACHAMP, 46, NO_ABILITY, MALE
	    mon_move ROCK_SLIDE, FORESIGHT, VITAL_THROW, CROSS_CHOP
	db -1 ; end

	end_list_items

KarenGroup:
	next_list_item ; KAREN (1)
	db "KAREN@", TRAINERTYPE_MOVES
	trainer_mon  UMBREON, 42, NO_ABILITY, MALE
	    mon_move SAND_ATTACK, CONFUSE_RAY, FAINT_ATTACK, MEAN_LOOK
	trainer_mon  VILEPLUME, 42, NO_ABILITY, MALE
	    mon_move STUN_SPORE, ACID, MOONLIGHT, PETAL_DANCE
	trainer_mon  GENGAR, 45, NO_ABILITY, MALE
	    mon_move LICK, SPITE, CURSE, DESTINY_BOND
	trainer_mon  MURKROW, 44, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, WHIRLWIND, PURSUIT, FAINT_ATTACK
	trainer_mon  HOUNDOOM, 47, NO_ABILITY, MALE
	    mon_move ROAR, PURSUIT, FLAMETHROWER, CRUNCH
	db -1 ; end

	end_list_items

KogaGroup:
	next_list_item ; KOGA (1)
	db "KOGA@", TRAINERTYPE_MOVES
	trainer_mon  ARIADOS, 40, NO_ABILITY, MALE
	    mon_move DOUBLE_TEAM, SPIDER_WEB, BATON_PASS, GIGA_DRAIN
	trainer_mon  VENOMOTH, 41, NO_ABILITY, MALE
	    mon_move SUPERSONIC, GUST, PSYCHIC_M, TOXIC
	trainer_mon  FORRETRESS, 43, NO_ABILITY, MALE
	    mon_move PROTECT, SWIFT, EXPLOSION, SPIKES
	trainer_mon  MUK, 42, NO_ABILITY, MALE
	    mon_move MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	trainer_mon  CROBAT, 44, NO_ABILITY, MALE
	    mon_move DOUBLE_TEAM, QUICK_ATTACK, WING_ATTACK, TOXIC
	db -1 ; end

	end_list_items

ChampionGroup:
	next_list_item ; CHAMPION (1)
	db "LANCE@", TRAINERTYPE_MOVES
	trainer_mon  GYARADOS, 44, NO_ABILITY, MALE
	    mon_move FLAIL, RAIN_DANCE, SURF, HYPER_BEAM
	trainer_mon  DRAGONITE, 47, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, TWISTER, THUNDER, HYPER_BEAM
	trainer_mon  DRAGONITE, 47, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, TWISTER, BLIZZARD, HYPER_BEAM
	trainer_mon  AERODACTYL, 46, NO_ABILITY, MALE
	    mon_move WING_ATTACK, ANCIENTPOWER, ROCK_SLIDE, HYPER_BEAM
	trainer_mon  CHARIZARD, 46, NO_ABILITY, MALE
	    mon_move FLAMETHROWER, WING_ATTACK, SLASH, HYPER_BEAM
	trainer_mon  DRAGONITE, 50, NO_ABILITY, MALE
	    mon_move FIRE_BLAST, SAFEGUARD, OUTRAGE, HYPER_BEAM
	db -1 ; end

	end_list_items

BrockGroup:
	next_list_item ; BROCK (1)
	db "BROCK@", TRAINERTYPE_MOVES
	trainer_mon  GRAVELER, 41, NO_ABILITY, MALE
	    mon_move DEFENSE_CURL, ROCK_SLIDE, ROLLOUT, EARTHQUAKE
	trainer_mon  RHYHORN, 41, NO_ABILITY, MALE
	    mon_move FURY_ATTACK, SCARY_FACE, EARTHQUAKE, HORN_DRILL
	trainer_mon  OMASTAR, 42, NO_ABILITY, MALE
	    mon_move BITE, SURF, PROTECT, SPIKE_CANNON
	trainer_mon  ONIX, 44, NO_ABILITY, MALE
	    mon_move BIND, ROCK_SLIDE, BIDE, SANDSTORM
	trainer_mon  KABUTOPS, 42, NO_ABILITY, MALE
	    mon_move SLASH, SURF, ENDURE, GIGA_DRAIN
	db -1 ; end

	end_list_items

MistyGroup:
	next_list_item ; MISTY (1)
	db "MISTY@", TRAINERTYPE_MOVES
	trainer_mon  GOLDUCK, 42, NO_ABILITY, MALE
	    mon_move SURF, DISABLE, PSYCH_UP, PSYCHIC_M
	trainer_mon  QUAGSIRE, 42, NO_ABILITY, MALE
	    mon_move SURF, AMNESIA, EARTHQUAKE, RAIN_DANCE
	trainer_mon  LAPRAS, 44, NO_ABILITY, MALE
	    mon_move SURF, PERISH_SONG, BLIZZARD, RAIN_DANCE
	trainer_mon  STARMIE, 47, NO_ABILITY, MALE
	    mon_move SURF, CONFUSE_RAY, RECOVER, ICE_BEAM
	db -1 ; end

	end_list_items

LtSurgeGroup:
	next_list_item ; LT_SURGE (1)
	db "LT.SURGE@", TRAINERTYPE_MOVES
	trainer_mon  RAICHU, 44, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, QUICK_ATTACK, THUNDERBOLT, THUNDER
	trainer_mon  ELECTRODE, 40, NO_ABILITY, MALE
	    mon_move SCREECH, DOUBLE_TEAM, SWIFT, EXPLOSION
	trainer_mon  MAGNETON, 40, NO_ABILITY, MALE
	    mon_move LOCK_ON, DOUBLE_TEAM, SWIFT, ZAP_CANNON
	trainer_mon  ELECTRODE, 40, NO_ABILITY, MALE
	    mon_move SCREECH, DOUBLE_TEAM, SWIFT, EXPLOSION
	trainer_mon  ELECTABUZZ, 46, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, THUNDERPUNCH, LIGHT_SCREEN, THUNDER
	db -1 ; end

	end_list_items

ScientistGroup:
	next_list_item ; SCIENTIST (1)
	db "ROSS@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 22, NO_ABILITY, MALE
	trainer_mon  KOFFING, 22, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCIENTIST (2)
	db "MITCH@", TRAINERTYPE_NORMAL
	trainer_mon  DITTO, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCIENTIST (3)
	db "JED@", TRAINERTYPE_NORMAL
	trainer_mon  MAGNEMITE, 20, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 20, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCIENTIST (4)
	db "MARC@", TRAINERTYPE_NORMAL
	trainer_mon  MAGNEMITE, 27, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 27, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 27, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCIENTIST (5)
	db "RICH@", TRAINERTYPE_MOVES
	trainer_mon  PORYGON, 30, NO_ABILITY, MALE
	    mon_move CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db -1 ; end

	end_list_items

ErikaGroup:
	next_list_item ; ERIKA (1)
	db "ERIKA@", TRAINERTYPE_MOVES
	trainer_mon  TANGELA, 42, NO_ABILITY, MALE
	    mon_move VINE_WHIP, BIND, GIGA_DRAIN, SLEEP_POWDER
	trainer_mon  JUMPLUFF, 41, NO_ABILITY, MALE
	    mon_move MEGA_DRAIN, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	trainer_mon  VICTREEBEL, 46, NO_ABILITY, MALE
	    mon_move SUNNY_DAY, SYNTHESIS, ACID, RAZOR_LEAF
	trainer_mon  BELLOSSOM, 46, NO_ABILITY, MALE
	    mon_move SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SOLARBEAM
	db -1 ; end

	end_list_items

YoungsterGroup:
	next_list_item ; YOUNGSTER (1)
	db "JOEY@", TRAINERTYPE_NORMAL
	trainer_mon BIDOOF, 4, SIMPLE, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (2)
	db "MIKEY@", TRAINERTYPE_NORMAL
	trainer_mon PIDGEY, 2, KEEN_EYE, MALE
	trainer_mon BIDOOF, 4, UNAWARE, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (3)
	db "ALBERT@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 6, NO_ABILITY, MALE
	trainer_mon  ZUBAT, 8, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (4)
	db "GORDON@", TRAINERTYPE_NORMAL
	trainer_mon  WOOPER, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (5)
	db "SAMUEL@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 7, NO_ABILITY, MALE
	trainer_mon  SANDSHREW, 10, NO_ABILITY, MALE
	trainer_mon  SPEAROW, 8, NO_ABILITY, MALE
	trainer_mon  SPEAROW, 8, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (6)
	db "IAN@", TRAINERTYPE_NORMAL
	trainer_mon  MANKEY, 10, NO_ABILITY, MALE
	trainer_mon  DIGLETT, 12, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (7)
	db "JOEY@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (8)
	db "JOEY@", TRAINERTYPE_MOVES
	trainer_mon  RATICATE, 21, NO_ABILITY, MALE
	    mon_move TAIL_WHIP, QUICK_ATTACK, HYPER_FANG, SCARY_FACE
	db -1 ; end

	next_list_item ; YOUNGSTER (9)
	db "WARREN@", TRAINERTYPE_NORMAL
	trainer_mon  FEAROW, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (10)
	db "JIMMY@", TRAINERTYPE_NORMAL
	trainer_mon  RATICATE, 33, NO_ABILITY, MALE
	trainer_mon  ARBOK, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (11)
	db "OWEN@", TRAINERTYPE_NORMAL
	trainer_mon  GROWLITHE, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (12)
	db "JASON@", TRAINERTYPE_NORMAL
	trainer_mon  SANDSLASH, 33, NO_ABILITY, MALE
	trainer_mon  CROBAT, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; YOUNGSTER (13)
	db "JOEY@", TRAINERTYPE_MOVES
	trainer_mon  RATICATE, 30, NO_ABILITY, MALE
	    mon_move TAIL_WHIP, QUICK_ATTACK, HYPER_FANG, PURSUIT
	db -1 ; end

	next_list_item ; YOUNGSTER (14)
	db "JOEY@", TRAINERTYPE_MOVES
	trainer_mon  RATICATE, 37, NO_ABILITY, MALE
	    mon_move HYPER_BEAM, QUICK_ATTACK, HYPER_FANG, PURSUIT
	db -1 ; end

	end_list_items

SECTION "Enemy Trainer Parties 2", ROMX

SchoolboyGroup:
	next_list_item ; SCHOOLBOY (1)
	db "JACK@", TRAINERTYPE_NORMAL
	trainer_mon  ODDISH, 12, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (2)
	db "KIPP@", TRAINERTYPE_NORMAL
	trainer_mon  VOLTORB, 27, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 27, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 31, NO_ABILITY, MALE
	trainer_mon  MAGNETON, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (3)
	db "ALAN@", TRAINERTYPE_NORMAL
	trainer_mon  TANGELA, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (4)
	db "JOHNNY@", TRAINERTYPE_NORMAL
	trainer_mon  BELLSPROUT, 29, NO_ABILITY, MALE
	trainer_mon  WEEPINBELL, 31, NO_ABILITY, MALE
	trainer_mon  VICTREEBEL, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (5)
	db "DANNY@", TRAINERTYPE_NORMAL
	trainer_mon  JYNX, 31, NO_ABILITY, MALE
	trainer_mon  ELECTABUZZ, 31, NO_ABILITY, MALE
	trainer_mon  MAGMAR, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (6)
	db "TOMMY@", TRAINERTYPE_NORMAL
	trainer_mon  XATU, 32, NO_ABILITY, MALE
	trainer_mon  ALAKAZAM, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (7)
	db "DUDLEY@", TRAINERTYPE_NORMAL
	trainer_mon  ODDISH, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (8)
	db "JOE@", TRAINERTYPE_NORMAL
	trainer_mon  TANGELA, 33, NO_ABILITY, MALE
	trainer_mon  VAPOREON, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (9)
	db "BILLY@", TRAINERTYPE_NORMAL
	trainer_mon  PARAS, 27, NO_ABILITY, MALE
	trainer_mon  PARAS, 27, NO_ABILITY, MALE
	trainer_mon  POLIWHIRL, 27, NO_ABILITY, MALE
	trainer_mon  DITTO, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (10)
	db "CHAD@", TRAINERTYPE_NORMAL
	trainer_mon  MR__MIME, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (11)
	db "NATE@", TRAINERTYPE_NORMAL
	trainer_mon  LEDIAN, 32, NO_ABILITY, MALE
	trainer_mon  EXEGGUTOR, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (12)
	db "RICKY@", TRAINERTYPE_NORMAL
	trainer_mon  AIPOM, 32, NO_ABILITY, MALE
	trainer_mon  DITTO, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (13)
	db "JACK@", TRAINERTYPE_NORMAL
	trainer_mon  ODDISH, 14, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (14)
	db "JACK@", TRAINERTYPE_NORMAL
	trainer_mon  GLOOM, 28, NO_ABILITY, MALE
	trainer_mon  ELECTRODE, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (15)
	db "ALAN@", TRAINERTYPE_NORMAL
	trainer_mon  TANGELA, 17, NO_ABILITY, MALE
	trainer_mon  YANMA, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (16)
	db "ALAN@", TRAINERTYPE_NORMAL
	trainer_mon  NATU, 20, NO_ABILITY, MALE
	trainer_mon  TANGELA, 22, NO_ABILITY, MALE
	trainer_mon  QUAGSIRE, 20, NO_ABILITY, MALE
	trainer_mon  YANMA, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (17)
	db "CHAD@", TRAINERTYPE_NORMAL
	trainer_mon  MR__MIME, 19, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (18)
	db "CHAD@", TRAINERTYPE_NORMAL
	trainer_mon  MR__MIME, 27, NO_ABILITY, MALE
	trainer_mon  MAGNETON, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (19)
	db "JACK@", TRAINERTYPE_NORMAL
	trainer_mon  GLOOM, 30, NO_ABILITY, MALE
	trainer_mon  GROWLITHE, 33, NO_ABILITY, MALE
	trainer_mon  ELECTRODE, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (20)
	db "JACK@", TRAINERTYPE_MOVES
	trainer_mon  ELECTRODE, 35, NO_ABILITY, MALE
	    mon_move SCREECH, SONICBOOM, ROLLOUT, LIGHT_SCREEN
	trainer_mon  GROWLITHE, 35, NO_ABILITY, MALE
	    mon_move SUNNY_DAY, LEER, TAKE_DOWN, FLAME_WHEEL
	trainer_mon  VILEPLUME, 37, NO_ABILITY, MALE
	    mon_move SOLARBEAM, SLEEP_POWDER, ACID, MOONLIGHT
	db -1 ; end

	next_list_item ; SCHOOLBOY (21)
	db "ALAN@", TRAINERTYPE_NORMAL
	trainer_mon  NATU, 27, NO_ABILITY, MALE
	trainer_mon  TANGELA, 27, NO_ABILITY, MALE
	trainer_mon  QUAGSIRE, 30, NO_ABILITY, MALE
	trainer_mon  YANMA, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (22)
	db "ALAN@", TRAINERTYPE_MOVES
	trainer_mon  XATU, 35, NO_ABILITY, MALE
	    mon_move PECK, NIGHT_SHADE, SWIFT, FUTURE_SIGHT
	trainer_mon  TANGELA, 32, NO_ABILITY, MALE
	    mon_move POISONPOWDER, VINE_WHIP, BIND, MEGA_DRAIN
	trainer_mon  YANMA, 32, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, DOUBLE_TEAM, SONICBOOM, SUPERSONIC
	trainer_mon  QUAGSIRE, 35, NO_ABILITY, MALE
	    mon_move TAIL_WHIP, SLAM, AMNESIA, EARTHQUAKE
	db -1 ; end

	next_list_item ; SCHOOLBOY (23)
	db "CHAD@", TRAINERTYPE_NORMAL
	trainer_mon  MR__MIME, 30, NO_ABILITY, MALE
	trainer_mon  MAGNETON, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SCHOOLBOY (24)
	db "CHAD@", TRAINERTYPE_MOVES
	trainer_mon  MR__MIME, 34, NO_ABILITY, MALE
	    mon_move PSYCHIC_M, LIGHT_SCREEN, REFLECT, ENCORE
	trainer_mon  MAGNETON, 38, NO_ABILITY, MALE
	    mon_move ZAP_CANNON, THUNDER_WAVE, LOCK_ON, SWIFT
	db -1 ; end

	end_list_items

BirdKeeperGroup:
	next_list_item ; BIRD_KEEPER (1)
	db "ROD@", TRAINERTYPE_NORMAL
	trainer_mon  PIDGEY, 7, NO_ABILITY, MALE
	trainer_mon  PIDGEY, 7, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (2)
	db "ABE@", TRAINERTYPE_NORMAL
	trainer_mon  SPEAROW, 9, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (3)
	db "BRYAN@", TRAINERTYPE_NORMAL
	trainer_mon  PIDGEY, 12, NO_ABILITY, MALE
	trainer_mon  PIDGEOTTO, 14, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (4)
	db "THEO@", TRAINERTYPE_NORMAL
	trainer_mon  PIDGEY, 17, NO_ABILITY, MALE
	trainer_mon  PIDGEY, 15, NO_ABILITY, MALE
	trainer_mon  PIDGEY, 19, NO_ABILITY, MALE
	trainer_mon  PIDGEY, 15, NO_ABILITY, MALE
	trainer_mon  PIDGEY, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (5)
	db "TOBY@", TRAINERTYPE_NORMAL
	trainer_mon  DODUO, 15, NO_ABILITY, MALE
	trainer_mon  DODUO, 16, NO_ABILITY, MALE
	trainer_mon  DODUO, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (6)
	db "DENIS@", TRAINERTYPE_NORMAL
	trainer_mon  SPEAROW, 18, NO_ABILITY, MALE
	trainer_mon  FEAROW, 20, NO_ABILITY, MALE
	trainer_mon  SPEAROW, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (7)
	db "VANCE@", TRAINERTYPE_NORMAL
	trainer_mon  PIDGEOTTO, 25, NO_ABILITY, MALE
	trainer_mon  PIDGEOTTO, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (8)
	db "HANK@", TRAINERTYPE_NORMAL
	trainer_mon  PIDGEY, 12, NO_ABILITY, MALE
	trainer_mon  PIDGEOT, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (9)
	db "ROY@", TRAINERTYPE_NORMAL
	trainer_mon  FEAROW, 29, NO_ABILITY, MALE
	trainer_mon  FEAROW, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (10)
	db "BORIS@", TRAINERTYPE_NORMAL
	trainer_mon  DODUO, 30, NO_ABILITY, MALE
	trainer_mon  DODUO, 28, NO_ABILITY, MALE
	trainer_mon  DODRIO, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (11)
	db "BOB@", TRAINERTYPE_NORMAL
	trainer_mon  NOCTOWL, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (12)
	db "JOSE@", TRAINERTYPE_NORMAL
	trainer_mon  FARFETCH_D, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (13)
	db "PETER@", TRAINERTYPE_NORMAL
	trainer_mon  PIDGEY, 6, NO_ABILITY, MALE
	trainer_mon  PIDGEY, 6, NO_ABILITY, MALE
	trainer_mon  SPEAROW, 8, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (14)
	db "JOSE@", TRAINERTYPE_NORMAL
	trainer_mon  FARFETCH_D, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (15)
	db "PERRY@", TRAINERTYPE_NORMAL
	trainer_mon  FARFETCH_D, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (16)
	db "BRET@", TRAINERTYPE_NORMAL
	trainer_mon  PIDGEOTTO, 32, NO_ABILITY, MALE
	trainer_mon  FEAROW, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (17)
	db "JOSE@", TRAINERTYPE_MOVES
	trainer_mon  FARFETCH_D, 40, NO_ABILITY, MALE
	    mon_move FURY_ATTACK, DETECT, FLY, SLASH
	db -1 ; end

	next_list_item ; BIRD_KEEPER (18)
	db "VANCE@", TRAINERTYPE_NORMAL
	trainer_mon  PIDGEOTTO, 32, NO_ABILITY, MALE
	trainer_mon  PIDGEOTTO, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIRD_KEEPER (19)
	db "VANCE@", TRAINERTYPE_MOVES
	trainer_mon  PIDGEOT, 38, NO_ABILITY, MALE
	    mon_move TOXIC, QUICK_ATTACK, WHIRLWIND, FLY
	trainer_mon  PIDGEOT, 38, NO_ABILITY, MALE
	    mon_move SWIFT, DETECT, STEEL_WING, FLY
	db -1 ; end

	end_list_items

LassGroup:
	next_list_item ; LASS (1)
	db "CARRIE@", TRAINERTYPE_MOVES
	trainer_mon  SNUBBULL, 18, NO_ABILITY, MALE
	    mon_move SCARY_FACE, CHARM, BITE, LICK
	db -1 ; end

	next_list_item ; LASS (2)
	db "BRIDGET@", TRAINERTYPE_NORMAL
	trainer_mon  JIGGLYPUFF, 15, NO_ABILITY, MALE
	trainer_mon  JIGGLYPUFF, 15, NO_ABILITY, MALE
	trainer_mon  JIGGLYPUFF, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (3)
	db "ALICE@", TRAINERTYPE_NORMAL
	trainer_mon  GLOOM, 30, NO_ABILITY, MALE
	trainer_mon  ARBOK, 34, NO_ABILITY, MALE
	trainer_mon  GLOOM, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (4)
	db "KRISE@", TRAINERTYPE_NORMAL
	trainer_mon  ODDISH, 12, NO_ABILITY, MALE
	trainer_mon  CUBONE, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (5)
	db "CONNIE@", TRAINERTYPE_NORMAL
	trainer_mon  MARILL, 21, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (6)
	db "LINDA@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 30, NO_ABILITY, MALE
	trainer_mon  IVYSAUR, 32, NO_ABILITY, MALE
	trainer_mon  VENUSAUR, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (7)
	db "LAURA@", TRAINERTYPE_NORMAL
	trainer_mon  GLOOM, 28, NO_ABILITY, MALE
	trainer_mon  PIDGEOTTO, 31, NO_ABILITY, MALE
	trainer_mon  BELLOSSOM, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (8)
	db "SHANNON@", TRAINERTYPE_NORMAL
	trainer_mon  PARAS, 29, NO_ABILITY, MALE
	trainer_mon  PARAS, 29, NO_ABILITY, MALE
	trainer_mon  PARASECT, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (9)
	db "MICHELLE@", TRAINERTYPE_NORMAL
	trainer_mon  SKIPLOOM, 32, NO_ABILITY, MALE
	trainer_mon  HOPPIP, 33, NO_ABILITY, MALE
	trainer_mon  JUMPLUFF, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (10)
	db "DANA@", TRAINERTYPE_MOVES
	trainer_mon  FLAAFFY, 18, NO_ABILITY, MALE
	    mon_move TACKLE, GROWL, THUNDERSHOCK, THUNDER_WAVE
	trainer_mon  PSYDUCK, 18, NO_ABILITY, MALE
	    mon_move SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db -1 ; end

	next_list_item ; LASS (11)
	db "ELLEN@", TRAINERTYPE_NORMAL
	trainer_mon  WIGGLYTUFF, 30, NO_ABILITY, MALE
	trainer_mon  GRANBULL, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (12)
	db "CONNIE@", TRAINERTYPE_NORMAL
	trainer_mon  MARILL, 21, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (13)
	db "CONNIE@", TRAINERTYPE_NORMAL
	trainer_mon  MARILL, 21, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; LASS (14)
	db "DANA@", TRAINERTYPE_MOVES
	trainer_mon  FLAAFFY, 21, NO_ABILITY, MALE
	    mon_move TACKLE, GROWL, THUNDERSHOCK, THUNDER_WAVE
	trainer_mon  PSYDUCK, 21, NO_ABILITY, MALE
	    mon_move SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db -1 ; end

	next_list_item ; LASS (15)
	db "DANA@", TRAINERTYPE_MOVES
	trainer_mon  PSYDUCK, 29, NO_ABILITY, MALE
	    mon_move SCRATCH, DISABLE, CONFUSION, SCREECH
	trainer_mon  AMPHAROS, 29, NO_ABILITY, MALE
	    mon_move TACKLE, THUNDERSHOCK, THUNDER_WAVE, COTTON_SPORE
	db -1 ; end

	next_list_item ; LASS (16)
	db "DANA@", TRAINERTYPE_MOVES
	trainer_mon  PSYDUCK, 32, NO_ABILITY, MALE
	    mon_move SCRATCH, DISABLE, CONFUSION, SCREECH
	trainer_mon  AMPHAROS, 32, NO_ABILITY, MALE
	    mon_move TACKLE, THUNDERPUNCH, THUNDER_WAVE, COTTON_SPORE
	db -1 ; end

	next_list_item ; LASS (17)
	db "DANA@", TRAINERTYPE_MOVES
	trainer_mon  AMPHAROS, 36, NO_ABILITY, MALE
	    mon_move SWIFT, THUNDERPUNCH, THUNDER_WAVE, COTTON_SPORE
	trainer_mon  GOLDUCK, 36, NO_ABILITY, MALE
	    mon_move DISABLE, SURF, PSYCHIC_M, SCREECH
	db -1 ; end

	end_list_items

JanineGroup:
	next_list_item ; JANINE (1)
	db "JANINE@", TRAINERTYPE_MOVES
	trainer_mon  CROBAT, 36, NO_ABILITY, MALE
	    mon_move SCREECH, SUPERSONIC, CONFUSE_RAY, WING_ATTACK
	trainer_mon  WEEZING, 36, NO_ABILITY, MALE
	    mon_move SMOG, SLUDGE_BOMB, TOXIC, EXPLOSION
	trainer_mon  WEEZING, 36, NO_ABILITY, MALE
	    mon_move SMOG, SLUDGE_BOMB, TOXIC, EXPLOSION
	trainer_mon  ARIADOS, 33, NO_ABILITY, MALE
	    mon_move SCARY_FACE, GIGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	trainer_mon  VENOMOTH, 39, NO_ABILITY, MALE
	    mon_move FORESIGHT, DOUBLE_TEAM, GUST, PSYCHIC_M
	db -1 ; end

	end_list_items

CooltrainerMGroup:
	next_list_item ; COOLTRAINERM (1)
	db "NICK@", TRAINERTYPE_MOVES
	trainer_mon  CHARMANDER, 26, NO_ABILITY, MALE
	    mon_move EMBER, SMOKESCREEN, RAGE, SCARY_FACE
	trainer_mon  SQUIRTLE, 26, NO_ABILITY, MALE
	    mon_move WITHDRAW, WATER_GUN, BITE, CURSE
	trainer_mon  BULBASAUR, 26, NO_ABILITY, MALE
	    mon_move LEECH_SEED, POISONPOWDER, SLEEP_POWDER, RAZOR_LEAF
	db -1 ; end

	next_list_item ; COOLTRAINERM (2)
	db "AARON@", TRAINERTYPE_NORMAL
	trainer_mon  IVYSAUR, 24, NO_ABILITY, MALE
	trainer_mon  CHARMELEON, 24, NO_ABILITY, MALE
	trainer_mon  WARTORTLE, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (3)
	db "PAUL@", TRAINERTYPE_NORMAL
	trainer_mon  DRATINI, 34, NO_ABILITY, MALE
	trainer_mon  DRATINI, 34, NO_ABILITY, MALE
	trainer_mon  DRATINI, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (4)
	db "CODY@", TRAINERTYPE_NORMAL
	trainer_mon  HORSEA, 34, NO_ABILITY, MALE
	trainer_mon  SEADRA, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (5)
	db "MIKE@", TRAINERTYPE_NORMAL
	trainer_mon  DRAGONAIR, 37, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (6)
	db "GAVEN@", TRAINERTYPE_MOVES
	trainer_mon  VICTREEBEL, 35, NO_ABILITY, MALE
	    mon_move WRAP, TOXIC, ACID, RAZOR_LEAF
	trainer_mon  KINGLER, 35, NO_ABILITY, MALE
	    mon_move BUBBLEBEAM, STOMP, GUILLOTINE, PROTECT
	trainer_mon  FLAREON, 35, NO_ABILITY, MALE
	    mon_move SAND_ATTACK, QUICK_ATTACK, BITE, FIRE_SPIN
	db -1 ; end

	next_list_item ; COOLTRAINERM (7)
	db "GAVEN@", TRAINERTYPE_MOVES | TRAINERTYPE_ITEM
	trainer_mon  VICTREEBEL, 39, NO_ABILITY, MALE
	    mon_item NO_ITEM
	    mon_move GIGA_DRAIN, TOXIC, SLUDGE_BOMB, RAZOR_LEAF
	trainer_mon  KINGLER, 39, NO_ABILITY, MALE
	    mon_item KINGS_ROCK
	    mon_move SURF, STOMP, GUILLOTINE, BLIZZARD
	trainer_mon  FLAREON, 39, NO_ABILITY, MALE
	    mon_item NO_ITEM
	    mon_move FLAMETHROWER, QUICK_ATTACK, BITE, FIRE_SPIN
	db -1 ; end

	next_list_item ; COOLTRAINERM (8)
	db "RYAN@", TRAINERTYPE_MOVES
	trainer_mon  PIDGEOT, 25, NO_ABILITY, MALE
	    mon_move SAND_ATTACK, QUICK_ATTACK, WHIRLWIND, WING_ATTACK
	trainer_mon  ELECTABUZZ, 27, NO_ABILITY, MALE
	    mon_move THUNDERPUNCH, LIGHT_SCREEN, SWIFT, SCREECH
	db -1 ; end

	next_list_item ; COOLTRAINERM (9)
	db "JAKE@", TRAINERTYPE_MOVES
	trainer_mon  PARASECT, 33, NO_ABILITY, MALE
	    mon_move LEECH_LIFE, SPORE, SLASH, SWORDS_DANCE
	trainer_mon  GOLDUCK, 35, NO_ABILITY, MALE
	    mon_move CONFUSION, SCREECH, PSYCH_UP, FURY_SWIPES
	db -1 ; end

	next_list_item ; COOLTRAINERM (10)
	db "GAVEN@", TRAINERTYPE_MOVES
	trainer_mon  VICTREEBEL, 32, NO_ABILITY, MALE
	    mon_move WRAP, TOXIC, ACID, RAZOR_LEAF
	trainer_mon  KINGLER, 32, NO_ABILITY, MALE
	    mon_move BUBBLEBEAM, STOMP, GUILLOTINE, PROTECT
	trainer_mon  FLAREON, 32, NO_ABILITY, MALE
	    mon_move SAND_ATTACK, QUICK_ATTACK, BITE, FIRE_SPIN
	db -1 ; end

	next_list_item ; COOLTRAINERM (11)
	db "BLAKE@", TRAINERTYPE_MOVES
	trainer_mon  MAGNETON, 33, NO_ABILITY, MALE
	    mon_move THUNDERBOLT, SUPERSONIC, SWIFT, SCREECH
	trainer_mon  QUAGSIRE, 31, NO_ABILITY, MALE
	    mon_move WATER_GUN, SLAM, AMNESIA, EARTHQUAKE
	trainer_mon  EXEGGCUTE, 31, NO_ABILITY, MALE
	    mon_move LEECH_SEED, CONFUSION, SLEEP_POWDER, SOLARBEAM
	db -1 ; end

	next_list_item ; COOLTRAINERM (12)
	db "BRIAN@", TRAINERTYPE_MOVES
	trainer_mon  SANDSLASH, 35, NO_ABILITY, MALE
	    mon_move SAND_ATTACK, POISON_STING, SLASH, SWIFT
	db -1 ; end

	next_list_item ; COOLTRAINERM (13)
	db "ERICK@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 10, NO_ABILITY, MALE
	trainer_mon  CHARMANDER, 10, NO_ABILITY, MALE
	trainer_mon  SQUIRTLE, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (14)
	db "ANDY@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 10, NO_ABILITY, MALE
	trainer_mon  CHARMANDER, 10, NO_ABILITY, MALE
	trainer_mon  SQUIRTLE, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (15)
	db "TYLER@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 10, NO_ABILITY, MALE
	trainer_mon  CHARMANDER, 10, NO_ABILITY, MALE
	trainer_mon  SQUIRTLE, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (16)
	db "SEAN@", TRAINERTYPE_NORMAL
	trainer_mon  FLAREON, 35, NO_ABILITY, MALE
	trainer_mon  TANGELA, 35, NO_ABILITY, MALE
	trainer_mon  TAUROS, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (17)
	db "KEVIN@", TRAINERTYPE_NORMAL
	trainer_mon  RHYHORN, 38, NO_ABILITY, MALE
	trainer_mon  CHARMELEON, 35, NO_ABILITY, MALE
	trainer_mon  WARTORTLE, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (18)
	db "STEVE@", TRAINERTYPE_NORMAL
	trainer_mon  BULBASAUR, 14, NO_ABILITY, MALE
	trainer_mon  CHARMANDER, 14, NO_ABILITY, MALE
	trainer_mon  SQUIRTLE, 14, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERM (19)
	db "ALLEN@", TRAINERTYPE_MOVES
	trainer_mon  CHARMELEON, 27, NO_ABILITY, MALE
	    mon_move EMBER, SMOKESCREEN, RAGE, SCARY_FACE
	db -1 ; end

	next_list_item ; COOLTRAINERM (20)
	db "DARIN@", TRAINERTYPE_MOVES
	trainer_mon  DRAGONAIR, 37, NO_ABILITY, MALE
	    mon_move WRAP, SURF, DRAGON_RAGE, SLAM
	db -1 ; end

	end_list_items

CooltrainerFGroup:
	next_list_item ; COOLTRAINERF (1)
	db "GWEN@", TRAINERTYPE_NORMAL
	trainer_mon  EEVEE, 26, NO_ABILITY, MALE
	trainer_mon  FLAREON, 22, NO_ABILITY, MALE
	trainer_mon  VAPOREON, 22, NO_ABILITY, MALE
	trainer_mon  JOLTEON, 22, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (2)
	db "LOIS@", TRAINERTYPE_MOVES
	trainer_mon  SKIPLOOM, 25, NO_ABILITY, MALE
	    mon_move SYNTHESIS, POISONPOWDER, MEGA_DRAIN, LEECH_SEED
	trainer_mon  NINETALES, 25, NO_ABILITY, MALE
	    mon_move EMBER, QUICK_ATTACK, CONFUSE_RAY, SAFEGUARD
	db -1 ; end

	next_list_item ; COOLTRAINERF (3)
	db "FRAN@", TRAINERTYPE_NORMAL
	trainer_mon  SEADRA, 37, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (4)
	db "LOLA@", TRAINERTYPE_NORMAL
	trainer_mon  DRATINI, 34, NO_ABILITY, MALE
	trainer_mon  DRAGONAIR, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (5)
	db "KATE@", TRAINERTYPE_NORMAL
	trainer_mon  SHELLDER, 26, NO_ABILITY, MALE
	trainer_mon  CLOYSTER, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (6)
	db "IRENE@", TRAINERTYPE_NORMAL
	trainer_mon  GOLDEEN, 22, NO_ABILITY, MALE
	trainer_mon  SEAKING, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (7)
	db "KELLY@", TRAINERTYPE_NORMAL
	trainer_mon  MARILL, 27, NO_ABILITY, MALE
	trainer_mon  WARTORTLE, 24, NO_ABILITY, MALE
	trainer_mon  WARTORTLE, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (8)
	db "JOYCE@", TRAINERTYPE_MOVES
	trainer_mon  PIKACHU, 36, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, DOUBLE_TEAM, THUNDERBOLT, THUNDER
	trainer_mon  BLASTOISE, 32, NO_ABILITY, MALE
	    mon_move BITE, CURSE, SURF, RAIN_DANCE
	db -1 ; end

	next_list_item ; COOLTRAINERF (9)
	db "BETH@", TRAINERTYPE_MOVES
	trainer_mon  RAPIDASH, 36, NO_ABILITY, MALE
	    mon_move STOMP, FIRE_SPIN, FURY_ATTACK, AGILITY
	db -1 ; end

	next_list_item ; COOLTRAINERF (10)
	db "REENA@", TRAINERTYPE_NORMAL
	trainer_mon  STARMIE, 31, NO_ABILITY, MALE
	trainer_mon  NIDOQUEEN, 33, NO_ABILITY, MALE
	trainer_mon  STARMIE, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (11)
	db "MEGAN@", TRAINERTYPE_MOVES
	trainer_mon  BULBASAUR, 32, NO_ABILITY, MALE
	    mon_move GROWL, LEECH_SEED, POISONPOWDER, RAZOR_LEAF
	trainer_mon  IVYSAUR, 32, NO_ABILITY, MALE
	    mon_move GROWL, LEECH_SEED, POISONPOWDER, RAZOR_LEAF
	trainer_mon  VENUSAUR, 32, NO_ABILITY, MALE
	    mon_move BODY_SLAM, SLEEP_POWDER, RAZOR_LEAF, SWEET_SCENT
	db -1 ; end

	next_list_item ; COOLTRAINERF (12)
	db "BETH@", TRAINERTYPE_MOVES
	trainer_mon  RAPIDASH, 39, NO_ABILITY, MALE
	    mon_move STOMP, FIRE_SPIN, FURY_ATTACK, AGILITY
	db -1 ; end

	next_list_item ; COOLTRAINERF (13)
	db "CAROL@", TRAINERTYPE_NORMAL
	trainer_mon  ELECTRODE, 35, NO_ABILITY, MALE
	trainer_mon  STARMIE, 35, NO_ABILITY, MALE
	trainer_mon  NINETALES, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (14)
	db "QUINN@", TRAINERTYPE_NORMAL
	trainer_mon  IVYSAUR, 38, NO_ABILITY, MALE
	trainer_mon  STARMIE, 38, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (15)
	db "EMMA@", TRAINERTYPE_NORMAL
	trainer_mon  POLIWHIRL, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (16)
	db "CYBIL@", TRAINERTYPE_MOVES
	trainer_mon  BUTTERFREE, 25, NO_ABILITY, MALE
	    mon_move CONFUSION, SLEEP_POWDER, WHIRLWIND, GUST
	trainer_mon  BELLOSSOM, 25, NO_ABILITY, MALE
	    mon_move ABSORB, STUN_SPORE, ACID, SOLARBEAM
	db -1 ; end

	next_list_item ; COOLTRAINERF (17)
	db "JENN@", TRAINERTYPE_NORMAL
	trainer_mon  STARYU, 24, NO_ABILITY, MALE
	trainer_mon  STARMIE, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (18)
	db "BETH@", TRAINERTYPE_MOVES | TRAINERTYPE_ITEM
	trainer_mon  RAPIDASH, 43, NO_ABILITY, MALE
	    mon_item FOCUS_BAND
	    mon_move STOMP, FIRE_SPIN, FURY_ATTACK, FIRE_BLAST
	db -1 ; end

	next_list_item ; COOLTRAINERF (19)
	db "REENA@", TRAINERTYPE_NORMAL
	trainer_mon  STARMIE, 34, NO_ABILITY, MALE
	trainer_mon  NIDOQUEEN, 36, NO_ABILITY, MALE
	trainer_mon  STARMIE, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; COOLTRAINERF (20)
	db "REENA@", TRAINERTYPE_MOVES | TRAINERTYPE_ITEM
	trainer_mon  STARMIE, 38, NO_ABILITY, MALE
	    mon_item NO_ITEM
	    mon_move DOUBLE_TEAM, PSYCHIC_M, WATERFALL, CONFUSE_RAY
	trainer_mon  NIDOQUEEN, 40, NO_ABILITY, MALE
	    mon_item PINK_BOW
	    mon_move EARTHQUAKE, DOUBLE_KICK, TOXIC, BODY_SLAM
	trainer_mon  STARMIE, 38, NO_ABILITY, MALE
	    mon_item NO_ITEM
	    mon_move BLIZZARD, PSYCHIC_M, WATERFALL, RECOVER
	db -1 ; end

	next_list_item ; COOLTRAINERF (21)
	db "CARA@", TRAINERTYPE_MOVES
	trainer_mon  HORSEA, 33, NO_ABILITY, MALE
	    mon_move SMOKESCREEN, LEER, WHIRLPOOL, TWISTER
	trainer_mon  HORSEA, 33, NO_ABILITY, MALE
	    mon_move SMOKESCREEN, LEER, WHIRLPOOL, TWISTER
	trainer_mon  SEADRA, 35, NO_ABILITY, MALE
	    mon_move SWIFT, LEER, WATERFALL, TWISTER
	db -1 ; end

	end_list_items

BeautyGroup:
	next_list_item ; BEAUTY (1)
	db "VICTORIA@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 9, NO_ABILITY, MALE
	trainer_mon  SENTRET, 13, NO_ABILITY, MALE
	trainer_mon  SENTRET, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (2)
	db "SAMANTHA@", TRAINERTYPE_MOVES
	trainer_mon  MEOWTH, 16, NO_ABILITY, MALE
	    mon_move SCRATCH, GROWL, BITE, PAY_DAY
	trainer_mon  MEOWTH, 16, NO_ABILITY, MALE
	    mon_move SCRATCH, GROWL, BITE, SLASH
	db -1 ; end

	next_list_item ; BEAUTY (3)
	db "JULIE@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (4)
	db "JACLYN@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (5)
	db "BRENDA@", TRAINERTYPE_NORMAL
	trainer_mon  FURRET, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (6)
	db "CASSIE@", TRAINERTYPE_NORMAL
	trainer_mon  VILEPLUME, 28, NO_ABILITY, MALE
	trainer_mon  BUTTERFREE, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (7)
	db "CAROLINE@", TRAINERTYPE_NORMAL
	trainer_mon  MARILL, 30, NO_ABILITY, MALE
	trainer_mon  SEEL, 32, NO_ABILITY, MALE
	trainer_mon  MARILL, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (8)
	db "CARLENE@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (9)
	db "JESSICA@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (10)
	db "RACHAEL@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (11)
	db "ANGELICA@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (12)
	db "KENDRA@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (13)
	db "VERONICA@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (14)
	db "JULIA@", TRAINERTYPE_NORMAL
	trainer_mon  PARAS, 32, NO_ABILITY, MALE
	trainer_mon  EXEGGCUTE, 32, NO_ABILITY, MALE
	trainer_mon  PARASECT, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (15)
	db "THERESA@", TRAINERTYPE_NORMAL
	trainer_mon  SENTRET, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BEAUTY (16)
	db "VALERIE@", TRAINERTYPE_MOVES
	trainer_mon  HOPPIP, 17, NO_ABILITY, MALE
	    mon_move SYNTHESIS, TAIL_WHIP, TACKLE, POISONPOWDER
	trainer_mon  SKIPLOOM, 17, NO_ABILITY, MALE
	    mon_move SYNTHESIS, TAIL_WHIP, TACKLE, STUN_SPORE
	db -1 ; end

	next_list_item ; BEAUTY (17)
	db "OLIVIA@", TRAINERTYPE_NORMAL
	trainer_mon  CORSOLA, 19, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

PokemaniacGroup:
	next_list_item ; POKEMANIAC (1)
	db "LARRY@", TRAINERTYPE_NORMAL
	trainer_mon  SLOWPOKE, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (2)
	db "ANDREW@", TRAINERTYPE_NORMAL
	trainer_mon  MAROWAK, 24, NO_ABILITY, MALE
	trainer_mon  MAROWAK, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (3)
	db "CALVIN@", TRAINERTYPE_NORMAL
	trainer_mon  KANGASKHAN, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (4)
	db "SHANE@", TRAINERTYPE_NORMAL
	trainer_mon  NIDORINA, 16, NO_ABILITY, MALE
	trainer_mon  NIDORINO, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (5)
	db "BEN@", TRAINERTYPE_NORMAL
	trainer_mon  SLOWBRO, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (6)
	db "BRENT@", TRAINERTYPE_NORMAL
	trainer_mon  LICKITUNG, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (7)
	db "RON@", TRAINERTYPE_NORMAL
	trainer_mon  NIDOKING, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (8)
	db "ETHAN@", TRAINERTYPE_NORMAL
	trainer_mon  RHYHORN, 31, NO_ABILITY, MALE
	trainer_mon  RHYDON, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (9)
	db "BRENT@", TRAINERTYPE_NORMAL
	trainer_mon  KANGASKHAN, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (10)
	db "BRENT@", TRAINERTYPE_MOVES
	trainer_mon  PORYGON, 36, NO_ABILITY, MALE
	    mon_move RECOVER, PSYCHIC_M, CONVERSION2, TRI_ATTACK
	db -1 ; end

	next_list_item ; POKEMANIAC (11)
	db "ISSAC@", TRAINERTYPE_MOVES
	trainer_mon  LICKITUNG, 12, NO_ABILITY, MALE
	    mon_move LICK, SUPERSONIC, CUT, NO_MOVE
	db -1 ; end

	next_list_item ; POKEMANIAC (12)
	db "DONALD@", TRAINERTYPE_NORMAL
	trainer_mon  SLOWPOKE, 10, NO_ABILITY, MALE
	trainer_mon  SLOWPOKE, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (13)
	db "ZACH@", TRAINERTYPE_NORMAL
	trainer_mon  RHYHORN, 27, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; POKEMANIAC (14)
	db "BRENT@", TRAINERTYPE_MOVES
	trainer_mon  CHANSEY, 41, NO_ABILITY, MALE
	    mon_move ROLLOUT, ATTRACT, EGG_BOMB, SOFTBOILED
	db -1 ; end

	next_list_item ; POKEMANIAC (15)
	db "MILLER@", TRAINERTYPE_NORMAL
	trainer_mon  NIDOKING, 17, NO_ABILITY, MALE
	trainer_mon  NIDOQUEEN, 17, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

GruntMGroup:
	next_list_item ; GRUNTM (1)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 14, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (2)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 7, NO_ABILITY, MALE
	trainer_mon  ZUBAT, 9, NO_ABILITY, MALE
	trainer_mon  ZUBAT, 9, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (3)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATICATE, 24, NO_ABILITY, MALE
	trainer_mon  RATICATE, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (4)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  GRIMER, 23, NO_ABILITY, MALE
	trainer_mon  GRIMER, 23, NO_ABILITY, MALE
	trainer_mon  MUK, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (5)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 21, NO_ABILITY, MALE
	trainer_mon  RATTATA, 21, NO_ABILITY, MALE
	trainer_mon  RATTATA, 23, NO_ABILITY, MALE
	trainer_mon  RATTATA, 23, NO_ABILITY, MALE
	trainer_mon  RATTATA, 23, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (6)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  ZUBAT, 26, NO_ABILITY, MALE
	trainer_mon  ZUBAT, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (7)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 23, NO_ABILITY, MALE
	trainer_mon  GRIMER, 23, NO_ABILITY, MALE
	trainer_mon  ZUBAT, 23, NO_ABILITY, MALE
	trainer_mon  RATTATA, 23, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (8)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  WEEZING, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (9)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATICATE, 24, NO_ABILITY, MALE
	trainer_mon  KOFFING, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (10)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  ZUBAT, 22, NO_ABILITY, MALE
	trainer_mon  GOLBAT, 24, NO_ABILITY, MALE
	trainer_mon  GRIMER, 22, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (11)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  MUK, 23, NO_ABILITY, MALE
	trainer_mon  KOFFING, 23, NO_ABILITY, MALE
	trainer_mon  RATTATA, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (12)
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	trainer_mon  HOUNDOUR, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (13)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 27, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (14)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATICATE, 24, NO_ABILITY, MALE
	trainer_mon  GOLBAT, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (15)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  GRIMER, 26, NO_ABILITY, MALE
	trainer_mon  WEEZING, 23, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (16)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 16, NO_ABILITY, MALE
	trainer_mon  RATTATA, 16, NO_ABILITY, MALE
	trainer_mon  RATTATA, 16, NO_ABILITY, MALE
	trainer_mon  RATTATA, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (17)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  GOLBAT, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (18)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 17, NO_ABILITY, MALE
	trainer_mon  ZUBAT, 17, NO_ABILITY, MALE
	trainer_mon  RATTATA, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (19)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  VENONAT, 18, NO_ABILITY, MALE
	trainer_mon  VENONAT, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (20)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  DROWZEE, 17, NO_ABILITY, MALE
	trainer_mon  ZUBAT, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (21)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  ZUBAT, 16, NO_ABILITY, MALE
	trainer_mon  GRIMER, 17, NO_ABILITY, MALE
	trainer_mon  RATTATA, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (22)
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	trainer_mon  GOLBAT, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (23)
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (24)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 25, NO_ABILITY, MALE
	trainer_mon  KOFFING, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (25)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 24, NO_ABILITY, MALE
	trainer_mon  MUK, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (26)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 15, NO_ABILITY, MALE
	trainer_mon  RATTATA, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (27)
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	trainer_mon  ZUBAT, 22, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (28)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATICATE, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (29)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  RATTATA, 9, NO_ABILITY, MALE
	trainer_mon  RATTATA, 9, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (30)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  GOLBAT, 25, NO_ABILITY, MALE
	trainer_mon  GOLBAT, 25, NO_ABILITY, MALE
	trainer_mon  ARBOK, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTM (31)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  GOLBAT, 30, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

GentlemanGroup:
	next_list_item ; GENTLEMAN (1)
	db "PRESTON@", TRAINERTYPE_NORMAL
	trainer_mon  GROWLITHE, 18, NO_ABILITY, MALE
	trainer_mon  GROWLITHE, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GENTLEMAN (2)
	db "EDWARD@", TRAINERTYPE_NORMAL
	trainer_mon  PERSIAN, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GENTLEMAN (3)
	db "GREGORY@", TRAINERTYPE_NORMAL
	trainer_mon  PIKACHU, 37, NO_ABILITY, MALE
	trainer_mon  FLAAFFY, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GENTLEMAN (4)
	db "VIRGIL@", TRAINERTYPE_NORMAL
	trainer_mon  PONYTA, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GENTLEMAN (5)
	db "ALFRED@", TRAINERTYPE_NORMAL
	trainer_mon  NOCTOWL, 20, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

SkierGroup:
	next_list_item ; SKIER (1)
	db "ROXANNE@", TRAINERTYPE_NORMAL
	trainer_mon  JYNX, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SKIER (2)
	db "CLARISSA@", TRAINERTYPE_NORMAL
	trainer_mon  DEWGONG, 28, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

TeacherGroup:
	next_list_item ; TEACHER (1)
	db "COLETTE@", TRAINERTYPE_NORMAL
	trainer_mon  CLEFAIRY, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; TEACHER (2)
	db "HILLARY@", TRAINERTYPE_NORMAL
	trainer_mon  AIPOM, 32, NO_ABILITY, MALE
	trainer_mon  CUBONE, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; TEACHER (3)
	db "SHIRLEY@", TRAINERTYPE_NORMAL
	trainer_mon  JIGGLYPUFF, 35, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

SabrinaGroup:
	next_list_item ; SABRINA (1)
	db "SABRINA@", TRAINERTYPE_MOVES
	trainer_mon  ESPEON, 46, NO_ABILITY, MALE
	    mon_move SAND_ATTACK, QUICK_ATTACK, SWIFT, PSYCHIC_M
	trainer_mon  MR__MIME, 46, NO_ABILITY, MALE
	    mon_move BARRIER, REFLECT, BATON_PASS, PSYCHIC_M
	trainer_mon  ALAKAZAM, 48, NO_ABILITY, MALE
	    mon_move RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	db -1 ; end

	end_list_items

BugCatcherGroup:
	next_list_item ; BUG_CATCHER (1)
	db "DON@", TRAINERTYPE_NORMAL
	trainer_mon  CATERPIE, 3, NO_ABILITY, MALE
	trainer_mon  CATERPIE, 3, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (2)
	db "ROB@", TRAINERTYPE_NORMAL
	trainer_mon  BEEDRILL, 32, NO_ABILITY, MALE
	trainer_mon  BUTTERFREE, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (3)
	db "ED@", TRAINERTYPE_NORMAL
	trainer_mon  BEEDRILL, 30, NO_ABILITY, MALE
	trainer_mon  BEEDRILL, 30, NO_ABILITY, MALE
	trainer_mon  BEEDRILL, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (4)
	db "WADE@", TRAINERTYPE_NORMAL
	trainer_mon  CATERPIE, 2, NO_ABILITY, MALE
	trainer_mon  CATERPIE, 2, NO_ABILITY, MALE
	trainer_mon  WEEDLE, 3, NO_ABILITY, MALE
	trainer_mon  CATERPIE, 2, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (5)
	db "BENNY@", TRAINERTYPE_NORMAL
	trainer_mon  WEEDLE, 7, NO_ABILITY, MALE
	trainer_mon  KAKUNA, 9, NO_ABILITY, MALE
	trainer_mon  BEEDRILL, 12, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (6)
	db "AL@", TRAINERTYPE_NORMAL
	trainer_mon  CATERPIE, 12, NO_ABILITY, MALE
	trainer_mon  WEEDLE, 12, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (7)
	db "JOSH@", TRAINERTYPE_NORMAL
	trainer_mon  PARAS, 13, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (8)
	db "ARNIE@", TRAINERTYPE_NORMAL
	trainer_mon  VENONAT, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (9)
	db "KEN@", TRAINERTYPE_NORMAL
	trainer_mon  ARIADOS, 30, NO_ABILITY, MALE
	trainer_mon  PINSIR, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (10)
	db "WADE@", TRAINERTYPE_NORMAL
	trainer_mon  METAPOD, 9, NO_ABILITY, MALE
	trainer_mon  METAPOD, 9, NO_ABILITY, MALE
	trainer_mon  KAKUNA, 10, NO_ABILITY, MALE
	trainer_mon  METAPOD, 9, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (11)
	db "WADE@", TRAINERTYPE_NORMAL
	trainer_mon  BUTTERFREE, 14, NO_ABILITY, MALE
	trainer_mon  BUTTERFREE, 14, NO_ABILITY, MALE
	trainer_mon  BEEDRILL, 15, NO_ABILITY, MALE
	trainer_mon  BUTTERFREE, 14, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (12)
	db "DOUG@", TRAINERTYPE_NORMAL
	trainer_mon  ARIADOS, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (13)
	db "ARNIE@", TRAINERTYPE_NORMAL
	trainer_mon  VENONAT, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BUG_CATCHER (14)
	db "ARNIE@", TRAINERTYPE_MOVES
	trainer_mon  VENOMOTH, 28, NO_ABILITY, MALE
	    mon_move DISABLE, SUPERSONIC, CONFUSION, LEECH_LIFE
	db -1 ; end

	next_list_item ; BUG_CATCHER (15)
	db "WADE@", TRAINERTYPE_MOVES
	trainer_mon  BUTTERFREE, 24, NO_ABILITY, MALE
	    mon_move CONFUSION, POISONPOWDER, SUPERSONIC, WHIRLWIND
	trainer_mon  BUTTERFREE, 24, NO_ABILITY, MALE
	    mon_move CONFUSION, STUN_SPORE, SUPERSONIC, WHIRLWIND
	trainer_mon  BEEDRILL, 25, NO_ABILITY, MALE
	    mon_move FURY_ATTACK, FOCUS_ENERGY, TWINEEDLE, RAGE
	trainer_mon  BUTTERFREE, 24, NO_ABILITY, MALE
	    mon_move CONFUSION, SLEEP_POWDER, SUPERSONIC, WHIRLWIND
	db -1 ; end

	next_list_item ; BUG_CATCHER (16)
	db "WADE@", TRAINERTYPE_MOVES
	trainer_mon  BUTTERFREE, 30, NO_ABILITY, MALE
	    mon_move CONFUSION, POISONPOWDER, SUPERSONIC, GUST
	trainer_mon  BUTTERFREE, 30, NO_ABILITY, MALE
	    mon_move CONFUSION, STUN_SPORE, SUPERSONIC, GUST
	trainer_mon  BEEDRILL, 32, NO_ABILITY, MALE
	    mon_move FURY_ATTACK, PURSUIT, TWINEEDLE, DOUBLE_TEAM
	trainer_mon  BUTTERFREE, 34, NO_ABILITY, MALE
	    mon_move PSYBEAM, SLEEP_POWDER, GUST, WHIRLWIND
	db -1 ; end

	next_list_item ; BUG_CATCHER (17)
	db "ARNIE@", TRAINERTYPE_MOVES
	trainer_mon  VENOMOTH, 36, NO_ABILITY, MALE
	    mon_move GUST, SUPERSONIC, PSYBEAM, LEECH_LIFE
	db -1 ; end

	next_list_item ; BUG_CATCHER (18)
	db "ARNIE@", TRAINERTYPE_MOVES
	trainer_mon  VENOMOTH, 40, NO_ABILITY, MALE
	    mon_move GUST, SUPERSONIC, PSYCHIC_M, TOXIC
	db -1 ; end

	next_list_item ; BUG_CATCHER (19)
	db "WAYNE@", TRAINERTYPE_NORMAL
	trainer_mon  LEDYBA, 8, NO_ABILITY, MALE
	trainer_mon  PARAS, 10, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

FisherGroup:
	next_list_item ; FISHER (1)
	db "JUSTIN@", TRAINERTYPE_NORMAL
	trainer_mon  MAGIKARP, 5, NO_ABILITY, MALE
	trainer_mon  MAGIKARP, 5, NO_ABILITY, MALE
	trainer_mon  MAGIKARP, 15, NO_ABILITY, MALE
	trainer_mon  MAGIKARP, 5, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (2)
	db "RALPH@", TRAINERTYPE_NORMAL
	trainer_mon  GOLDEEN, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (3)
	db "ARNOLD@", TRAINERTYPE_NORMAL
	trainer_mon  TENTACRUEL, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (4)
	db "KYLE@", TRAINERTYPE_NORMAL
	trainer_mon  SEAKING, 28, NO_ABILITY, MALE
	trainer_mon  POLIWHIRL, 31, NO_ABILITY, MALE
	trainer_mon  SEAKING, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (5)
	db "HENRY@", TRAINERTYPE_NORMAL
	trainer_mon  POLIWAG, 8, NO_ABILITY, MALE
	trainer_mon  POLIWAG, 8, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (6)
	db "MARVIN@", TRAINERTYPE_NORMAL
	trainer_mon  MAGIKARP, 10, NO_ABILITY, MALE
	trainer_mon  GYARADOS, 10, NO_ABILITY, MALE
	trainer_mon  MAGIKARP, 15, NO_ABILITY, MALE
	trainer_mon  GYARADOS, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (7)
	db "TULLY@", TRAINERTYPE_NORMAL
	trainer_mon  QWILFISH, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (8)
	db "ANDRE@", TRAINERTYPE_NORMAL
	trainer_mon  GYARADOS, 27, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (9)
	db "RAYMOND@", TRAINERTYPE_NORMAL
	trainer_mon  MAGIKARP, 22, NO_ABILITY, MALE
	trainer_mon  MAGIKARP, 22, NO_ABILITY, MALE
	trainer_mon  MAGIKARP, 22, NO_ABILITY, MALE
	trainer_mon  MAGIKARP, 22, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (10)
	db "WILTON@", TRAINERTYPE_NORMAL
	trainer_mon  GOLDEEN, 23, NO_ABILITY, MALE
	trainer_mon  GOLDEEN, 23, NO_ABILITY, MALE
	trainer_mon  SEAKING, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (11)
	db "EDGAR@", TRAINERTYPE_MOVES
	trainer_mon  REMORAID, 25, NO_ABILITY, MALE
	    mon_move LOCK_ON, PSYBEAM, AURORA_BEAM, BUBBLEBEAM
	trainer_mon  REMORAID, 25, NO_ABILITY, MALE
	    mon_move LOCK_ON, PSYBEAM, AURORA_BEAM, BUBBLEBEAM
	db -1 ; end

	next_list_item ; FISHER (12)
	db "JONAH@", TRAINERTYPE_NORMAL
	trainer_mon  SHELLDER, 25, NO_ABILITY, MALE
	trainer_mon  OCTILLERY, 29, NO_ABILITY, MALE
	trainer_mon  REMORAID, 25, NO_ABILITY, MALE
	trainer_mon  CLOYSTER, 29, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (13)
	db "MARTIN@", TRAINERTYPE_NORMAL
	trainer_mon  REMORAID, 32, NO_ABILITY, MALE
	trainer_mon  REMORAID, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (14)
	db "STEPHEN@", TRAINERTYPE_NORMAL
	trainer_mon  MAGIKARP, 25, NO_ABILITY, MALE
	trainer_mon  MAGIKARP, 25, NO_ABILITY, MALE
	trainer_mon  QWILFISH, 31, NO_ABILITY, MALE
	trainer_mon  TENTACRUEL, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (15)
	db "BARNEY@", TRAINERTYPE_NORMAL
	trainer_mon  GYARADOS, 30, NO_ABILITY, MALE
	trainer_mon  GYARADOS, 30, NO_ABILITY, MALE
	trainer_mon  GYARADOS, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (16)
	db "RALPH@", TRAINERTYPE_NORMAL
	trainer_mon  GOLDEEN, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (17)
	db "RALPH@", TRAINERTYPE_NORMAL
	trainer_mon  QWILFISH, 17, NO_ABILITY, MALE
	trainer_mon  GOLDEEN, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (18)
	db "TULLY@", TRAINERTYPE_NORMAL
	trainer_mon  QWILFISH, 23, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (19)
	db "TULLY@", TRAINERTYPE_NORMAL
	trainer_mon  GOLDEEN, 32, NO_ABILITY, MALE
	trainer_mon  GOLDEEN, 32, NO_ABILITY, MALE
	trainer_mon  QWILFISH, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (20)
	db "WILTON@", TRAINERTYPE_NORMAL
	trainer_mon  GOLDEEN, 29, NO_ABILITY, MALE
	trainer_mon  GOLDEEN, 29, NO_ABILITY, MALE
	trainer_mon  SEAKING, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (21)
	db "SCOTT@", TRAINERTYPE_NORMAL
	trainer_mon  QWILFISH, 30, NO_ABILITY, MALE
	trainer_mon  QWILFISH, 30, NO_ABILITY, MALE
	trainer_mon  SEAKING, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (22)
	db "WILTON@", TRAINERTYPE_MOVES
	trainer_mon  SEAKING, 34, NO_ABILITY, MALE
	    mon_move SUPERSONIC, WATERFALL, FLAIL, FURY_ATTACK
	trainer_mon  SEAKING, 34, NO_ABILITY, MALE
	    mon_move SUPERSONIC, WATERFALL, FLAIL, FURY_ATTACK
	trainer_mon  REMORAID, 38, NO_ABILITY, MALE
	    mon_move PSYBEAM, AURORA_BEAM, BUBBLEBEAM, HYPER_BEAM
	db -1 ; end

	next_list_item ; FISHER (23)
	db "RALPH@", TRAINERTYPE_NORMAL
	trainer_mon  QWILFISH, 30, NO_ABILITY, MALE
	trainer_mon  GOLDEEN, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FISHER (24)
	db "RALPH@", TRAINERTYPE_MOVES
	trainer_mon  QWILFISH, 35, NO_ABILITY, MALE
	    mon_move TOXIC, MINIMIZE, SURF, PIN_MISSILE
	trainer_mon  SEAKING, 39, NO_ABILITY, MALE
	    mon_move ENDURE, FLAIL, FURY_ATTACK, WATERFALL
	db -1 ; end

	next_list_item ; FISHER (25)
	db "TULLY@", TRAINERTYPE_MOVES
	trainer_mon  SEAKING, 34, NO_ABILITY, MALE
	    mon_move SUPERSONIC, RAIN_DANCE, WATERFALL, FURY_ATTACK
	trainer_mon  SEAKING, 34, NO_ABILITY, MALE
	    mon_move SUPERSONIC, RAIN_DANCE, WATERFALL, FURY_ATTACK
	trainer_mon  QWILFISH, 37, NO_ABILITY, MALE
	    mon_move ROLLOUT, SURF, PIN_MISSILE, TAKE_DOWN
	db -1 ; end

	end_list_items

SwimmerMGroup:
	next_list_item ; SWIMMERM (1)
	db "HAROLD@", TRAINERTYPE_NORMAL
	trainer_mon  REMORAID, 32, NO_ABILITY, MALE
	trainer_mon  SEADRA, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (2)
	db "SIMON@", TRAINERTYPE_NORMAL
	trainer_mon  TENTACOOL, 20, NO_ABILITY, MALE
	trainer_mon  TENTACOOL, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (3)
	db "RANDALL@", TRAINERTYPE_NORMAL
	trainer_mon  SHELLDER, 18, NO_ABILITY, MALE
	trainer_mon  WARTORTLE, 20, NO_ABILITY, MALE
	trainer_mon  SHELLDER, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (4)
	db "CHARLIE@", TRAINERTYPE_NORMAL
	trainer_mon  SHELLDER, 21, NO_ABILITY, MALE
	trainer_mon  TENTACOOL, 19, NO_ABILITY, MALE
	trainer_mon  TENTACRUEL, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (5)
	db "GEORGE@", TRAINERTYPE_NORMAL
	trainer_mon  TENTACOOL, 16, NO_ABILITY, MALE
	trainer_mon  TENTACOOL, 17, NO_ABILITY, MALE
	trainer_mon  TENTACOOL, 16, NO_ABILITY, MALE
	trainer_mon  STARYU, 19, NO_ABILITY, MALE
	trainer_mon  TENTACOOL, 17, NO_ABILITY, MALE
	trainer_mon  REMORAID, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (6)
	db "BERKE@", TRAINERTYPE_NORMAL
	trainer_mon  QWILFISH, 23, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (7)
	db "KIRK@", TRAINERTYPE_NORMAL
	trainer_mon  GYARADOS, 20, NO_ABILITY, MALE
	trainer_mon  GYARADOS, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (8)
	db "MATHEW@", TRAINERTYPE_NORMAL
	trainer_mon  KRABBY, 23, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (9)
	db "HAL@", TRAINERTYPE_NORMAL
	trainer_mon  SEEL, 24, NO_ABILITY, MALE
	trainer_mon  DEWGONG, 25, NO_ABILITY, MALE
	trainer_mon  SEEL, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (10)
	db "PATON@", TRAINERTYPE_NORMAL
	trainer_mon  PILOSWINE, 26, NO_ABILITY, MALE
	trainer_mon  PILOSWINE, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (11)
	db "DARYL@", TRAINERTYPE_NORMAL
	trainer_mon  SHELLDER, 24, NO_ABILITY, MALE
	trainer_mon  CLOYSTER, 25, NO_ABILITY, MALE
	trainer_mon  SHELLDER, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (12)
	db "WALTER@", TRAINERTYPE_NORMAL
	trainer_mon  HORSEA, 15, NO_ABILITY, MALE
	trainer_mon  HORSEA, 15, NO_ABILITY, MALE
	trainer_mon  SEADRA, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (13)
	db "TONY@", TRAINERTYPE_NORMAL
	trainer_mon  STARYU, 13, NO_ABILITY, MALE
	trainer_mon  STARMIE, 18, NO_ABILITY, MALE
	trainer_mon  HORSEA, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (14)
	db "JEROME@", TRAINERTYPE_NORMAL
	trainer_mon  SEADRA, 26, NO_ABILITY, MALE
	trainer_mon  TENTACOOL, 28, NO_ABILITY, MALE
	trainer_mon  TENTACRUEL, 30, NO_ABILITY, MALE
	trainer_mon  GOLDEEN, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (15)
	db "TUCKER@", TRAINERTYPE_NORMAL
	trainer_mon  SHELLDER, 30, NO_ABILITY, MALE
	trainer_mon  CLOYSTER, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (16)
	db "RICK@", TRAINERTYPE_NORMAL
	trainer_mon  STARYU, 13, NO_ABILITY, MALE
	trainer_mon  STARMIE, 18, NO_ABILITY, MALE
	trainer_mon  HORSEA, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (17)
	db "CAMERON@", TRAINERTYPE_NORMAL
	trainer_mon  MARILL, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (18)
	db "SETH@", TRAINERTYPE_NORMAL
	trainer_mon  QUAGSIRE, 29, NO_ABILITY, MALE
	trainer_mon  OCTILLERY, 29, NO_ABILITY, MALE
	trainer_mon  QUAGSIRE, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (19)
	db "JAMES@", TRAINERTYPE_NORMAL
	trainer_mon  STARYU, 13, NO_ABILITY, MALE
	trainer_mon  STARMIE, 18, NO_ABILITY, MALE
	trainer_mon  HORSEA, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (20)
	db "LEWIS@", TRAINERTYPE_NORMAL
	trainer_mon  STARYU, 13, NO_ABILITY, MALE
	trainer_mon  STARMIE, 18, NO_ABILITY, MALE
	trainer_mon  HORSEA, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERM (21)
	db "PARKER@", TRAINERTYPE_NORMAL
	trainer_mon  HORSEA, 32, NO_ABILITY, MALE
	trainer_mon  HORSEA, 32, NO_ABILITY, MALE
	trainer_mon  SEADRA, 35, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

SwimmerFGroup:
	next_list_item ; SWIMMERF (1)
	db "ELAINE@", TRAINERTYPE_NORMAL
	trainer_mon  STARYU, 21, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (2)
	db "PAULA@", TRAINERTYPE_NORMAL
	trainer_mon  STARYU, 19, NO_ABILITY, MALE
	trainer_mon  SHELLDER, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (3)
	db "KAYLEE@", TRAINERTYPE_NORMAL
	trainer_mon  GOLDEEN, 18, NO_ABILITY, MALE
	trainer_mon  GOLDEEN, 20, NO_ABILITY, MALE
	trainer_mon  SEAKING, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (4)
	db "SUSIE@", TRAINERTYPE_MOVES
	trainer_mon  PSYDUCK, 20, NO_ABILITY, MALE
	    mon_move SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	trainer_mon  GOLDEEN, 22, NO_ABILITY, MALE
	    mon_move PECK, TAIL_WHIP, SUPERSONIC, HORN_ATTACK
	db -1 ; end

	next_list_item ; SWIMMERF (5)
	db "DENISE@", TRAINERTYPE_NORMAL
	trainer_mon  SEEL, 22, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (6)
	db "KARA@", TRAINERTYPE_NORMAL
	trainer_mon  STARYU, 20, NO_ABILITY, MALE
	trainer_mon  STARMIE, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (7)
	db "WENDY@", TRAINERTYPE_MOVES
	trainer_mon  HORSEA, 21, NO_ABILITY, MALE
	    mon_move BUBBLE, SMOKESCREEN, LEER, WATER_GUN
	trainer_mon  HORSEA, 21, NO_ABILITY, MALE
	    mon_move DRAGON_RAGE, SMOKESCREEN, LEER, WATER_GUN
	db -1 ; end

	next_list_item ; SWIMMERF (8)
	db "LISA@", TRAINERTYPE_NORMAL
	trainer_mon  JYNX, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (9)
	db "JILL@", TRAINERTYPE_NORMAL
	trainer_mon  DEWGONG, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (10)
	db "MARY@", TRAINERTYPE_NORMAL
	trainer_mon  SEAKING, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (11)
	db "KATIE@", TRAINERTYPE_NORMAL
	trainer_mon  DEWGONG, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (12)
	db "DAWN@", TRAINERTYPE_NORMAL
	trainer_mon  SEAKING, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (13)
	db "TARA@", TRAINERTYPE_NORMAL
	trainer_mon  SEAKING, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (14)
	db "NICOLE@", TRAINERTYPE_NORMAL
	trainer_mon  MARILL, 29, NO_ABILITY, MALE
	trainer_mon  MARILL, 29, NO_ABILITY, MALE
	trainer_mon  LAPRAS, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (15)
	db "LORI@", TRAINERTYPE_NORMAL
	trainer_mon  STARMIE, 32, NO_ABILITY, MALE
	trainer_mon  STARMIE, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (16)
	db "JODY@", TRAINERTYPE_NORMAL
	trainer_mon  SEAKING, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (17)
	db "NIKKI@", TRAINERTYPE_NORMAL
	trainer_mon  SEEL, 28, NO_ABILITY, MALE
	trainer_mon  SEEL, 28, NO_ABILITY, MALE
	trainer_mon  SEEL, 28, NO_ABILITY, MALE
	trainer_mon  DEWGONG, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (18)
	db "DIANA@", TRAINERTYPE_NORMAL
	trainer_mon  GOLDUCK, 37, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SWIMMERF (19)
	db "BRIANA@", TRAINERTYPE_NORMAL
	trainer_mon  SEAKING, 35, NO_ABILITY, MALE
	trainer_mon  SEAKING, 35, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

SailorGroup:
	next_list_item ; SAILOR (1)
	db "EUGENE@", TRAINERTYPE_NORMAL
	trainer_mon  POLIWHIRL, 17, NO_ABILITY, MALE
	trainer_mon  RATICATE, 17, NO_ABILITY, MALE
	trainer_mon  KRABBY, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (2)
	db "HUEY@", TRAINERTYPE_NORMAL
	trainer_mon  POLIWAG, 18, NO_ABILITY, MALE
	trainer_mon  POLIWHIRL, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (3)
	db "TERRELL@", TRAINERTYPE_NORMAL
	trainer_mon  POLIWHIRL, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (4)
	db "KENT@", TRAINERTYPE_MOVES
	trainer_mon  KRABBY, 18, NO_ABILITY, MALE
	    mon_move BUBBLE, LEER, VICEGRIP, HARDEN
	trainer_mon  KRABBY, 20, NO_ABILITY, MALE
	    mon_move BUBBLEBEAM, LEER, VICEGRIP, HARDEN
	db -1 ; end

	next_list_item ; SAILOR (5)
	db "ERNEST@", TRAINERTYPE_NORMAL
	trainer_mon  MACHOP, 18, NO_ABILITY, MALE
	trainer_mon  MACHOP, 18, NO_ABILITY, MALE
	trainer_mon  POLIWHIRL, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (6)
	db "JEFF@", TRAINERTYPE_NORMAL
	trainer_mon  RATICATE, 32, NO_ABILITY, MALE
	trainer_mon  RATICATE, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (7)
	db "GARRETT@", TRAINERTYPE_NORMAL
	trainer_mon  KINGLER, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (8)
	db "KENNETH@", TRAINERTYPE_NORMAL
	trainer_mon  MACHOP, 28, NO_ABILITY, MALE
	trainer_mon  MACHOP, 28, NO_ABILITY, MALE
	trainer_mon  POLIWRATH, 28, NO_ABILITY, MALE
	trainer_mon  MACHOP, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (9)
	db "STANLY@", TRAINERTYPE_NORMAL
	trainer_mon  MACHOP, 31, NO_ABILITY, MALE
	trainer_mon  MACHOKE, 33, NO_ABILITY, MALE
	trainer_mon  PSYDUCK, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (10)
	db "HARRY@", TRAINERTYPE_NORMAL
	trainer_mon  WOOPER, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (11)
	db "HUEY@", TRAINERTYPE_NORMAL
	trainer_mon  POLIWHIRL, 28, NO_ABILITY, MALE
	trainer_mon  POLIWHIRL, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (12)
	db "HUEY@", TRAINERTYPE_NORMAL
	trainer_mon  POLIWHIRL, 34, NO_ABILITY, MALE
	trainer_mon  POLIWRATH, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAILOR (13)
	db "HUEY@", TRAINERTYPE_MOVES
	trainer_mon  POLITOED, 38, NO_ABILITY, MALE
	    mon_move WHIRLPOOL, RAIN_DANCE, BODY_SLAM, PERISH_SONG
	trainer_mon  POLIWRATH, 38, NO_ABILITY, MALE
	    mon_move SURF, STRENGTH, ICE_PUNCH, SUBMISSION
	db -1 ; end

	end_list_items

SuperNerdGroup:
	next_list_item ; SUPER_NERD (1)
	db "STAN@", TRAINERTYPE_NORMAL
	trainer_mon  GRIMER, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (2)
	db "ERIC@", TRAINERTYPE_NORMAL
	trainer_mon  GRIMER, 11, NO_ABILITY, MALE
	trainer_mon  GRIMER, 11, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (3)
	db "GREGG@", TRAINERTYPE_NORMAL
	trainer_mon  MAGNEMITE, 20, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 20, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (4)
	db "JAY@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 22, NO_ABILITY, MALE
	trainer_mon  KOFFING, 22, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (5)
	db "DAVE@", TRAINERTYPE_NORMAL
	trainer_mon  DITTO, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (6)
	db "SAM@", TRAINERTYPE_NORMAL
	trainer_mon  GRIMER, 34, NO_ABILITY, MALE
	trainer_mon  MUK, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (7)
	db "TOM@", TRAINERTYPE_NORMAL
	trainer_mon  MAGNEMITE, 32, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 32, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (8)
	db "PAT@", TRAINERTYPE_NORMAL
	trainer_mon  PORYGON, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (9)
	db "SHAWN@", TRAINERTYPE_NORMAL
	trainer_mon  MAGNEMITE, 31, NO_ABILITY, MALE
	trainer_mon  MUK, 33, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (10)
	db "TERU@", TRAINERTYPE_NORMAL
	trainer_mon  MAGNEMITE, 7, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 11, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 7, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 9, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (11)
	db "RUSS@", TRAINERTYPE_NORMAL
	trainer_mon  MAGNEMITE, 27, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 27, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 27, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SUPER_NERD (12)
	db "NORTON@", TRAINERTYPE_MOVES
	trainer_mon  PORYGON, 30, NO_ABILITY, MALE
	    mon_move CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db -1 ; end

	next_list_item ; SUPER_NERD (13)
	db "HUGH@", TRAINERTYPE_MOVES
	trainer_mon  SEADRA, 39, NO_ABILITY, MALE
	    mon_move SMOKESCREEN, TWISTER, SURF, WATERFALL
	db -1 ; end

	next_list_item ; SUPER_NERD (14)
	db "MARKUS@", TRAINERTYPE_MOVES
	trainer_mon  SLOWPOKE, 19, NO_ABILITY, MALE
	    mon_move CURSE, WATER_GUN, GROWL, STRENGTH
	db -1 ; end

	end_list_items

Rival2Group:
	next_list_item ; RIVAL2 (1)
	db "?@", TRAINERTYPE_MOVES
	trainer_mon  SNEASEL, 41, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	trainer_mon  GOLBAT, 42, NO_ABILITY, MALE
	    mon_move LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	trainer_mon  MAGNETON, 41, NO_ABILITY, MALE
	    mon_move THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	trainer_mon  GENGAR, 43, NO_ABILITY, MALE
	    mon_move MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	trainer_mon  ALAKAZAM, 43, NO_ABILITY, MALE
	    mon_move DISABLE, RECOVER, FUTURE_SIGHT, PSYCHIC_M
	trainer_mon  MEGANIUM, 45, NO_ABILITY, MALE
	    mon_move RAZOR_LEAF, POISONPOWDER, BODY_SLAM, LIGHT_SCREEN
	db -1 ; end

	next_list_item ; RIVAL2 (2)
	db "?@", TRAINERTYPE_MOVES
	trainer_mon  SNEASEL, 41, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	trainer_mon  GOLBAT, 42, NO_ABILITY, MALE
	    mon_move LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	trainer_mon  MAGNETON, 41, NO_ABILITY, MALE
	    mon_move THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	trainer_mon  GENGAR, 43, NO_ABILITY, MALE
	    mon_move MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	trainer_mon  ALAKAZAM, 43, NO_ABILITY, MALE
	    mon_move DISABLE, RECOVER, FUTURE_SIGHT, PSYCHIC_M
	trainer_mon  TYPHLOSION, 45, NO_ABILITY, MALE
	    mon_move SMOKESCREEN, QUICK_ATTACK, FLAME_WHEEL, SWIFT
	db -1 ; end

	next_list_item ; RIVAL2 (3)
	db "?@", TRAINERTYPE_MOVES
	trainer_mon  SNEASEL, 41, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	trainer_mon  GOLBAT, 42, NO_ABILITY, MALE
	    mon_move LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	trainer_mon  MAGNETON, 41, NO_ABILITY, MALE
	    mon_move THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	trainer_mon  GENGAR, 43, NO_ABILITY, MALE
	    mon_move MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	trainer_mon  ALAKAZAM, 43, NO_ABILITY, MALE
	    mon_move DISABLE, RECOVER, FUTURE_SIGHT, PSYCHIC_M
	trainer_mon  FERALIGATR, 45, NO_ABILITY, MALE
	    mon_move RAGE, WATER_GUN, SCARY_FACE, SLASH
	db -1 ; end

	next_list_item ; RIVAL2 (4)
	db "?@", TRAINERTYPE_MOVES
	trainer_mon  SNEASEL, 45, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	trainer_mon  CROBAT, 48, NO_ABILITY, MALE
	    mon_move TOXIC, BITE, CONFUSE_RAY, WING_ATTACK
	trainer_mon  MAGNETON, 45, NO_ABILITY, MALE
	    mon_move THUNDER, SONICBOOM, THUNDER_WAVE, SWIFT
	trainer_mon  GENGAR, 46, NO_ABILITY, MALE
	    mon_move MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	trainer_mon  ALAKAZAM, 46, NO_ABILITY, MALE
	    mon_move RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	trainer_mon  MEGANIUM, 50, NO_ABILITY, MALE
	    mon_move GIGA_DRAIN, BODY_SLAM, LIGHT_SCREEN, SAFEGUARD
	db -1 ; end

	next_list_item ; RIVAL2 (5)
	db "?@", TRAINERTYPE_MOVES
	trainer_mon  SNEASEL, 45, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	trainer_mon  CROBAT, 48, NO_ABILITY, MALE
	    mon_move TOXIC, BITE, CONFUSE_RAY, WING_ATTACK
	trainer_mon  MAGNETON, 45, NO_ABILITY, MALE
	    mon_move THUNDER, SONICBOOM, THUNDER_WAVE, SWIFT
	trainer_mon  GENGAR, 46, NO_ABILITY, MALE
	    mon_move MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	trainer_mon  ALAKAZAM, 46, NO_ABILITY, MALE
	    mon_move RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	trainer_mon  TYPHLOSION, 50, NO_ABILITY, MALE
	    mon_move SMOKESCREEN, QUICK_ATTACK, FIRE_BLAST, SWIFT
	db -1 ; end

	next_list_item ; RIVAL2 (6)
	db "?@", TRAINERTYPE_MOVES
	trainer_mon  SNEASEL, 45, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	trainer_mon  CROBAT, 48, NO_ABILITY, MALE
	    mon_move TOXIC, BITE, CONFUSE_RAY, WING_ATTACK
	trainer_mon  MAGNETON, 45, NO_ABILITY, MALE
	    mon_move THUNDER, SONICBOOM, THUNDER_WAVE, SWIFT
	trainer_mon  GENGAR, 46, NO_ABILITY, MALE
	    mon_move MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	trainer_mon  ALAKAZAM, 46, NO_ABILITY, MALE
	    mon_move RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	trainer_mon  FERALIGATR, 50, NO_ABILITY, MALE
	    mon_move SURF, RAIN_DANCE, SLASH, SCREECH
	db -1 ; end

	end_list_items

GuitaristGroup:
	next_list_item ; GUITARIST (1)
	db "CLYDE@", TRAINERTYPE_NORMAL
	trainer_mon  ELECTABUZZ, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GUITARIST (2)
	db "VINCENT@", TRAINERTYPE_NORMAL
	trainer_mon  MAGNEMITE, 27, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 33, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 32, NO_ABILITY, MALE
	trainer_mon  MAGNEMITE, 32, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

HikerGroup:
	next_list_item ; HIKER (1)
	db "ANTHONY@", TRAINERTYPE_NORMAL
	trainer_mon  GEODUDE, 16, NO_ABILITY, MALE
	trainer_mon  MACHAMP, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (2)
	db "RUSSELL@", TRAINERTYPE_NORMAL
	trainer_mon  GEODUDE, 4, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 6, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 8, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (3)
	db "PHILLIP@", TRAINERTYPE_NORMAL
	trainer_mon  GEODUDE, 23, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 23, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 23, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (4)
	db "LEONARD@", TRAINERTYPE_NORMAL
	trainer_mon  GEODUDE, 23, NO_ABILITY, MALE
	trainer_mon  MACHOP, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (5)
	db "ANTHONY@", TRAINERTYPE_NORMAL
	trainer_mon  GEODUDE, 11, NO_ABILITY, MALE
	trainer_mon  MACHOP, 11, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (6)
	db "BENJAMIN@", TRAINERTYPE_NORMAL
	trainer_mon  DIGLETT, 14, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 14, NO_ABILITY, MALE
	trainer_mon  DUGTRIO, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (7)
	db "ERIK@", TRAINERTYPE_NORMAL
	trainer_mon  MACHOP, 24, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 27, NO_ABILITY, MALE
	trainer_mon  MACHOP, 27, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (8)
	db "MICHAEL@", TRAINERTYPE_NORMAL
	trainer_mon  GEODUDE, 25, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 25, NO_ABILITY, MALE
	trainer_mon  GOLEM, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (9)
	db "PARRY@", TRAINERTYPE_NORMAL
	trainer_mon  ONIX, 35, NO_ABILITY, MALE
	trainer_mon  SWINUB, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (10)
	db "TIMOTHY@", TRAINERTYPE_MOVES
	trainer_mon  DIGLETT, 27, NO_ABILITY, MALE
	    mon_move MAGNITUDE, DIG, SAND_ATTACK, SLASH
	trainer_mon  DUGTRIO, 27, NO_ABILITY, MALE
	    mon_move MAGNITUDE, DIG, SAND_ATTACK, SLASH
	db -1 ; end

	next_list_item ; HIKER (11)
	db "BAILEY@", TRAINERTYPE_NORMAL
	trainer_mon  GEODUDE, 13, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 13, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 13, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 13, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 13, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (12)
	db "ANTHONY@", TRAINERTYPE_NORMAL
	trainer_mon  GRAVELER, 25, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 27, NO_ABILITY, MALE
	trainer_mon  MACHOKE, 29, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (13)
	db "TIM@", TRAINERTYPE_NORMAL
	trainer_mon  GRAVELER, 31, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 31, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (14)
	db "NOLAND@", TRAINERTYPE_NORMAL
	trainer_mon  SANDSLASH, 31, NO_ABILITY, MALE
	trainer_mon  GOLEM, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (15)
	db "SIDNEY@", TRAINERTYPE_NORMAL
	trainer_mon  DUGTRIO, 34, NO_ABILITY, MALE
	trainer_mon  ONIX, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (16)
	db "KENNY@", TRAINERTYPE_NORMAL
	trainer_mon  SANDSLASH, 27, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 29, NO_ABILITY, MALE
	trainer_mon  GOLEM, 31, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 29, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (17)
	db "JIM@", TRAINERTYPE_NORMAL
	trainer_mon  MACHAMP, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (18)
	db "DANIEL@", TRAINERTYPE_NORMAL
	trainer_mon  ONIX, 11, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (19)
	db "PARRY@", TRAINERTYPE_MOVES
	trainer_mon  PILOSWINE, 35, NO_ABILITY, MALE
	    mon_move EARTHQUAKE, BLIZZARD, REST, TAKE_DOWN
	trainer_mon  DUGTRIO, 35, NO_ABILITY, MALE
	    mon_move MAGNITUDE, DIG, MUD_SLAP, SLASH
	trainer_mon  STEELIX, 38, NO_ABILITY, MALE
	    mon_move DIG, IRON_TAIL, SANDSTORM, SLAM
	db -1 ; end

	next_list_item ; HIKER (20)
	db "PARRY@", TRAINERTYPE_NORMAL
	trainer_mon  ONIX, 29, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (21)
	db "ANTHONY@", TRAINERTYPE_NORMAL
	trainer_mon  GRAVELER, 30, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 30, NO_ABILITY, MALE
	trainer_mon  MACHOKE, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; HIKER (22)
	db "ANTHONY@", TRAINERTYPE_MOVES
	trainer_mon  GRAVELER, 34, NO_ABILITY, MALE
	    mon_move MAGNITUDE, SELFDESTRUCT, DEFENSE_CURL, ROLLOUT
	trainer_mon  GOLEM, 36, NO_ABILITY, MALE
	    mon_move MAGNITUDE, SELFDESTRUCT, DEFENSE_CURL, ROLLOUT
	trainer_mon  MACHOKE, 34, NO_ABILITY, MALE
	    mon_move KARATE_CHOP, VITAL_THROW, HEADBUTT, DIG
	db -1 ; end

	end_list_items

BikerGroup:
	next_list_item ; BIKER (1)
	db "BENNY@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 20, NO_ABILITY, MALE
	trainer_mon  KOFFING, 20, NO_ABILITY, MALE
	trainer_mon  KOFFING, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIKER (2)
	db "KAZU@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 20, NO_ABILITY, MALE
	trainer_mon  KOFFING, 20, NO_ABILITY, MALE
	trainer_mon  KOFFING, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIKER (3)
	db "DWAYNE@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 27, NO_ABILITY, MALE
	trainer_mon  KOFFING, 28, NO_ABILITY, MALE
	trainer_mon  KOFFING, 29, NO_ABILITY, MALE
	trainer_mon  KOFFING, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIKER (4)
	db "HARRIS@", TRAINERTYPE_NORMAL
	trainer_mon  FLAREON, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIKER (5)
	db "ZEKE@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 32, NO_ABILITY, MALE
	trainer_mon  KOFFING, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIKER (6)
	db "CHARLES@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 30, NO_ABILITY, MALE
	trainer_mon  CHARMELEON, 30, NO_ABILITY, MALE
	trainer_mon  WEEZING, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIKER (7)
	db "RILEY@", TRAINERTYPE_NORMAL
	trainer_mon  WEEZING, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIKER (8)
	db "JOEL@", TRAINERTYPE_NORMAL
	trainer_mon  MAGMAR, 32, NO_ABILITY, MALE
	trainer_mon  MAGMAR, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BIKER (9)
	db "GLENN@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 28, NO_ABILITY, MALE
	trainer_mon  MAGMAR, 30, NO_ABILITY, MALE
	trainer_mon  WEEZING, 32, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

BlaineGroup:
	next_list_item ; BLAINE (1)
	db "BLAINE@", TRAINERTYPE_MOVES
	trainer_mon  MAGCARGO, 45, NO_ABILITY, MALE
	    mon_move CURSE, SMOG, FLAMETHROWER, ROCK_SLIDE
	trainer_mon  MAGMAR, 45, NO_ABILITY, MALE
	    mon_move THUNDERPUNCH, FIRE_PUNCH, SUNNY_DAY, CONFUSE_RAY
	trainer_mon  RAPIDASH, 50, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, FIRE_SPIN, FURY_ATTACK, FIRE_BLAST
	db -1 ; end

	end_list_items

BurglarGroup:
	next_list_item ; BURGLAR (1)
	db "DUNCAN@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 23, NO_ABILITY, MALE
	trainer_mon  MAGMAR, 25, NO_ABILITY, MALE
	trainer_mon  KOFFING, 23, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BURGLAR (2)
	db "EDDIE@", TRAINERTYPE_MOVES
	trainer_mon  GROWLITHE, 26, NO_ABILITY, MALE
	    mon_move ROAR, EMBER, LEER, TAKE_DOWN
	trainer_mon  KOFFING, 24, NO_ABILITY, MALE
	    mon_move TACKLE, SMOG, SLUDGE, SMOKESCREEN
	db -1 ; end

	next_list_item ; BURGLAR (3)
	db "COREY@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 25, NO_ABILITY, MALE
	trainer_mon  MAGMAR, 28, NO_ABILITY, MALE
	trainer_mon  KOFFING, 25, NO_ABILITY, MALE
	trainer_mon  KOFFING, 30, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

FirebreatherGroup:
	next_list_item ; FIREBREATHER (1)
	db "OTIS@", TRAINERTYPE_NORMAL
	trainer_mon  MAGMAR, 29, NO_ABILITY, MALE
	trainer_mon  WEEZING, 32, NO_ABILITY, MALE
	trainer_mon  MAGMAR, 29, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FIREBREATHER (2)
	db "DICK@", TRAINERTYPE_NORMAL
	trainer_mon  CHARMELEON, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FIREBREATHER (3)
	db "NED@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 15, NO_ABILITY, MALE
	trainer_mon  GROWLITHE, 16, NO_ABILITY, MALE
	trainer_mon  KOFFING, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FIREBREATHER (4)
	db "BURT@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 32, NO_ABILITY, MALE
	trainer_mon  SLUGMA, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FIREBREATHER (5)
	db "BILL@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 6, NO_ABILITY, MALE
	trainer_mon  KOFFING, 6, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FIREBREATHER (6)
	db "WALT@", TRAINERTYPE_NORMAL
	trainer_mon  MAGMAR, 11, NO_ABILITY, MALE
	trainer_mon  MAGMAR, 13, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FIREBREATHER (7)
	db "RAY@", TRAINERTYPE_NORMAL
	trainer_mon  VULPIX, 9, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; FIREBREATHER (8)
	db "LYLE@", TRAINERTYPE_NORMAL
	trainer_mon  KOFFING, 28, NO_ABILITY, MALE
	trainer_mon  FLAREON, 31, NO_ABILITY, MALE
	trainer_mon  KOFFING, 28, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

JugglerGroup:
	next_list_item ; JUGGLER (1)
	db "IRWIN@", TRAINERTYPE_NORMAL
	trainer_mon  VOLTORB, 2, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 6, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 10, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 14, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; JUGGLER (2)
	db "FRITZ@", TRAINERTYPE_NORMAL
	trainer_mon  MR__MIME, 29, NO_ABILITY, MALE
	trainer_mon  MAGMAR, 29, NO_ABILITY, MALE
	trainer_mon  MACHOKE, 29, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; JUGGLER (3)
	db "HORTON@", TRAINERTYPE_NORMAL
	trainer_mon  ELECTRODE, 33, NO_ABILITY, MALE
	trainer_mon  ELECTRODE, 33, NO_ABILITY, MALE
	trainer_mon  ELECTRODE, 33, NO_ABILITY, MALE
	trainer_mon  ELECTRODE, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; JUGGLER (4)
	db "IRWIN@", TRAINERTYPE_NORMAL
	trainer_mon  VOLTORB, 6, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 10, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 14, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; JUGGLER (5)
	db "IRWIN@", TRAINERTYPE_NORMAL
	trainer_mon  VOLTORB, 18, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 22, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 26, NO_ABILITY, MALE
	trainer_mon  ELECTRODE, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; JUGGLER (6)
	db "IRWIN@", TRAINERTYPE_NORMAL
	trainer_mon  VOLTORB, 18, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 22, NO_ABILITY, MALE
	trainer_mon  VOLTORB, 26, NO_ABILITY, MALE
	trainer_mon  ELECTRODE, 30, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

BlackbeltGroup:
	next_list_item ; BLACKBELT_T (1)
	db "KENJI@", TRAINERTYPE_NORMAL
	trainer_mon  ONIX, 27, NO_ABILITY, MALE
	trainer_mon  HITMONLEE, 30, NO_ABILITY, MALE
	trainer_mon  ONIX, 27, NO_ABILITY, MALE
	trainer_mon  MACHOKE, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BLACKBELT_T (2)
	db "YOSHI@", TRAINERTYPE_MOVES
	trainer_mon  HITMONLEE, 27, NO_ABILITY, MALE
	    mon_move DOUBLE_KICK, MEDITATE, JUMP_KICK, FOCUS_ENERGY
	db -1 ; end

	next_list_item ; BLACKBELT_T (3)
	db "KENJI@", TRAINERTYPE_MOVES
	trainer_mon  ONIX, 33, NO_ABILITY, MALE
	    mon_move BIND, ROCK_THROW, TOXIC, DIG
	trainer_mon  MACHAMP, 38, NO_ABILITY, MALE
	    mon_move HEADBUTT, SWAGGER, THUNDERPUNCH, VITAL_THROW
	trainer_mon  STEELIX, 33, NO_ABILITY, MALE
	    mon_move EARTHQUAKE, ROCK_THROW, IRON_TAIL, SANDSTORM
	trainer_mon  HITMONLEE, 36, NO_ABILITY, MALE
	    mon_move DOUBLE_TEAM, HI_JUMP_KICK, MUD_SLAP, SWIFT
	db -1 ; end

	next_list_item ; BLACKBELT_T (4)
	db "LAO@", TRAINERTYPE_MOVES
	trainer_mon  HITMONCHAN, 27, NO_ABILITY, MALE
	    mon_move COMET_PUNCH, THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH
	db -1 ; end

	next_list_item ; BLACKBELT_T (5)
	db "NOB@", TRAINERTYPE_MOVES
	trainer_mon  MACHOP, 25, NO_ABILITY, MALE
	    mon_move LEER, FOCUS_ENERGY, KARATE_CHOP, SEISMIC_TOSS
	trainer_mon  MACHOKE, 25, NO_ABILITY, MALE
	    mon_move LEER, KARATE_CHOP, SEISMIC_TOSS, ROCK_SLIDE
	db -1 ; end

	next_list_item ; BLACKBELT_T (6)
	db "KIYO@", TRAINERTYPE_NORMAL
	trainer_mon  HITMONLEE, 34, NO_ABILITY, MALE
	trainer_mon  HITMONCHAN, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BLACKBELT_T (7)
	db "LUNG@", TRAINERTYPE_NORMAL
	trainer_mon  MANKEY, 23, NO_ABILITY, MALE
	trainer_mon  MANKEY, 23, NO_ABILITY, MALE
	trainer_mon  PRIMEAPE, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BLACKBELT_T (8)
	db "KENJI@", TRAINERTYPE_NORMAL
	trainer_mon  MACHOKE, 28, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BLACKBELT_T (9)
	db "WAI@", TRAINERTYPE_NORMAL
	trainer_mon  MACHOKE, 30, NO_ABILITY, MALE
	trainer_mon  MACHOKE, 32, NO_ABILITY, MALE
	trainer_mon  MACHOKE, 34, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

ExecutiveMGroup:
	next_list_item ; EXECUTIVEM (1)
	db "EXECUTIVE@", TRAINERTYPE_MOVES
	trainer_mon  HOUNDOUR, 33, NO_ABILITY, MALE
	    mon_move EMBER, ROAR, BITE, FAINT_ATTACK
	trainer_mon  KOFFING, 33, NO_ABILITY, MALE
	    mon_move TACKLE, SLUDGE, SMOKESCREEN, HAZE
	trainer_mon  HOUNDOOM, 35, NO_ABILITY, MALE
	    mon_move EMBER, SMOG, BITE, FAINT_ATTACK
	db -1 ; end

	next_list_item ; EXECUTIVEM (2)
	db "EXECUTIVE@", TRAINERTYPE_MOVES
	trainer_mon  GOLBAT, 36, NO_ABILITY, MALE
	    mon_move LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db -1 ; end

	next_list_item ; EXECUTIVEM (3)
	db "EXECUTIVE@", TRAINERTYPE_MOVES
	trainer_mon  KOFFING, 30, NO_ABILITY, MALE
	    mon_move TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	trainer_mon  KOFFING, 30, NO_ABILITY, MALE
	    mon_move TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	trainer_mon  KOFFING, 30, NO_ABILITY, MALE
	    mon_move TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	trainer_mon  WEEZING, 32, NO_ABILITY, MALE
	    mon_move TACKLE, EXPLOSION, SLUDGE, SMOKESCREEN
	trainer_mon  KOFFING, 30, NO_ABILITY, MALE
	    mon_move TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	trainer_mon  KOFFING, 30, NO_ABILITY, MALE
	    mon_move TACKLE, SMOG, SLUDGE, SMOKESCREEN
	db -1 ; end

	next_list_item ; EXECUTIVEM (4)
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	trainer_mon  ZUBAT, 22, NO_ABILITY, MALE
	trainer_mon  RATICATE, 24, NO_ABILITY, MALE
	trainer_mon  KOFFING, 22, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

PsychicGroup:
	next_list_item ; PSYCHIC_T (1)
	db "NATHAN@", TRAINERTYPE_NORMAL
	trainer_mon  GIRAFARIG, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PSYCHIC_T (2)
	db "FRANKLIN@", TRAINERTYPE_NORMAL
	trainer_mon  KADABRA, 37, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PSYCHIC_T (3)
	db "HERMAN@", TRAINERTYPE_NORMAL
	trainer_mon  EXEGGCUTE, 30, NO_ABILITY, MALE
	trainer_mon  EXEGGCUTE, 30, NO_ABILITY, MALE
	trainer_mon  EXEGGUTOR, 30, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PSYCHIC_T (4)
	db "FIDEL@", TRAINERTYPE_NORMAL
	trainer_mon  XATU, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PSYCHIC_T (5)
	db "GREG@", TRAINERTYPE_MOVES
	trainer_mon  DROWZEE, 17, NO_ABILITY, MALE
	    mon_move HYPNOSIS, DISABLE, DREAM_EATER, NO_MOVE
	db -1 ; end

	next_list_item ; PSYCHIC_T (6)
	db "NORMAN@", TRAINERTYPE_MOVES
	trainer_mon  SLOWPOKE, 17, NO_ABILITY, MALE
	    mon_move TACKLE, GROWL, WATER_GUN, NO_MOVE
	trainer_mon  SLOWPOKE, 20, NO_ABILITY, MALE
	    mon_move CURSE, BODY_SLAM, WATER_GUN, CONFUSION
	db -1 ; end

	next_list_item ; PSYCHIC_T (7)
	db "MARK@", TRAINERTYPE_MOVES
	trainer_mon  ABRA, 13, NO_ABILITY, MALE
	    mon_move TELEPORT, FLASH, NO_MOVE, NO_MOVE
	trainer_mon  ABRA, 13, NO_ABILITY, MALE
	    mon_move TELEPORT, FLASH, NO_MOVE, NO_MOVE
	trainer_mon  KADABRA, 15, NO_ABILITY, MALE
	    mon_move TELEPORT, KINESIS, CONFUSION, NO_MOVE
	db -1 ; end

	next_list_item ; PSYCHIC_T (8)
	db "PHIL@", TRAINERTYPE_MOVES
	trainer_mon  NATU, 24, NO_ABILITY, MALE
	    mon_move LEER, NIGHT_SHADE, FUTURE_SIGHT, CONFUSE_RAY
	trainer_mon  KADABRA, 26, NO_ABILITY, MALE
	    mon_move DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db -1 ; end

	next_list_item ; PSYCHIC_T (9)
	db "RICHARD@", TRAINERTYPE_NORMAL
	trainer_mon  ESPEON, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PSYCHIC_T (10)
	db "GILBERT@", TRAINERTYPE_NORMAL
	trainer_mon  STARMIE, 30, NO_ABILITY, MALE
	trainer_mon  EXEGGCUTE, 30, NO_ABILITY, MALE
	trainer_mon  GIRAFARIG, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PSYCHIC_T (11)
	db "JARED@", TRAINERTYPE_NORMAL
	trainer_mon  MR__MIME, 32, NO_ABILITY, MALE
	trainer_mon  EXEGGCUTE, 32, NO_ABILITY, MALE
	trainer_mon  EXEGGCUTE, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PSYCHIC_T (12)
	db "RODNEY@", TRAINERTYPE_NORMAL
	trainer_mon  DROWZEE, 29, NO_ABILITY, MALE
	trainer_mon  HYPNO, 33, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

PicnickerGroup:
	next_list_item ; PICNICKER (1)
	db "LIZ@", TRAINERTYPE_NORMAL
	trainer_mon  NIDORAN_F, 9, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (2)
	db "GINA@", TRAINERTYPE_NORMAL
	trainer_mon  HOPPIP, 9, NO_ABILITY, MALE
	trainer_mon  HOPPIP, 9, NO_ABILITY, MALE
	trainer_mon  BULBASAUR, 12, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (3)
	db "BROOKE@", TRAINERTYPE_MOVES
	trainer_mon  PIKACHU, 16, NO_ABILITY, MALE
	    mon_move THUNDERSHOCK, GROWL, QUICK_ATTACK, DOUBLE_TEAM
	db -1 ; end

	next_list_item ; PICNICKER (4)
	db "KIM@", TRAINERTYPE_NORMAL
	trainer_mon  VULPIX, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (5)
	db "CINDY@", TRAINERTYPE_NORMAL
	trainer_mon  NIDOQUEEN, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (6)
	db "HOPE@", TRAINERTYPE_NORMAL
	trainer_mon  FLAAFFY, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (7)
	db "SHARON@", TRAINERTYPE_NORMAL
	trainer_mon  FURRET, 31, NO_ABILITY, MALE
	trainer_mon  RAPIDASH, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (8)
	db "DEBRA@", TRAINERTYPE_NORMAL
	trainer_mon  SEAKING, 33, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (9)
	db "GINA@", TRAINERTYPE_NORMAL
	trainer_mon  HOPPIP, 14, NO_ABILITY, MALE
	trainer_mon  HOPPIP, 14, NO_ABILITY, MALE
	trainer_mon  IVYSAUR, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (10)
	db "ERIN@", TRAINERTYPE_NORMAL
	trainer_mon  PONYTA, 16, NO_ABILITY, MALE
	trainer_mon  PONYTA, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (11)
	db "LIZ@", TRAINERTYPE_NORMAL
	trainer_mon  WEEPINBELL, 15, NO_ABILITY, MALE
	trainer_mon  NIDORINA, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (12)
	db "LIZ@", TRAINERTYPE_NORMAL
	trainer_mon  WEEPINBELL, 19, NO_ABILITY, MALE
	trainer_mon  NIDORINO, 19, NO_ABILITY, MALE
	trainer_mon  NIDOQUEEN, 21, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (13)
	db "HEIDI@", TRAINERTYPE_NORMAL
	trainer_mon  SKIPLOOM, 32, NO_ABILITY, MALE
	trainer_mon  SKIPLOOM, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (14)
	db "EDNA@", TRAINERTYPE_NORMAL
	trainer_mon  NIDORINA, 30, NO_ABILITY, MALE
	trainer_mon  RAICHU, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (15)
	db "GINA@", TRAINERTYPE_NORMAL
	trainer_mon  SKIPLOOM, 26, NO_ABILITY, MALE
	trainer_mon  SKIPLOOM, 26, NO_ABILITY, MALE
	trainer_mon  IVYSAUR, 29, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (16)
	db "TIFFANY@", TRAINERTYPE_MOVES
	trainer_mon  CLEFAIRY, 31, NO_ABILITY, MALE
	    mon_move ENCORE, SING, DOUBLESLAP, MINIMIZE
	db -1 ; end

	next_list_item ; PICNICKER (17)
	db "TIFFANY@", TRAINERTYPE_MOVES
	trainer_mon  CLEFAIRY, 37, NO_ABILITY, MALE
	    mon_move ENCORE, DOUBLESLAP, MINIMIZE, METRONOME
	db -1 ; end

	next_list_item ; PICNICKER (18)
	db "ERIN@", TRAINERTYPE_NORMAL
	trainer_mon  PONYTA, 32, NO_ABILITY, MALE
	trainer_mon  PONYTA, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (19)
	db "TANYA@", TRAINERTYPE_NORMAL
	trainer_mon  EXEGGUTOR, 37, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (20)
	db "TIFFANY@", TRAINERTYPE_MOVES
	trainer_mon  CLEFAIRY, 20, NO_ABILITY, MALE
	    mon_move ENCORE, SING, DOUBLESLAP, MINIMIZE
	db -1 ; end

	next_list_item ; PICNICKER (21)
	db "ERIN@", TRAINERTYPE_MOVES
	trainer_mon  PONYTA, 36, NO_ABILITY, MALE
	    mon_move DOUBLE_TEAM, STOMP, FIRE_SPIN, SUNNY_DAY
	trainer_mon  RAICHU, 34, NO_ABILITY, MALE
	    mon_move SWIFT, MUD_SLAP, QUICK_ATTACK, THUNDERBOLT
	trainer_mon  PONYTA, 36, NO_ABILITY, MALE
	    mon_move DOUBLE_TEAM, STOMP, FIRE_SPIN, SUNNY_DAY
	db -1 ; end

	next_list_item ; PICNICKER (22)
	db "LIZ@", TRAINERTYPE_NORMAL
	trainer_mon  WEEPINBELL, 24, NO_ABILITY, MALE
	trainer_mon  NIDORINO, 26, NO_ABILITY, MALE
	trainer_mon  NIDOQUEEN, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (23)
	db "LIZ@", TRAINERTYPE_MOVES
	trainer_mon  WEEPINBELL, 30, NO_ABILITY, MALE
	    mon_move SLEEP_POWDER, POISONPOWDER, STUN_SPORE, SLUDGE_BOMB
	trainer_mon  NIDOKING, 32, NO_ABILITY, MALE
	    mon_move EARTHQUAKE, DOUBLE_KICK, POISON_STING, IRON_TAIL
	trainer_mon  NIDOQUEEN, 32, NO_ABILITY, MALE
	    mon_move EARTHQUAKE, DOUBLE_KICK, TAIL_WHIP, BODY_SLAM
	db -1 ; end

	next_list_item ; PICNICKER (24)
	db "GINA@", TRAINERTYPE_NORMAL
	trainer_mon  SKIPLOOM, 30, NO_ABILITY, MALE
	trainer_mon  SKIPLOOM, 30, NO_ABILITY, MALE
	trainer_mon  IVYSAUR, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; PICNICKER (25)
	db "GINA@", TRAINERTYPE_MOVES
	trainer_mon  JUMPLUFF, 33, NO_ABILITY, MALE
	    mon_move STUN_SPORE, SUNNY_DAY, LEECH_SEED, COTTON_SPORE
	trainer_mon  JUMPLUFF, 33, NO_ABILITY, MALE
	    mon_move SUNNY_DAY, SLEEP_POWDER, LEECH_SEED, COTTON_SPORE
	trainer_mon  VENUSAUR, 38, NO_ABILITY, MALE
	    mon_move SOLARBEAM, RAZOR_LEAF, HEADBUTT, MUD_SLAP
	db -1 ; end

	next_list_item ; PICNICKER (26)
	db "TIFFANY@", TRAINERTYPE_MOVES
	trainer_mon  CLEFAIRY, 43, NO_ABILITY, MALE
	    mon_move METRONOME, ENCORE, MOONLIGHT, MINIMIZE
	db -1 ; end

	end_list_items

CamperGroup:
	next_list_item ; CAMPER (1)
	db "ROLAND@", TRAINERTYPE_NORMAL
	trainer_mon  NIDORAN_M, 9, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (2)
	db "TODD@", TRAINERTYPE_NORMAL
	trainer_mon  PSYDUCK, 14, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (3)
	db "IVAN@", TRAINERTYPE_NORMAL
	trainer_mon  DIGLETT, 10, NO_ABILITY, MALE
	trainer_mon  ZUBAT, 10, NO_ABILITY, MALE
	trainer_mon  DIGLETT, 14, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (4)
	db "ELLIOT@", TRAINERTYPE_NORMAL
	trainer_mon  SANDSHREW, 13, NO_ABILITY, MALE
	trainer_mon  MARILL, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (5)
	db "BARRY@", TRAINERTYPE_NORMAL
	trainer_mon  NIDOKING, 36, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (6)
	db "LLOYD@", TRAINERTYPE_NORMAL
	trainer_mon  NIDOKING, 34, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (7)
	db "DEAN@", TRAINERTYPE_NORMAL
	trainer_mon  GOLDUCK, 33, NO_ABILITY, MALE
	trainer_mon  SANDSLASH, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (8)
	db "SID@", TRAINERTYPE_NORMAL
	trainer_mon  DUGTRIO, 32, NO_ABILITY, MALE
	trainer_mon  PRIMEAPE, 29, NO_ABILITY, MALE
	trainer_mon  POLIWRATH, 29, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (9)
	db "HARVEY@", TRAINERTYPE_NORMAL
	trainer_mon  NIDORINO, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (10)
	db "DALE@", TRAINERTYPE_NORMAL
	trainer_mon  NIDORINO, 15, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (11)
	db "TED@", TRAINERTYPE_NORMAL
	trainer_mon  MANKEY, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (12)
	db "TODD@", TRAINERTYPE_NORMAL
	trainer_mon  GEODUDE, 17, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 17, NO_ABILITY, MALE
	trainer_mon  PSYDUCK, 23, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (13)
	db "TODD@", TRAINERTYPE_NORMAL
	trainer_mon  GEODUDE, 23, NO_ABILITY, MALE
	trainer_mon  GEODUDE, 23, NO_ABILITY, MALE
	trainer_mon  PSYDUCK, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (14)
	db "THOMAS@", TRAINERTYPE_NORMAL
	trainer_mon  GRAVELER, 33, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 36, NO_ABILITY, MALE
	trainer_mon  GOLBAT, 40, NO_ABILITY, MALE
	trainer_mon  GOLDUCK, 42, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (15)
	db "LEROY@", TRAINERTYPE_NORMAL
	trainer_mon  GRAVELER, 33, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 36, NO_ABILITY, MALE
	trainer_mon  GOLBAT, 40, NO_ABILITY, MALE
	trainer_mon  GOLDUCK, 42, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (16)
	db "DAVID@", TRAINERTYPE_NORMAL
	trainer_mon  GRAVELER, 33, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 36, NO_ABILITY, MALE
	trainer_mon  GOLBAT, 40, NO_ABILITY, MALE
	trainer_mon  GOLDUCK, 42, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (17)
	db "JOHN@", TRAINERTYPE_NORMAL
	trainer_mon  GRAVELER, 33, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 36, NO_ABILITY, MALE
	trainer_mon  GOLBAT, 40, NO_ABILITY, MALE
	trainer_mon  GOLDUCK, 42, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (18)
	db "JERRY@", TRAINERTYPE_NORMAL
	trainer_mon  SANDSLASH, 37, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (19)
	db "SPENCER@", TRAINERTYPE_NORMAL
	trainer_mon  SANDSHREW, 17, NO_ABILITY, MALE
	trainer_mon  SANDSLASH, 17, NO_ABILITY, MALE
	trainer_mon  ZUBAT, 19, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (20)
	db "TODD@", TRAINERTYPE_NORMAL
	trainer_mon  GRAVELER, 30, NO_ABILITY, MALE
	trainer_mon  GRAVELER, 30, NO_ABILITY, MALE
	trainer_mon  SLUGMA, 30, NO_ABILITY, MALE
	trainer_mon  PSYDUCK, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; CAMPER (21)
	db "TODD@", TRAINERTYPE_MOVES
	trainer_mon  GRAVELER, 33, NO_ABILITY, MALE
	    mon_move SELFDESTRUCT, ROCK_THROW, HARDEN, MAGNITUDE
	trainer_mon  GRAVELER, 33, NO_ABILITY, MALE
	    mon_move SELFDESTRUCT, ROCK_THROW, HARDEN, MAGNITUDE
	trainer_mon  MAGCARGO, 36, NO_ABILITY, MALE
	    mon_move ROCK_THROW, HARDEN, AMNESIA, FLAMETHROWER
	trainer_mon  GOLDUCK, 34, NO_ABILITY, MALE
	    mon_move DISABLE, PSYCHIC_M, SURF, PSYCH_UP
	db -1 ; end

	next_list_item ; CAMPER (22)
	db "QUENTIN@", TRAINERTYPE_NORMAL
	trainer_mon  FEAROW, 30, NO_ABILITY, MALE
	trainer_mon  PRIMEAPE, 30, NO_ABILITY, MALE
	trainer_mon  TAUROS, 30, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

ExecutiveFGroup:
	next_list_item ; EXECUTIVEF (1)
	db "EXECUTIVE@", TRAINERTYPE_MOVES
	trainer_mon  ARBOK, 32, NO_ABILITY, MALE
	    mon_move WRAP, POISON_STING, BITE, GLARE
	trainer_mon  VILEPLUME, 32, NO_ABILITY, MALE
	    mon_move ABSORB, SWEET_SCENT, SLEEP_POWDER, ACID
	trainer_mon  MURKROW, 32, NO_ABILITY, MALE
	    mon_move PECK, PURSUIT, HAZE, NIGHT_SHADE
	db -1 ; end

	next_list_item ; EXECUTIVEF (2)
	db "EXECUTIVE@", TRAINERTYPE_MOVES
	trainer_mon  ARBOK, 23, NO_ABILITY, MALE
	    mon_move WRAP, LEER, POISON_STING, BITE
	trainer_mon  GLOOM, 23, NO_ABILITY, MALE
	    mon_move ABSORB, SWEET_SCENT, SLEEP_POWDER, ACID
	trainer_mon  MURKROW, 25, NO_ABILITY, MALE
	    mon_move PECK, PURSUIT, HAZE, NO_MOVE
	db -1 ; end

	end_list_items

SageGroup:
	next_list_item ; SAGE (1)
	db "CHOW@", TRAINERTYPE_NORMAL
	trainer_mon  BELLSPROUT, 3, NO_ABILITY, MALE
	trainer_mon  BELLSPROUT, 3, NO_ABILITY, MALE
	trainer_mon  BELLSPROUT, 3, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (2)
	db "NICO@", TRAINERTYPE_NORMAL
	trainer_mon  BELLSPROUT, 3, NO_ABILITY, MALE
	trainer_mon  BELLSPROUT, 3, NO_ABILITY, MALE
	trainer_mon  BELLSPROUT, 3, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (3)
	db "JIN@", TRAINERTYPE_NORMAL
	trainer_mon  BELLSPROUT, 6, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (4)
	db "TROY@", TRAINERTYPE_NORMAL
	trainer_mon  BELLSPROUT, 7, NO_ABILITY, MALE
	trainer_mon  HOOTHOOT, 7, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (5)
	db "JEFFREY@", TRAINERTYPE_NORMAL
	trainer_mon  HAUNTER, 22, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (6)
	db "PING@", TRAINERTYPE_NORMAL
	trainer_mon  GASTLY, 16, NO_ABILITY, MALE
	trainer_mon  GASTLY, 16, NO_ABILITY, MALE
	trainer_mon  GASTLY, 16, NO_ABILITY, MALE
	trainer_mon  GASTLY, 16, NO_ABILITY, MALE
	trainer_mon  GASTLY, 16, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (7)
	db "EDMOND@", TRAINERTYPE_NORMAL
	trainer_mon  BELLSPROUT, 3, NO_ABILITY, MALE
	trainer_mon  BELLSPROUT, 3, NO_ABILITY, MALE
	trainer_mon  BELLSPROUT, 3, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (8)
	db "NEAL@", TRAINERTYPE_NORMAL
	trainer_mon  BELLSPROUT, 6, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (9)
	db "LI@", TRAINERTYPE_NORMAL
	trainer_mon  BELLSPROUT, 7, NO_ABILITY, MALE
	trainer_mon  BELLSPROUT, 7, NO_ABILITY, MALE
	trainer_mon  HOOTHOOT, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (10)
	db "GAKU@", TRAINERTYPE_NORMAL
	trainer_mon  NOCTOWL, 32, NO_ABILITY, MALE
	trainer_mon  FLAREON, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (11)
	db "MASA@", TRAINERTYPE_NORMAL
	trainer_mon  NOCTOWL, 32, NO_ABILITY, MALE
	trainer_mon  JOLTEON, 32, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; SAGE (12)
	db "KOJI@", TRAINERTYPE_NORMAL
	trainer_mon  NOCTOWL, 32, NO_ABILITY, MALE
	trainer_mon  VAPOREON, 32, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

MediumGroup:
	next_list_item ; MEDIUM (1)
	db "MARTHA@", TRAINERTYPE_NORMAL
	trainer_mon  GASTLY, 18, NO_ABILITY, MALE
	trainer_mon  HAUNTER, 20, NO_ABILITY, MALE
	trainer_mon  GASTLY, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; MEDIUM (2)
	db "GRACE@", TRAINERTYPE_NORMAL
	trainer_mon  HAUNTER, 20, NO_ABILITY, MALE
	trainer_mon  HAUNTER, 20, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; MEDIUM (3)
	db "BETHANY@", TRAINERTYPE_NORMAL
	trainer_mon  HAUNTER, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; MEDIUM (4)
	db "MARGRET@", TRAINERTYPE_NORMAL
	trainer_mon  HAUNTER, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; MEDIUM (5)
	db "ETHEL@", TRAINERTYPE_NORMAL
	trainer_mon  HAUNTER, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; MEDIUM (6)
	db "REBECCA@", TRAINERTYPE_NORMAL
	trainer_mon  DROWZEE, 35, NO_ABILITY, MALE
	trainer_mon  HYPNO, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; MEDIUM (7)
	db "DORIS@", TRAINERTYPE_NORMAL
	trainer_mon  SLOWPOKE, 34, NO_ABILITY, MALE
	trainer_mon  SLOWBRO, 36, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

BoarderGroup:
	next_list_item ; BOARDER (1)
	db "RONALD@", TRAINERTYPE_NORMAL
	trainer_mon  SEEL, 24, NO_ABILITY, MALE
	trainer_mon  DEWGONG, 25, NO_ABILITY, MALE
	trainer_mon  SEEL, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BOARDER (2)
	db "BRAD@", TRAINERTYPE_NORMAL
	trainer_mon  SWINUB, 26, NO_ABILITY, MALE
	trainer_mon  SWINUB, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; BOARDER (3)
	db "DOUGLAS@", TRAINERTYPE_NORMAL
	trainer_mon  SHELLDER, 24, NO_ABILITY, MALE
	trainer_mon  CLOYSTER, 25, NO_ABILITY, MALE
	trainer_mon  SHELLDER, 24, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

PokefanMGroup:
	next_list_item ; POKEFANM (1)
	db "WILLIAM@", TRAINERTYPE_ITEM
	trainer_mon  RAICHU, 14, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (2)
	db "DEREK@", TRAINERTYPE_ITEM
	trainer_mon  PIKACHU, 17, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (3)
	db "ROBERT@", TRAINERTYPE_ITEM
	trainer_mon  QUAGSIRE, 33, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (4)
	db "JOSHUA@", TRAINERTYPE_ITEM
	trainer_mon  PIKACHU, 23, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  PIKACHU, 23, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  PIKACHU, 23, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  PIKACHU, 23, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  PIKACHU, 23, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  PIKACHU, 23, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (5)
	db "CARTER@", TRAINERTYPE_ITEM
	trainer_mon  BULBASAUR, 29, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  CHARMANDER, 29, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  SQUIRTLE, 29, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (6)
	db "TREVOR@", TRAINERTYPE_ITEM
	trainer_mon  PSYDUCK, 33, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (7)
	db "BRANDON@", TRAINERTYPE_ITEM
	trainer_mon  SNUBBULL, 13, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (8)
	db "JEREMY@", TRAINERTYPE_ITEM
	trainer_mon  MEOWTH, 28, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  MEOWTH, 28, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  MEOWTH, 28, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (9)
	db "COLIN@", TRAINERTYPE_ITEM
	trainer_mon  DELIBIRD, 32, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (10)
	db "DEREK@", TRAINERTYPE_ITEM
	trainer_mon  PIKACHU, 19, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (11)
	db "DEREK@", TRAINERTYPE_ITEM
	trainer_mon  PIKACHU, 36, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (12)
	db "ALEX@", TRAINERTYPE_ITEM
	trainer_mon  NIDOKING, 29, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  SLOWKING, 29, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  SEAKING, 29, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (13)
	db "REX@", TRAINERTYPE_ITEM
	trainer_mon  PHANPY, 35, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANM (14)
	db "ALLAN@", TRAINERTYPE_ITEM
	trainer_mon  TEDDIURSA, 35, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	end_list_items

KimonoGirlGroup:
	next_list_item ; KIMONO_GIRL (1)
	db "NAOKO@", TRAINERTYPE_NORMAL
	trainer_mon  SKIPLOOM, 20, NO_ABILITY, MALE
	trainer_mon  VULPIX, 20, NO_ABILITY, MALE
	trainer_mon  SKIPLOOM, 18, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; KIMONO_GIRL (2)
	db "NAOKO@", TRAINERTYPE_NORMAL
	trainer_mon  FLAREON, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; KIMONO_GIRL (3)
	db "SAYO@", TRAINERTYPE_NORMAL
	trainer_mon  ESPEON, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; KIMONO_GIRL (4)
	db "ZUKI@", TRAINERTYPE_NORMAL
	trainer_mon  UMBREON, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; KIMONO_GIRL (5)
	db "KUNI@", TRAINERTYPE_NORMAL
	trainer_mon  VAPOREON, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; KIMONO_GIRL (6)
	db "MIKI@", TRAINERTYPE_NORMAL
	trainer_mon  JOLTEON, 17, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

TwinsGroup:
	next_list_item ; TWINS (1)
	db "AMY & MAY@", TRAINERTYPE_NORMAL
	trainer_mon  SPINARAK, 10, NO_ABILITY, MALE
	trainer_mon  LEDYBA, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; TWINS (2)
	db "ANN & ANNE@", TRAINERTYPE_MOVES
	trainer_mon  CLEFAIRY, 16, NO_ABILITY, MALE
	    mon_move GROWL, ENCORE, DOUBLESLAP, METRONOME
	trainer_mon  JIGGLYPUFF, 16, NO_ABILITY, MALE
	    mon_move SING, DEFENSE_CURL, POUND, DISABLE
	db -1 ; end

	next_list_item ; TWINS (3)
	db "ANN & ANNE@", TRAINERTYPE_MOVES
	trainer_mon  JIGGLYPUFF, 16, NO_ABILITY, MALE
	    mon_move SING, DEFENSE_CURL, POUND, DISABLE
	trainer_mon  CLEFAIRY, 16, NO_ABILITY, MALE
	    mon_move GROWL, ENCORE, DOUBLESLAP, METRONOME
	db -1 ; end

	next_list_item ; TWINS (4)
	db "AMY & MAY@", TRAINERTYPE_NORMAL
	trainer_mon  LEDYBA, 10, NO_ABILITY, MALE
	trainer_mon  SPINARAK, 10, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; TWINS (5)
	db "JO & ZOE@", TRAINERTYPE_NORMAL
	trainer_mon  VICTREEBEL, 35, NO_ABILITY, MALE
	trainer_mon  VILEPLUME, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; TWINS (6)
	db "JO & ZOE@", TRAINERTYPE_NORMAL
	trainer_mon  VILEPLUME, 35, NO_ABILITY, MALE
	trainer_mon  VICTREEBEL, 35, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; TWINS (7)
	db "MEG & PEG@", TRAINERTYPE_NORMAL
	trainer_mon  TEDDIURSA, 31, NO_ABILITY, MALE
	trainer_mon  PHANPY, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; TWINS (8)
	db "MEG & PEG@", TRAINERTYPE_NORMAL
	trainer_mon  PHANPY, 31, NO_ABILITY, MALE
	trainer_mon  TEDDIURSA, 31, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; TWINS (9)
	db "LEA & PIA@", TRAINERTYPE_MOVES
	trainer_mon  DRATINI, 35, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	trainer_mon  DRATINI, 35, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	db -1 ; end

	next_list_item ; TWINS (10)
	db "LEA & PIA@", TRAINERTYPE_MOVES
	trainer_mon  DRATINI, 38, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	trainer_mon  DRATINI, 38, NO_ABILITY, MALE
	    mon_move THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	db -1 ; end

	end_list_items

PokefanFGroup:
	next_list_item ; POKEFANF (1)
	db "BEVERLY@", TRAINERTYPE_ITEM
	trainer_mon  SNUBBULL, 14, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANF (2)
	db "RUTH@", TRAINERTYPE_ITEM
	trainer_mon  PIKACHU, 17, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANF (3)
	db "BEVERLY@", TRAINERTYPE_ITEM
	trainer_mon  SNUBBULL, 18, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANF (4)
	db "BEVERLY@", TRAINERTYPE_ITEM
	trainer_mon  GRANBULL, 30, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANF (5)
	db "GEORGIA@", TRAINERTYPE_ITEM
	trainer_mon  SENTRET, 23, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  SENTRET, 23, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  SENTRET, 23, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  FURRET, 28, NO_ABILITY, MALE
	    mon_item BERRY
	trainer_mon  SENTRET, 23, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	next_list_item ; POKEFANF (6)
	db "JAIME@", TRAINERTYPE_ITEM
	trainer_mon  MEOWTH, 16, NO_ABILITY, MALE
	    mon_item BERRY
	db -1 ; end

	end_list_items

RedGroup:
	next_list_item ; RED (1)
	db "RED@", TRAINERTYPE_MOVES
	trainer_mon  PIKACHU, 81, NO_ABILITY, MALE
	    mon_move CHARM, QUICK_ATTACK, THUNDERBOLT, THUNDER
	trainer_mon  ESPEON, 73, NO_ABILITY, MALE
	    mon_move MUD_SLAP, REFLECT, SWIFT, PSYCHIC_M
	trainer_mon  SNORLAX, 75, NO_ABILITY, MALE
	    mon_move AMNESIA, SNORE, REST, BODY_SLAM
	trainer_mon  VENUSAUR, 77, NO_ABILITY, MALE
	    mon_move SUNNY_DAY, GIGA_DRAIN, SYNTHESIS, SOLARBEAM
	trainer_mon  CHARIZARD, 77, NO_ABILITY, MALE
	    mon_move FLAMETHROWER, WING_ATTACK, SLASH, FIRE_SPIN
	trainer_mon  BLASTOISE, 77, NO_ABILITY, MALE
	    mon_move RAIN_DANCE, SURF, BLIZZARD, WHIRLPOOL
	db -1 ; end

	end_list_items

BlueGroup:
	next_list_item ; BLUE (1)
	db "BLUE@", TRAINERTYPE_MOVES
	trainer_mon  PIDGEOT, 56, NO_ABILITY, MALE
	    mon_move QUICK_ATTACK, WHIRLWIND, WING_ATTACK, MIRROR_MOVE
	trainer_mon  ALAKAZAM, 54, NO_ABILITY, MALE
	    mon_move DISABLE, RECOVER, PSYCHIC_M, REFLECT
	trainer_mon  RHYDON, 56, NO_ABILITY, MALE
	    mon_move FURY_ATTACK, SANDSTORM, ROCK_SLIDE, EARTHQUAKE
	trainer_mon  GYARADOS, 58, NO_ABILITY, MALE
	    mon_move TWISTER, HYDRO_PUMP, RAIN_DANCE, HYPER_BEAM
	trainer_mon  EXEGGUTOR, 58, NO_ABILITY, MALE
	    mon_move SUNNY_DAY, LEECH_SEED, EGG_BOMB, SOLARBEAM
	trainer_mon  ARCANINE, 58, NO_ABILITY, MALE
	    mon_move ROAR, SWIFT, FLAMETHROWER, EXTREMESPEED
	db -1 ; end

	end_list_items

OfficerGroup:
	next_list_item ; OFFICER (1)
	db "KEITH@", TRAINERTYPE_NORMAL
	trainer_mon  GROWLITHE, 17, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; OFFICER (2)
	db "DIRK@", TRAINERTYPE_NORMAL
	trainer_mon  GROWLITHE, 14, NO_ABILITY, MALE
	trainer_mon  GROWLITHE, 14, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

GruntFGroup:
	next_list_item ; GRUNTF (1)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  ZUBAT, 9, NO_ABILITY, MALE
	trainer_mon  EKANS, 11, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTF (2)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  ARBOK, 26, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTF (3)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  GLOOM, 25, NO_ABILITY, MALE
	trainer_mon  GLOOM, 25, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTF (4)
	db "GRUNT@", TRAINERTYPE_NORMAL
	trainer_mon  EKANS, 21, NO_ABILITY, MALE
	trainer_mon  ODDISH, 23, NO_ABILITY, MALE
	trainer_mon  EKANS, 21, NO_ABILITY, MALE
	trainer_mon  GLOOM, 24, NO_ABILITY, MALE
	db -1 ; end

	next_list_item ; GRUNTF (5)
	db "GRUNT@", TRAINERTYPE_MOVES
	trainer_mon  EKANS, 18, NO_ABILITY, MALE
	    mon_move WRAP, LEER, POISON_STING, BITE
	trainer_mon  GLOOM, 18, NO_ABILITY, MALE
	    mon_move ABSORB, SWEET_SCENT, STUN_SPORE, SLEEP_POWDER
	db -1 ; end

	end_list_items

MysticalmanGroup:
	next_list_item ; MYSTICALMAN (1)
	db "EUSINE@", TRAINERTYPE_MOVES
	trainer_mon  DROWZEE, 23, NO_ABILITY, MALE
	    mon_move DREAM_EATER, HYPNOSIS, DISABLE, CONFUSION
	trainer_mon  HAUNTER, 23, NO_ABILITY, MALE
	    mon_move LICK, HYPNOSIS, MEAN_LOOK, CURSE
	trainer_mon  ELECTRODE, 25, NO_ABILITY, MALE
	    mon_move SCREECH, SONICBOOM, THUNDER, ROLLOUT
	db -1 ; end

	end_list_items

KrisGroup:
	next_list_item; KRIS (1)
	db "KRIS@", TRAINERTYPE_NORMAL
	trainer_mon  CHIKORITA, 10, NO_ABILITY, MALE
	trainer_mon  CYNDAQUIL, 10, NO_ABILITY, MALE
	trainer_mon  TOTODILE, 10, NO_ABILITY, MALE
	db -1 ; end

	end_list_items

ENDSECTION
