; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - MoveDescriptions (see data/moves/descriptions.asm)
; - BattleAnimations (see data/moves/animations.asm)
	const_def
	const NO_MOVE      ; 00
	const POUND        ; 01
	const KARATE_CHOP  ; 02
	const DOUBLESLAP   ; 03
	const COMET_PUNCH  ; 04
	const MEGA_PUNCH   ; 05
	const PAY_DAY      ; 06
	const FIRE_PUNCH   ; 07
	const ICE_PUNCH    ; 08
	const THUNDERPUNCH ; 09
	const SCRATCH      ; 0a
	const VICEGRIP     ; 0b
	const GUILLOTINE   ; 0c
	const RAZOR_WIND   ; 0d
	const SWORDS_DANCE ; 0e
	const CUT          ; 0f
	const GUST         ; 10
	const WING_ATTACK  ; 11
	const WHIRLWIND    ; 12
	const FLY          ; 13
	const BIND         ; 14
	const SLAM         ; 15
	const VINE_WHIP    ; 16
	const STOMP        ; 17
	const DOUBLE_KICK  ; 18
	const MEGA_KICK    ; 19
	const JUMP_KICK    ; 1a
	const ROLLING_KICK ; 1b
	const SAND_ATTACK  ; 1c
	const HEADBUTT     ; 1d
	const HORN_ATTACK  ; 1e
	const FURY_ATTACK  ; 1f
	const HORN_DRILL   ; 20
	const TACKLE       ; 21
	const BODY_SLAM    ; 22
	const WRAP         ; 23
	const TAKE_DOWN    ; 24
	const THRASH       ; 25
	const DOUBLE_EDGE  ; 26
	const TAIL_WHIP    ; 27
	const POISON_STING ; 28
	const TWINEEDLE    ; 29
	const PIN_MISSILE  ; 2a
	const LEER         ; 2b
	const BITE         ; 2c
	const GROWL        ; 2d
	const ROAR         ; 2e
	const SING         ; 2f
	const SUPERSONIC   ; 30
	const SONICBOOM    ; 31
	const DISABLE      ; 32
	const ACID         ; 33
	const EMBER        ; 34
	const FLAMETHROWER ; 35
	const MIST         ; 36
	const WATER_GUN    ; 37
	const HYDRO_PUMP   ; 38
	const SURF         ; 39
	const ICE_BEAM     ; 3a
	const BLIZZARD     ; 3b
	const PSYBEAM      ; 3c
	const BUBBLEBEAM   ; 3d
	const AURORA_BEAM  ; 3e
	const HYPER_BEAM   ; 3f
	const PECK         ; 40
	const DRILL_PECK   ; 41
	const SUBMISSION   ; 42
	const LOW_KICK     ; 43
	const COUNTER      ; 44
	const SEISMIC_TOSS ; 45
	const STRENGTH     ; 46
	const ABSORB       ; 47
	const MEGA_DRAIN   ; 48
	const LEECH_SEED   ; 49
	const GROWTH       ; 4a
	const RAZOR_LEAF   ; 4b
	const SOLARBEAM    ; 4c
	const POISONPOWDER ; 4d
	const STUN_SPORE   ; 4e
	const SLEEP_POWDER ; 4f
	const PETAL_DANCE  ; 50
	const STRING_SHOT  ; 51
	const DRAGON_RAGE  ; 52
	const FIRE_SPIN    ; 53
	const THUNDERSHOCK ; 54
	const THUNDERBOLT  ; 55
	const THUNDER_WAVE ; 56
	const THUNDER      ; 57
	const ROCK_THROW   ; 58
	const EARTHQUAKE   ; 59
	const FISSURE      ; 5a
	const DIG          ; 5b
	const TOXIC        ; 5c
	const CONFUSION    ; 5d
	const PSYCHIC_M    ; 5e
	const HYPNOSIS     ; 5f
	const MEDITATE     ; 60
	const AGILITY      ; 61
	const QUICK_ATTACK ; 62
	const RAGE         ; 63
	const TELEPORT     ; 64
	const NIGHT_SHADE  ; 65
	const MIMIC        ; 66
	const SCREECH      ; 67
	const DOUBLE_TEAM  ; 68
	const RECOVER      ; 69
	const HARDEN       ; 6a
	const MINIMIZE     ; 6b
	const SMOKESCREEN  ; 6c
	const CONFUSE_RAY  ; 6d
	const WITHDRAW     ; 6e
	const DEFENSE_CURL ; 6f
	const BARRIER      ; 70
	const LIGHT_SCREEN ; 71
	const HAZE         ; 72
	const REFLECT      ; 73
	const FOCUS_ENERGY ; 74
	const BIDE         ; 75
	const METRONOME    ; 76
	const MIRROR_MOVE  ; 77
	const SELFDESTRUCT ; 78
	const EGG_BOMB     ; 79
	const LICK         ; 7a
	const SMOG         ; 7b
	const SLUDGE       ; 7c
	const BONE_CLUB    ; 7d
	const FIRE_BLAST   ; 7e
	const WATERFALL    ; 7f
	const CLAMP        ; 80
	const SWIFT        ; 81
	const SKULL_BASH   ; 82
	const SPIKE_CANNON ; 83
	const CONSTRICT    ; 84
	const AMNESIA      ; 85
	const KINESIS      ; 86
	const SOFTBOILED   ; 87
	const HI_JUMP_KICK ; 88
	const GLARE        ; 89
	const DREAM_EATER  ; 8a
	const POISON_GAS   ; 8b
	const BARRAGE      ; 8c
	const LEECH_LIFE   ; 8d
	const LOVELY_KISS  ; 8e
	const SKY_ATTACK   ; 8f
	const TRANSFORM    ; 90
	const BUBBLE       ; 91
	const DIZZY_PUNCH  ; 92
	const SPORE        ; 93
	const FLASH        ; 94
	const PSYWAVE      ; 95
	const SPLASH       ; 96
	const ACID_ARMOR   ; 97
	const CRABHAMMER   ; 98
	const EXPLOSION    ; 99
	const FURY_SWIPES  ; 9a
	const BONEMERANG   ; 9b
	const REST         ; 9c
	const ROCK_SLIDE   ; 9d
	const HYPER_FANG   ; 9e
	const SHARPEN      ; 9f
	const CONVERSION   ; a0
	const TRI_ATTACK   ; a1
	const SUPER_FANG   ; a2
	const SLASH        ; a3
	const SUBSTITUTE   ; a4
	const STRUGGLE     ; a5
DEF GEN1_MOVES EQU const_value - 1
	const SKETCH       ; a6
	const TRIPLE_KICK  ; a7
	const THIEF        ; a8
	const SPIDER_WEB   ; a9
	const MIND_READER  ; aa
	const NIGHTMARE    ; ab
	const FLAME_WHEEL  ; ac
	const SNORE        ; ad
	const CURSE        ; ae
	const FLAIL        ; af
	const CONVERSION2  ; b0
	const AEROBLAST    ; b1
	const COTTON_SPORE ; b2
	const REVERSAL     ; b3
	const SPITE        ; b4
	const POWDER_SNOW  ; b5
	const PROTECT      ; b6
	const MACH_PUNCH   ; b7
	const SCARY_FACE   ; b8
	const FAINT_ATTACK ; b9
	const SWEET_KISS   ; ba
	const BELLY_DRUM   ; bb
	const SLUDGE_BOMB  ; bc
	const MUD_SLAP     ; bd
	const OCTAZOOKA    ; be
	const SPIKES       ; bf
	const ZAP_CANNON   ; c0
	const FORESIGHT    ; c1
	const DESTINY_BOND ; c2
	const PERISH_SONG  ; c3
	const ICY_WIND     ; c4
	const DETECT       ; c5
	const BONE_RUSH    ; c6
	const LOCK_ON      ; c7
	const OUTRAGE      ; c8
	const SANDSTORM    ; c9
	const GIGA_DRAIN   ; ca
	const ENDURE       ; cb
	const CHARM        ; cc
	const ROLLOUT      ; cd
	const FALSE_SWIPE  ; ce
	const SWAGGER      ; cf
	const MILK_DRINK   ; d0
	const SPARK        ; d1
	const FURY_CUTTER  ; d2
	const STEEL_WING   ; d3
	const MEAN_LOOK    ; d4
	const ATTRACT      ; d5
	const SLEEP_TALK   ; d6
	const HEAL_BELL    ; d7
	const RETURN       ; d8
	const PRESENT      ; d9
	const FRUSTRATION  ; da
	const SAFEGUARD    ; db
	const PAIN_SPLIT   ; dc
	const SACRED_FIRE  ; dd
	const MAGNITUDE    ; de
	const DYNAMICPUNCH ; df
	const MEGAHORN     ; e0
	const DRAGONBREATH ; e1
	const BATON_PASS   ; e2
	const ENCORE       ; e3
	const PURSUIT      ; e4
	const RAPID_SPIN   ; e5
	const SWEET_SCENT  ; e6
	const IRON_TAIL    ; e7
	const METAL_CLAW   ; e8
	const VITAL_THROW  ; e9
	const MORNING_SUN  ; ea
	const SYNTHESIS    ; eb
	const MOONLIGHT    ; ec
	const HIDDEN_POWER ; ed
	const CROSS_CHOP   ; ee
	const TWISTER      ; ef
	const RAIN_DANCE   ; f0
	const SUNNY_DAY    ; f1
	const CRUNCH       ; f2
	const MIRROR_COAT  ; f3
	const PSYCH_UP     ; f4
	const EXTREMESPEED ; f5
	const ANCIENTPOWER ; f6
	const SHADOW_BALL  ; f7
	const FUTURE_SIGHT ; f8
	const ROCK_SMASH   ; f9
	const WHIRLPOOL    ; fa
	const BEAT_UP      ; fb
DEF GEN2_MOVES EQU const_value - 1

DEF NUM_ATTACKS EQU const_value - 1

	const FAKE_OUT
	const UPROAR
	const STOCKPILE
	const SPIT_UP
	const SWALLOW
	const HEAT_WAVE
	const HAIL
	const TORMENT
	const FLATTER
	const WILL_O_WISP
	const MEMENTO
	const FACADE
	const FOCUS_PUNCH
	const NATURE_POWER
	const CHARGE
	const TAUNT
	const TRICK
	const WISH
	const INGRAIN
	const SUPERPOWER
	const MAGIC_COAT
	const RECYCLE
	const REVENGE
	const BRICK_BREAK
	const YAWN
	const KNOCK_OFF
	const ENDEAVOR
	const ERUPTION
	const SKILL_SWAP
	const REFRESH
	const GRUDGE
	const SECRET_POWER
	const DIVE
	const CAMOUFLAGE
	const LUSTER_PURGE
	const MIST_BALL
	const FEATHERDANCE
	const TEETER_DANCE
	const BLAZE_KICK
	const ICE_BALL
	const NEEDLE_ARM
	const SLACK_OFF
	const HYPER_VOICE
	const POISON_FANG
	const CRUSH_CLAW
	const BLAST_BURN
	const HYDRO_CANNON
	const METEOR_MASH
	const ASTONISH
	const WEATHER_BALL
	const AROMATHERAPY
	const FAKE_TEARS
	const AIR_CUTTER
	const OVERHEAT
	const ROCK_TOMB
	const SILVER_WIND
	const METAL_SOUND
	const GRASSWHISTLE
	const TICKLE
	const COSMIC_POWER
	const WATER_SPOUT
	const SIGNAL_BEAM
	const SHADOW_PUNCH
	const EXTRASENSORY
	const SKY_UPPERCUT
	const SAND_TOMB
	const SHEER_COLD
	const MUDDY_WATER
	const BULLET_SEED
	const AERIAL_ACE
	const IRON_DEFENSE
	const BLOCK
	const HOWL
	const DRAGON_CLAW
	const FRENZY_PLANT
	const BULK_UP
	const BOUNCE
	const MUD_SHOT
	const POISON_TAIL
	const COVET
	const VOLT_TACKLE
	const MAGICAL_LEAF
	const CALM_MIND
	const LEAF_BLADE
	const DRAGON_DANCE
	const ROCK_BLAST
	const SHOCK_WAVE
	const WATER_PULSE
	const PSYCHO_BOOST
	const ROOST
	const MIRACLE_EYE
	const WAKE_UP_SLAP
	const HAMMER_ARM
	const GYRO_BALL
	const HEALING_WISH
	const BRINE
	const NATURAL_GIFT
	const FEINT
	const PLUCK
	const TAILWIND
	const ACUPRESSURE
	const METAL_BURST
	const U_TURN
	const CLOSE_COMBAT
	const PAYBACK
	const ASSURANCE
	const EMBARGO
	const FLING
	const PSYCHO_SHIFT
	const TRUMP_CARD
	const WRING_OUT
	const GASTRO_ACID
	const LUCKY_CHANT
	const COPYCAT
	const PUNISHMENT
	const LAST_RESORT
	const WORRY_SEED
	const SUCKER_PUNCH
	const TOXIC_SPIKES
	const AQUA_RING
	const MAGNET_RISE
	const FLARE_BLITZ
	const FORCE_PALM
	const ROCK_POLISH
	const POISON_JAB
	const DARK_PULSE
	const NIGHT_SLASH
	const AQUA_TAIL
	const SEED_BOMB
	const AIR_SLASH
	const X_SCISSOR
	const BUG_BUZZ
	const DRAGON_PULSE
	const DRAGON_RUSH
	const POWER_GEM
	const DRAIN_PUNCH
	const VACUUM_WAVE
	const ENERGY_BALL
	const BRAVE_BIRD
	const EARTH_POWER
	const SWITCHEROO
	const GIGA_IMPACT
	const NASTY_PLOT
	const BULLET_PUNCH
	const ICE_SHARD
	const SHADOW_CLAW
	const THUNDER_FANG
	const ICE_FANG
	const FIRE_FANG
	const SHADOW_SNEAK
	const MUD_BOMB
	const PSYCHO_CUT
	const ZEN_HEADBUTT
	const MIRROR_SHOT
	const FLASH_CANNON
	const TRICK_ROOM
	const DRACO_METEOR
	const DISCHARGE
	const LAVA_PLUME
	const LEAF_STORM
	const POWER_WHIP
	const CROSS_POISON
	const GUNK_SHOT
	const IRON_HEAD
	const MAGNET_BOMB
	const STONE_EDGE
	const CAPTIVATE
	const STEALTH_ROCK
	const BUG_BITE
	const CHARGE_BEAM
	const WOOD_HAMMER
	const AQUA_JET
	const ATTACK_ORDER
	const DEFEND_ORDER
	const HEAL_ORDER
	const DOUBLE_HIT
	const HONE_CLAWS
	const PSYSHOCK
	const VENOSHOCK
	const SLUDGE_WAVE
	const QUIVER_DANCE
	const FLAME_CHARGE
	const ENTRAINMENT
	const STORED_POWER
	const SHELL_SMASH
	const HEAL_PULSE
	const HEX
	const CIRCLE_THROW
	const ACROBATICS
	const RETALIATE
	const WORK_UP
	const ELECTROWEB
	const HURRICANE
	const FLYING_PRESS
	const BELCH
	const STICKY_WEB
	const FELL_STINGER
	const NOBLE_ROAR
	const PETAL_BLIZZARD
	const DISARMING_VOICE
	const PARTING_SHOT
	const DRAINING_KISS
	const PLAY_ROUGH
	const FAIRY_WIND
	const MOONBLAST
	const BOOMBURST
	const DAZZLING_GLEAM
	const NUZZLE
	const MAKE_IT_RAIN
	const SHED_TAIL
	const HYPER_DRILL
	const TWIN_BEAM
	const RAGE_FIST
	const GIGATON_HAMMER
	const BLOOD_MOON

	if NUM_ATTACKS > $3fff
		fail "Too many moves defined!"
	endc

; Battle animations use the same constants as the moves
	const ANIM_SWEET_SCENT_2     ; fc
; Animations with negative IDs will play even when animations are disabled
	const_def -1, -1
	const ANIM_HIT_CONFUSION     ;  -1 (ffff)
	const ANIM_SHAKE             ;  -2 (fffe)
	const ANIM_WOBBLE            ;  -3 (fffd)
	const ANIM_PLAYER_DAMAGE     ;  -4 (fffc)
	const ANIM_PLAYER_STAT_DOWN  ;  -5 (fffb)
	const ANIM_ENEMY_STAT_DOWN   ;  -6 (fffa)
	const ANIM_ENEMY_DAMAGE      ;  -7 (fff9)
	const ANIM_MISS              ;  -8 (fff8)
; battle anims
	const ANIM_IN_WHIRLPOOL      ;  -9 (fff7)
	const ANIM_IN_NIGHTMARE      ;  -a (fff6)
	const ANIM_IN_SANDSTORM      ;  -b (fff5)
	const ANIM_IN_LOVE           ;  -c (fff4)
	const ANIM_PAR               ;  -d (fff3)
	const ANIM_FRZ               ;  -e (fff2)
	const ANIM_SAP               ;  -f (fff1)
	const ANIM_PSN               ; -10 (fff0)
	const ANIM_BRN               ; -11 (ffef)
	const ANIM_SLP               ; -12 (ffee)
	const ANIM_CONFUSED          ; -13 (ffed)
	const ANIM_RETURN_MON        ; -14 (ffec)
	const ANIM_SEND_OUT_MON      ; -15 (ffeb)
	const ANIM_THROW_POKE_BALL   ; -16 (ffea)
DEF NUM_BATTLE_ANIMS EQU -const_value - 1

; wNumHits uses offsets from ANIM_MISS
	const_def
	const BATTLEANIM_NONE
	const BATTLEANIM_ENEMY_DAMAGE
	const BATTLEANIM_ENEMY_STAT_DOWN
	const BATTLEANIM_PLAYER_STAT_DOWN
	const BATTLEANIM_PLAYER_DAMAGE
	const BATTLEANIM_WOBBLE
	const BATTLEANIM_SHAKE
	const BATTLEANIM_HIT_CONFUSION
