; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - MoveDescriptions (see data/moves/descriptions.asm)
; - BattleAnimations (see data/moves/animations.asm)
	const_def
	const NO_MOVE      ; 000
	const POUND        ; 001
	const KARATE_CHOP  ; 002
	const DOUBLESLAP   ; 003
	const COMET_PUNCH  ; 004
	const MEGA_PUNCH   ; 005
	const PAY_DAY      ; 006
	const FIRE_PUNCH   ; 007
	const ICE_PUNCH    ; 008
	const THUNDERPUNCH ; 009
	const SCRATCH      ; 00a
	const VICEGRIP     ; 00b
	const GUILLOTINE   ; 00c
	const RAZOR_WIND   ; 00d
	const SWORDS_DANCE ; 00e
	const CUT          ; 00f
	const GUST         ; 010
	const WING_ATTACK  ; 011
	const WHIRLWIND    ; 012
	const FLY          ; 013
	const BIND         ; 014
	const SLAM         ; 015
	const VINE_WHIP    ; 016
	const STOMP        ; 017
	const DOUBLE_KICK  ; 018
	const MEGA_KICK    ; 019
	const JUMP_KICK    ; 01a
	const ROLLING_KICK ; 01b
	const SAND_ATTACK  ; 01c
	const HEADBUTT     ; 01d
	const HORN_ATTACK  ; 01e
	const FURY_ATTACK  ; 01f
	const HORN_DRILL   ; 020
	const TACKLE       ; 021
	const BODY_SLAM    ; 022
	const WRAP         ; 023
	const TAKE_DOWN    ; 024
	const THRASH       ; 025
	const DOUBLE_EDGE  ; 026
	const TAIL_WHIP    ; 027
	const POISON_STING ; 028
	const TWINEEDLE    ; 029
	const PIN_MISSILE  ; 02a
	const LEER         ; 02b
	const BITE         ; 02c
	const GROWL        ; 02d
	const ROAR         ; 02e
	const SING         ; 02f
	const SUPERSONIC   ; 030
	const SONICBOOM    ; 031
	const DISABLE      ; 032
	const ACID         ; 033
	const EMBER        ; 034
	const FLAMETHROWER ; 035
	const MIST         ; 036
	const WATER_GUN    ; 037
	const HYDRO_PUMP   ; 038
	const SURF         ; 039
	const ICE_BEAM     ; 03a
	const BLIZZARD     ; 03b
	const PSYBEAM      ; 03c
	const BUBBLEBEAM   ; 03d
	const AURORA_BEAM  ; 03e
	const HYPER_BEAM   ; 03f
	const PECK         ; 040
	const DRILL_PECK   ; 041
	const SUBMISSION   ; 042
	const LOW_KICK     ; 043
	const COUNTER      ; 044
	const SEISMIC_TOSS ; 045
	const STRENGTH     ; 046
	const ABSORB       ; 047
	const MEGA_DRAIN   ; 048
	const LEECH_SEED   ; 049
	const GROWTH       ; 04a
	const RAZOR_LEAF   ; 04b
	const SOLARBEAM    ; 04c
	const POISONPOWDER ; 04d
	const STUN_SPORE   ; 04e
	const SLEEP_POWDER ; 04f
	const PETAL_DANCE  ; 050
	const STRING_SHOT  ; 051
	const DRAGON_RAGE  ; 052
	const FIRE_SPIN    ; 053
	const THUNDERSHOCK ; 054
	const THUNDERBOLT  ; 055
	const THUNDER_WAVE ; 056
	const THUNDER      ; 057
	const ROCK_THROW   ; 058
	const EARTHQUAKE   ; 059
	const FISSURE      ; 05a
	const DIG          ; 05b
	const TOXIC        ; 05c
	const CONFUSION    ; 05d
	const PSYCHIC_M    ; 05e
	const HYPNOSIS     ; 05f
	const MEDITATE     ; 060
	const AGILITY      ; 061
	const QUICK_ATTACK ; 062
	const RAGE         ; 063
	const TELEPORT     ; 064
	const NIGHT_SHADE  ; 065
	const MIMIC        ; 066
	const SCREECH      ; 067
	const DOUBLE_TEAM  ; 068
	const RECOVER      ; 069
	const HARDEN       ; 06a
	const MINIMIZE     ; 06b
	const SMOKESCREEN  ; 06c
	const CONFUSE_RAY  ; 06d
	const WITHDRAW     ; 06e
	const DEFENSE_CURL ; 06f
	const BARRIER      ; 070
	const LIGHT_SCREEN ; 071
	const HAZE         ; 072
	const REFLECT      ; 073
	const FOCUS_ENERGY ; 074
	const BIDE         ; 075
	const METRONOME    ; 076
	const MIRROR_MOVE  ; 077
	const SELFDESTRUCT ; 078
	const EGG_BOMB     ; 079
	const LICK         ; 07a
	const SMOG         ; 07b
	const SLUDGE       ; 07c
	const BONE_CLUB    ; 07d
	const FIRE_BLAST   ; 07e
	const WATERFALL    ; 07f
	const CLAMP        ; 080
	const SWIFT        ; 081
	const SKULL_BASH   ; 082
	const SPIKE_CANNON ; 083
	const CONSTRICT    ; 084
	const AMNESIA      ; 085
	const KINESIS      ; 086
	const SOFTBOILED   ; 087
	const HI_JUMP_KICK ; 088
	const GLARE        ; 089
	const DREAM_EATER  ; 08a
	const POISON_GAS   ; 08b
	const BARRAGE      ; 08c
	const LEECH_LIFE   ; 08d
	const LOVELY_KISS  ; 08e
	const SKY_ATTACK   ; 08f
	const TRANSFORM    ; 090
	const BUBBLE       ; 091
	const DIZZY_PUNCH  ; 092
	const SPORE        ; 093
	const FLASH        ; 094
	const PSYWAVE      ; 095
	const SPLASH       ; 096
	const ACID_ARMOR   ; 097
	const CRABHAMMER   ; 098
	const EXPLOSION    ; 099
	const FURY_SWIPES  ; 09a
	const BONEMERANG   ; 09b
	const REST         ; 09c
	const ROCK_SLIDE   ; 09d
	const HYPER_FANG   ; 09e
	const SHARPEN      ; 09f
	const CONVERSION   ; 0a0
	const TRI_ATTACK   ; 0a1
	const SUPER_FANG   ; 0a2
	const SLASH        ; 0a3
	const SUBSTITUTE   ; 0a4
	const STRUGGLE     ; 0a5
DEF GEN1_MOVES EQU const_value - 1
	const SKETCH       ; 0a6
	const TRIPLE_KICK  ; 0a7
	const THIEF        ; 0a8
	const SPIDER_WEB   ; 0a9
	const MIND_READER  ; 0aa
	const NIGHTMARE    ; 0ab
	const FLAME_WHEEL  ; 0ac
	const SNORE        ; 0ad
	const CURSE        ; 0ae
	const FLAIL        ; 0af
	const CONVERSION2  ; 0b0
	const AEROBLAST    ; 0b1
	const COTTON_SPORE ; 0b2
	const REVERSAL     ; 0b3
	const SPITE        ; 0b4
	const POWDER_SNOW  ; 0b5
	const PROTECT      ; 0b6
	const MACH_PUNCH   ; 0b7
	const SCARY_FACE   ; 0b8
	const FAINT_ATTACK ; 0b9
	const SWEET_KISS   ; 0ba
	const BELLY_DRUM   ; 0bb
	const SLUDGE_BOMB  ; 0bc
	const MUD_SLAP     ; 0bd
	const OCTAZOOKA    ; 0be
	const SPIKES       ; 0bf
	const ZAP_CANNON   ; 0c0
	const FORESIGHT    ; 0c1
	const DESTINY_BOND ; 0c2
	const PERISH_SONG  ; 0c3
	const ICY_WIND     ; 0c4
	const DETECT       ; 0c5
	const BONE_RUSH    ; 0c6
	const LOCK_ON      ; 0c7
	const OUTRAGE      ; 0c8
	const SANDSTORM    ; 0c9
	const GIGA_DRAIN   ; 0ca
	const ENDURE       ; 0cb
	const CHARM        ; 0cc
	const ROLLOUT      ; 0cd
	const FALSE_SWIPE  ; 0ce
	const SWAGGER      ; 0cf
	const MILK_DRINK   ; 0d0
	const SPARK        ; 0d1
	const FURY_CUTTER  ; 0d2
	const STEEL_WING   ; 0d3
	const MEAN_LOOK    ; 0d4
	const ATTRACT      ; 0d5
	const SLEEP_TALK   ; 0d6
	const HEAL_BELL    ; 0d7
	const RETURN       ; 0d8
	const PRESENT      ; 0d9
	const FRUSTRATION  ; 0da
	const SAFEGUARD    ; 0db
	const PAIN_SPLIT   ; 0dc
	const SACRED_FIRE  ; 0dd
	const MAGNITUDE    ; 0de
	const DYNAMICPUNCH ; 0df
	const MEGAHORN     ; 0e0
	const DRAGONBREATH ; 0e1
	const BATON_PASS   ; 0e2
	const ENCORE       ; 0e3
	const PURSUIT      ; 0e4
	const RAPID_SPIN   ; 0e5
	const SWEET_SCENT  ; 0e6
	const IRON_TAIL    ; 0e7
	const METAL_CLAW   ; 0e8
	const VITAL_THROW  ; 0e9
	const MORNING_SUN  ; 0ea
	const SYNTHESIS    ; 0eb
	const MOONLIGHT    ; 0ec
	const HIDDEN_POWER ; 0ed
	const CROSS_CHOP   ; 0ee
	const TWISTER      ; 0ef
	const RAIN_DANCE   ; 0f0
	const SUNNY_DAY    ; 0f1
	const CRUNCH       ; 0f2
	const MIRROR_COAT  ; 0f3
	const PSYCH_UP     ; 0f4
	const EXTREMESPEED ; 0f5
	const ANCIENTPOWER ; 0f6
	const SHADOW_BALL  ; 0f7
	const FUTURE_SIGHT ; 0f8
	const ROCK_SMASH   ; 0f9
	const WHIRLPOOL    ; 0fa
	const BEAT_UP      ; 0fb
DEF GEN2_MOVES EQU const_value - 1
	const FAKE_OUT     ; 0fc
	const UPROAR       ; 0fd
	const STOCKPILE    ; 0fe
	const SPIT_UP      ; 0ff
	const SWALLOW      ; 100
	const HEAT_WAVE    ; 101
	const HAIL         ; 102
	const TORMENT      ; 103
	const FLATTER      ; 104
	const WILL_O_WISP  ; 105
	const MEMENTO      ; 106
	const FACADE       ; 107
	const FOCUS_PUNCH  ; 108
	const NATURE_POWER ; 109
	const CHARGE       ; 10a
	const TAUNT        ; 10b
	const TRICK        ; 10c
	const WISH         ; 10d
	const INGRAIN      ; 10e
	const SUPERPOWER   ; 10f
	const MAGIC_COAT   ; 110
	const RECYCLE      ; 111
	const REVENGE      ; 112
	const BRICK_BREAK  ; 113
	const YAWN         ; 114
	const KNOCK_OFF    ; 115
	const ENDEAVOR     ; 116
	const ERUPTION     ; 117
	const SKILL_SWAP   ; 118
	const REFRESH      ; 119
	const GRUDGE       ; 11a
	const SECRET_POWER ; 11b
	const DIVE         ; 11c
	const CAMOUFLAGE   ; 11d
	const LUSTER_PURGE ; 11e
	const MIST_BALL    ; 11f
	const FEATHERDANCE ; 120
	const TEETER_DANCE ; 121
	const BLAZE_KICK   ; 122
	const ICE_BALL     ; 123
	const NEEDLE_ARM   ; 124
	const SLACK_OFF    ; 125
	const HYPER_VOICE  ; 126
	const POISON_FANG  ; 127
	const CRUSH_CLAW   ; 128
	const BLAST_BURN   ; 129
	const HYDRO_CANNON ; 12a
	const METEOR_MASH  ; 12b
	const ASTONISH     ; 12c
	const WEATHER_BALL ; 12d
	const AROMATHERAPY ; 12e
	const FAKE_TEARS   ; 12f
	const AIR_CUTTER   ; 130
	const OVERHEAT     ; 131
	const ROCK_TOMB    ; 132
	const SILVER_WIND  ; 133
	const METAL_SOUND  ; 134
	const GRASSWHISTLE ; 135
	const TICKLE       ; 136
	const COSMIC_POWER ; 137
	const WATER_SPOUT  ; 138
	const SIGNAL_BEAM  ; 139
	const SHADOW_PUNCH ; 13a
	const EXTRASENSORY ; 13b
	const SKY_UPPERCUT ; 13c
	const SAND_TOMB    ; 13d
	const SHEER_COLD   ; 13e
	const MUDDY_WATER  ; 13f
	const BULLET_SEED  ; 140
	const AERIAL_ACE   ; 141
	const IRON_DEFENSE ; 142
	const BLOCK        ; 143
	const HOWL         ; 144
	const DRAGON_CLAW  ; 145
	const FRENZY_PLANT ; 146
	const BULK_UP      ; 147
	const BOUNCE       ; 148
	const MUD_SHOT     ; 149
	const POISON_TAIL  ; 14a
	const COVET        ; 14b
	const VOLT_TACKLE  ; 14c
	const MAGICAL_LEAF ; 14d
	const CALM_MIND    ; 14e
	const LEAF_BLADE   ; 14f
	const DRAGON_DANCE ; 150
	const ROCK_BLAST   ; 151
	const SHOCK_WAVE   ; 152
	const WATER_PULSE  ; 153
	const PSYCHO_BOOST ; 154
	const ROOST        ; 155
	const MIRACLE_EYE  ; 156
	const WAKE_UP_SLAP ; 157
	const HAMMER_ARM   ; 158
	const GYRO_BALL    ; 159
	const HEALING_WISH ; 15a
	const BRINE        ; 15b
	const NATURAL_GIFT ; 15c
	const FEINT        ; 15d
	const PLUCK        ; 15e
	const TAILWIND     ; 15f
	const ACUPRESSURE  ; 160
	const METAL_BURST  ; 161
	const U_TURN       ; 162
	const CLOSE_COMBAT ; 163
	const PAYBACK      ; 164
	const ASSURANCE    ; 165
	const EMBARGO      ; 166
	const FLING        ; 167
	const PSYCHO_SHIFT ; 168
	const TRUMP_CARD   ; 169
	const WRING_OUT    ; 16a
	const GASTRO_ACID  ; 16b
	const LUCKY_CHANT  ; 16c
	const COPYCAT      ; 16d
	const PUNISHMENT   ; 16e
	const LAST_RESORT  ; 16f
	const WORRY_SEED   ; 170
	const SUCKER_PUNCH ; 171
	const TOXIC_SPIKES ; 172
	const AQUA_RING    ; 173
	const MAGNET_RISE  ; 174
DEF MOVES_GP3 EQU const_value - 1
	const FLARE_BLITZ  ; 175
	const FORCE_PALM   ; 176
	const ROCK_POLISH  ; 177
	const POISON_JAB   ; 178
	const DARK_PULSE   ; 179
	const NIGHT_SLASH  ; 17a
	const AQUA_TAIL    ; 17b
	const SEED_BOMB    ; 17c
	const AIR_SLASH    ; 17d
	const X_SCISSOR    ; 17e
	const BUG_BUZZ     ; 17f
	const DRAGON_PULSE ; 180
	const DRAGON_RUSH  ; 181
	const POWER_GEM    ; 182
	const DRAIN_PUNCH  ; 183
	const VACUUM_WAVE  ; 184
	const ENERGY_BALL  ; 185
	const BRAVE_BIRD   ; 186
	const EARTH_POWER  ; 187
	const SWITCHEROO   ; 188
	const GIGA_IMPACT  ; 189
	const NASTY_PLOT   ; 18a
	const BULLET_PUNCH ; 18b
	const ICE_SHARD    ; 18c
	const SHADOW_CLAW  ; 18d
	const THUNDER_FANG ; 18e
	const ICE_FANG     ; 18f
	const FIRE_FANG    ; 190
	const SHADOW_SNEAK ; 191
	const MUD_BOMB     ; 192
	const PSYCHO_CUT   ; 193
	const ZEN_HEADBUTT ; 194
	const MIRROR_SHOT  ; 195
	const FLASH_CANNON ; 196
	const TRICK_ROOM   ; 197
	const DRACO_METEOR ; 198
	const DISCHARGE    ; 199
	const LAVA_PLUME   ; 19a
	const LEAF_STORM   ; 19b
	const POWER_WHIP   ; 19c
	const CROSS_POISON ; 19d
	const GUNK_SHOT    ; 19e
	const IRON_HEAD    ; 19f
	const MAGNET_BOMB  ; 1a0
	const STONE_EDGE   ; 1a1
	const CAPTIVATE    ; 1a2
	const STEALTH_ROCK ; 1a3
	const BUG_BITE     ; 1a4
	const CHARGE_BEAM  ; 1a5
	const WOOD_HAMMER  ; 1a6
	const AQUA_JET     ; 1a7
	const ATTACK_ORDER ; 1a8
	const DEFEND_ORDER ; 1a9
	const HEAL_ORDER   ; 1aa
	const DOUBLE_HIT   ; 1ab
	const HONE_CLAWS   ; 1ac
	const PSYSHOCK     ; 1ad
	const VENOSHOCK    ; 1ae
	const SLUDGE_WAVE  ; 1af
	const QUIVER_DANCE ; 1b0
	const FLAME_CHARGE ; 1b1
	const ENTRAINMENT  ; 1b2
	const STORED_POWER ; 1b3
	const SHELL_SMASH  ; 1b4
	const HEAL_PULSE   ; 1b5
	const HEX          ; 1b6
	const CIRCLE_THROW ; 1b7
	const ACROBATICS   ; 1b8
	const RETALIATE    ; 1b9
	const WORK_UP      ; 1ba
	const ELECTROWEB   ; 1bb
	const HURRICANE    ; 1bc
	const FLYING_PRESS ; 1bd
	const BELCH        ; 1be
	const STICKY_WEB   ; 1bf
	const FELL_STINGER ; 1c0
	const NOBLE_ROAR   ; 1c1
	const PETAL_STORM  ; 1c2
	const CHARM_VOICE  ; 1c3
	const PARTING_SHOT ; 1c4
	const DRAININGKISS ; 1c5
	const PLAY_ROUGH   ; 1c6
	const FAIRY_WIND   ; 1c7
	const MOONBLAST    ; 1c8
	const BOOMBURST    ; 1c9
	const MAGIC_GLEAM  ; 1ca
	const NUZZLE       ; 1cb
	const MAKE_IT_RAIN ; 1cc
	const SHED_TAIL    ; 1cd
	const HYPER_DRILL  ; 1ce
	const TWIN_BEAM    ; 1cf
	const RAGE_FIST    ; 1d0
	const GIGA_HAMMER  ; 1d1
	const BLOOD_MOON   ; 1d2
	const NO_RETREAT   ; 1d3
	const BARRIER_BASH ; 1d4
	const LIBRA        ; 1d5
	const INCINERATE   ; 1d6
DEF MOVES_GP4 EQU const_value - 1
DEF NUM_ATTACKS EQU const_value - 1
	const TRAILBLAZE   ; 1d6

	if NUM_ATTACKS > $3fff
		fail "Too many moves defined!"
	endc

; Battle animations use the same constants as the moves
DEF ANIM_SWEET_SCENT_2 EQU $FC
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
