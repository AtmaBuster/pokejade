; significant level values
DEF MAX_LEVEL EQU 100
DEF MIN_LEVEL EQU 2
DEF EGG_LEVEL EQU 5

; maximum moves known per mon
DEF NUM_MOVES EQU 4

; significant stat values
DEF BASE_STAT_LEVEL EQU 7
DEF MAX_STAT_LEVEL EQU 13

; turns that sleep lasts
DEF REST_SLEEP_TURNS EQU 2
DEF TREEMON_SLEEP_TURNS EQU 7

; default move priority
DEF BASE_PRIORITY EQU 1

; type effectiveness factors, scaled by 10
DEF SUPER_EFFECTIVE    EQU 20
DEF MORE_EFFECTIVE     EQU 15
DEF EFFECTIVE          EQU 10
DEF NOT_VERY_EFFECTIVE EQU 05
DEF NO_EFFECT          EQU 00

; enemy AI behavior
DEF BASE_AI_SWITCH_SCORE EQU 10

; wPlayerStatLevels and wEnemyStatLevels indexes (see wram.asm)
; GetStatName arguments (see data/battle/stat_names.asm)
	const_def
	const ATTACK
	const DEFENSE
	const SPEED
	const SP_ATTACK
	const SP_DEFENSE
	const ACCURACY
	const EVASION
	const ABILITY ; used for BattleCommand_Curse
DEF NUM_LEVEL_STATS EQU const_value

; move struct members (see data/moves/moves.asm)
rsreset
DEF MOVE_ANIM   rb ; 0
DEF MOVE_EFFECT rb ; 1
DEF MOVE_POWER  rb ; 2
DEF MOVE_TYPE   rb ; 3
DEF MOVE_ACC    rb ; 4
DEF MOVE_PP     rb ; 5
DEF MOVE_CHANCE rb ; 6
DEF MOVE_FLAGS  rb ; 7
DEF MOVE_LENGTH EQU _RS

; move flags
	const_def
	fconst MOVE_CONTACT
	fconst MOVE_SOUND
	fconst MOVE_PUNCH
	fconst MOVE_AURA
	fconst MOVE_BITING
	fconst MOVE_SLICING
	fconst MOVE_BOMB
	fconst MOVE_WIND

; stat constants
; indexes for:
; - wPlayerStats and wEnemyStats (see wram.asm)
; - party_struct and battle_struct members (see macros/ram.asm)
	const_def 1
	const STAT_HP
	const STAT_ATK
	const STAT_DEF
	const STAT_SPD
	const STAT_SATK
DEF NUM_EXP_STATS EQU const_value - 1
	const STAT_SDEF
DEF NUM_STATS EQU const_value - 1
DEF NUM_BATTLE_STATS EQU NUM_STATS - 1 ; don't count HP

; stat formula constants
DEF STAT_MIN_NORMAL EQU 5
DEF STAT_MIN_HP EQU 10

; FarChangeStat arguments (see engine/battle/stats.asm)
	const_def
	const STAT_TARGET_F
	const STAT_LOWER_F
	const STAT_MISS_F
	const STAT_SECONDARY_F
	const STAT_SILENT_F
	const STAT_SKIPTEXT_F

DEF STAT_TARGET    EQU 1 << STAT_TARGET_F
DEF STAT_LOWER     EQU 1 << STAT_LOWER_F
DEF STAT_MISS      EQU 1 << STAT_MISS_F
DEF STAT_SECONDARY EQU 1 << STAT_SECONDARY_F
DEF STAT_SILENT    EQU 1 << STAT_SILENT_F
DEF STAT_SKIPTEXT  EQU 1 << STAT_SKIPTEXT_F

DEF MAX_STAT_VALUE EQU 999

; shiny dvs
DEF ATKDEFDV_SHINY EQU $EA
DEF SPDSPCDV_SHINY EQU $AA

; battle classes (wBattleMode values)
	const_def 1
	const WILD_BATTLE
	const TRAINER_BATTLE

; battle types (wBattleType values)
	const_def
	const BATTLETYPE_NORMAL
	const BATTLETYPE_CANLOSE
	const BATTLETYPE_DEBUG
	const BATTLETYPE_TUTORIAL
	const BATTLETYPE_FISH
	const BATTLETYPE_ROAMING
	const BATTLETYPE_CONTEST
	const BATTLETYPE_FORCESHINY
	const BATTLETYPE_TREE
	const BATTLETYPE_TRAP
	const BATTLETYPE_FORCEITEM
	const BATTLETYPE_CELEBI
	const BATTLETYPE_SUICUNE

; BattleVarPairs indexes (see home/battle_vars.asm)
	const_def
	const BATTLE_VARS_SUBSTATUS1
	const BATTLE_VARS_SUBSTATUS2
	const BATTLE_VARS_SUBSTATUS3
	const BATTLE_VARS_SUBSTATUS4
	const BATTLE_VARS_SUBSTATUS5
	const BATTLE_VARS_SUBSTATUS6
	const BATTLE_VARS_SUBSTATUS1_OPP
	const BATTLE_VARS_SUBSTATUS2_OPP
	const BATTLE_VARS_SUBSTATUS3_OPP
	const BATTLE_VARS_SUBSTATUS4_OPP
	const BATTLE_VARS_SUBSTATUS5_OPP
	const BATTLE_VARS_SUBSTATUS6_OPP
	const BATTLE_VARS_STATUS
	const BATTLE_VARS_STATUS_OPP
	const BATTLE_VARS_MOVE_ANIM
	const BATTLE_VARS_MOVE_EFFECT
	const BATTLE_VARS_MOVE_POWER
	const BATTLE_VARS_MOVE_TYPE
	const BATTLE_VARS_MOVE
	const BATTLE_VARS_LAST_COUNTER_MOVE
	const BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	const BATTLE_VARS_LAST_MOVE
	const BATTLE_VARS_LAST_MOVE_OPP
	const BATTLE_VARS_MOVE_FLAGS
DEF NUM_BATTLE_VARS EQU const_value

; BattleVarLocations indexes (see home/battle_vars.asm)
	const_def
	const PLAYER_SUBSTATUS_1
	const ENEMY_SUBSTATUS_1
	const PLAYER_SUBSTATUS_2
	const ENEMY_SUBSTATUS_2
	const PLAYER_SUBSTATUS_3
	const ENEMY_SUBSTATUS_3
	const PLAYER_SUBSTATUS_4
	const ENEMY_SUBSTATUS_4
	const PLAYER_SUBSTATUS_5
	const ENEMY_SUBSTATUS_5
	const PLAYER_SUBSTATUS_6
	const ENEMY_SUBSTATUS_6
	const PLAYER_STATUS
	const ENEMY_STATUS
	const PLAYER_MOVE_ANIMATION
	const ENEMY_MOVE_ANIMATION
	const PLAYER_MOVE_EFFECT
	const ENEMY_MOVE_EFFECT
	const PLAYER_MOVE_POWER
	const ENEMY_MOVE_POWER
	const PLAYER_MOVE_TYPE
	const ENEMY_MOVE_TYPE
	const PLAYER_CUR_MOVE
	const ENEMY_CUR_MOVE
	const PLAYER_COUNTER_MOVE
	const ENEMY_COUNTER_MOVE
	const PLAYER_LAST_MOVE
	const ENEMY_LAST_MOVE
	const PLAYER_MOVE_FLAGS
	const ENEMY_MOVE_FLAGS
assert const_value % 2 == 0
DEF NUM_BATTLE_VAR_LOCATION_PAIRS EQU const_value / 2

; status condition bit flags
DEF SLP_MASK EQU %111 ; 0-7 turns
	const_def 3
	const PSN
	const BRN
	const FRZ
	const PAR

DEF ALL_STATUS EQU (1 << PSN) | (1 << BRN) | (1 << FRZ) | (1 << PAR) | SLP_MASK

; wPlayerSubStatus1 or wEnemySubStatus1 bit flags
	const_def
	const SUBSTATUS_NIGHTMARE
	const SUBSTATUS_CURSE
	const SUBSTATUS_PROTECT
	const SUBSTATUS_IDENTIFIED
	const SUBSTATUS_PERISH
	const SUBSTATUS_ENDURE
	const SUBSTATUS_ROLLOUT
	const SUBSTATUS_IN_LOVE

; wPlayerSubStatus2 or wEnemySubStatus2 bit flags
	const_def
	const SUBSTATUS_CURLED
	const SUBSTATUS_GASTRO_ACID
	const SUBSTATUS_INGRAIN
	const SUBSTATUS_ROOST
	const SUBSTATUS_FLINCHED
	const SUBSTATUS_TOOK_DAMAGE

; wPlayerSubStatus3 or wEnemySubStatus3 bit flags
	const_def
	const SUBSTATUS_BIDE
	const SUBSTATUS_RAMPAGE
	const SUBSTATUS_IN_LOOP
	const SUBSTATUS_DIVING
	const SUBSTATUS_CHARGED
	const SUBSTATUS_UNDERGROUND
	const SUBSTATUS_FLYING
	const SUBSTATUS_CONFUSED

; wPlayerSubStatus4 or wEnemySubStatus4 bit flags
	const_def
	const SUBSTATUS_X_ACCURACY
	const SUBSTATUS_MIST
	const SUBSTATUS_FOCUS_ENERGY
	const SUBSTATUS_FOCUS_PUNCH
	const SUBSTATUS_SUBSTITUTE
	const SUBSTATUS_RECHARGE
	const SUBSTATUS_RAGE
	const SUBSTATUS_LEECH_SEED

; wPlayerSubStatus5 or wEnemySubStatus5 bit flags
	const_def
	const SUBSTATUS_TOXIC
	const_skip
	const_skip
	const SUBSTATUS_TRANSFORMED
	const SUBSTATUS_ENCORED
	const SUBSTATUS_LOCK_ON
	const SUBSTATUS_DESTINY_BOND
	const SUBSTATUS_CANT_RUN

; wPlayerSubStatus6 or wEnemySubStatus6 bit flags
	const_def
	const SUBSTATUS_YAWNED
	const_skip ; reserved for yawn
	const_skip
	const_skip
	const_skip
	const_skip
	const_skip
	const_skip

; wPlayerScreens or wEnemyScreens bit flags
	const_def
	const SCREENS_SPIKES
	const_skip ; spikes 2
	const SCREENS_SAFEGUARD
	const SCREENS_LIGHT_SCREEN
	const SCREENS_REFLECT
	const SCREENS_STEALTH_ROCK
	const SCREENS_TOXIC_SPIKES
	const_skip ; toxic spikes 2

	const_def
	const SCREENS_SPIKES_0
	const SCREENS_SPIKES_1
	const SCREENS_SPIKES_2
	const SCREENS_SPIKES_3

	const_def 0, $40
	const SCREENS_TOXIC_SPIKES_0
	const SCREENS_TOXIC_SPIKES_1
	const SCREENS_TOXIC_SPIKES_2
DEF SCREENS_SPIKES_MASK       EQU %00_0000_11
DEF SCREENS_TOXIC_SPIKES_MASK EQU %11_0000_00

; values in wBattleWeather
	const_def
	const WEATHER_NONE
	const WEATHER_RAIN
	const WEATHER_SUN
	const WEATHER_SANDSTORM
	const WEATHER_HAIL
	const WEATHER_RAIN_END
	const WEATHER_SUN_END
	const WEATHER_SANDSTORM_END
	const WEATHER_HAIL_END

; wBattleAction
	const_def
	const BATTLEACTION_MOVE1
	const BATTLEACTION_MOVE2
	const BATTLEACTION_MOVE3
	const BATTLEACTION_MOVE4
	const BATTLEACTION_SWITCH1
	const BATTLEACTION_SWITCH2
	const BATTLEACTION_SWITCH3
	const BATTLEACTION_SWITCH4
	const BATTLEACTION_SWITCH5
	const BATTLEACTION_SWITCH6
	const_skip
	const_skip
	const_skip
	const BATTLEACTION_SKIPTURN
	const BATTLEACTION_STRUGGLE
	const BATTLEACTION_FORFEIT

; wBattlePlayerAction
	const_def
	const BATTLEPLAYERACTION_USEMOVE
	const BATTLEPLAYERACTION_USEITEM
	const BATTLEPLAYERACTION_SWITCH

; wBattleResult
	const_def
	const WIN
	const LOSE
	const DRAW

DEF BATTLERESULT_CAUGHT_CELEBI EQU 6
DEF BATTLERESULT_BOX_FULL EQU 7
DEF BATTLERESULT_BITMASK EQU (1 << BATTLERESULT_CAUGHT_CELEBI) | (1 << BATTLERESULT_BOX_FULL)

; link_battle_record struct
DEF LINK_BATTLE_RECORD_LENGTH EQU 2 + (NAME_LENGTH - 1) + 2 * 3
DEF NUM_LINK_BATTLE_RECORDS EQU 5

; wPlayerCastform or wEnemyCastform
	const_def
	const FORM_NONE
	const FORM_SUNNY
	const FORM_RAINY
	const FORM_SNOWY
