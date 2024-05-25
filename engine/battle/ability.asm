MarvelScaleCheck:
; check ablility
	push bc
	ld bc, -20 ; careful
	add hl, bc
	pop bc
	ld a, [hl]
	cp MARVEL_SCALE
	ret nz
; check stats
	push bc
	ld bc, 11 ; careful 2
	add hl, bc
	pop bc
	ld a, [hl]
	and a
	ret z
; defense *= 1.5
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld b, h
	ld c, l
	ret

GutsToxicBoostCheck:
	cp GUTS
	jr z, .guts
	cp TOXIC_BOOST
	ret nz
;toxic_boost
	bit PSN, e
	jr nz, .mul
	ret

.guts
	ld a, e
	and a
	ret z
.mul
	push bc
	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc
	pop bc
	ret

GetPlayerAbility:
; if a is zero, ignore ability-cancelling effects
	and a
	ld a, [wBattleMonAbility]
	ret z
	ld b, a
	ld a, [wPlayerSubStatus2]
	and 1 << SUBSTATUS_GASTRO_ACID
	ld a, 0 ; no-optimize a = 0
	ret nz
	ld a, b
	ret

GetEnemyAbility:
; if a is zero, ignore ability-cancelling effects
	and a
	ld a, [wEnemyMonAbility]
	ret z
	ld b, a
	ld a, [wEnemySubStatus2]
	and 1 << SUBSTATUS_GASTRO_ACID
	ld a, 0 ; no-optimize a = 0
	ret nz
	ld a, b
	ret

SetUserAbility:
	push af
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	pop af
	ld [wEnemyMonAbility], a
	ret

.player
	pop af
	ld [wBattleMonAbility], a
	ret

SetOpponentAbility:
	push af
	call SwitchTurn
	pop af
	push af
	call SetUserAbility
	call SwitchTurn
	pop af
	ret

GetTrueUserAbility:
	ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonAbility]
	ret z
	ld a, [wEnemyMonAbility]
	ret

GetTrueOppnentAbility:
	call SwitchTurn
	call GetTrueUserAbility
	push af
	call SwitchTurn
	pop af
	ret

GetUserAbility: ; TO-DO : check for Gastro Acid
	ldh a, [hBattleTurn]
	and a
	ld a, 1
	jr z, GetPlayerAbility
	jr GetEnemyAbility

GetOpponentAbility:
	call GetUserAbility
	sub MOLD_BREAKER
	ret z
	call SwitchTurn
	call GetUserAbility
	push af
	call SwitchTurn
	pop af
	ret

AnimateUserAbility:
	ldh a, [hBattleTurn]
	and a
	jr z, AnimatePlayerAbility
	jr AnimateEnemyAbility

AnimateOppAbility:
	ldh a, [hBattleTurn]
	and a
	jr z, AnimateEnemyAbility
AnimatePlayerAbility:
	ldh a, [hBattleTurn]
	and a
	jr z, .Animate
	call SwitchTurn
	call .Animate
	jmp SwitchTurn
.Animate
	xor a
	call GetPlayerAbility
	call GetAbilityName
	ld d, 55
	jr AnimateAbility

AnimateEnemyAbility:
	ldh a, [hBattleTurn]
	and a
	jr nz, .Animate
	call SwitchTurn
	call .Animate
	jmp SwitchTurn
.Animate
	xor a
	call GetEnemyAbility
	call GetAbilityName
	ld d, 19
; fallthrough
AnimateAbility:
	push de
	ld hl, wStringBuffer1
	ld de, wStringBufferBattle
	ld bc, STRING_BUFFER_LENGTH
	rst CopyBytes
	pop de
	ld a, d
	add 40
	ld e, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call .SetupBox

	call .SetupWindow
	ld hl, rIE
	set LCD_STAT, [hl]

	ld a, LOW(rWX)
	ldh [hLCDCPointer], a
	xor a
	ldh [hWY], a
	ld a, $A7
	ldh [hWX], a

	call .SlideIn
	ld c, 60
	call DelayFrames
	call .SlideOut

	ld hl, rIE
	res LCD_STAT, [hl]
	ld a, 7
	ldh [hWX], a
	ld a, 144
	ldh [hWY], a
	xor a
	ldh [hLCDCPointer], a
	ld hl, wTilemap5RowBackup
	ld de, wTilemap
	ld bc, SCREEN_WIDTH * 5
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	ret

.SetupBox:
	push de
; backup top 5 rows of wTilemap
	ld hl, wTilemap
	ld de, wTilemap5RowBackup
	ld bc, SCREEN_WIDTH * 5
	rst CopyBytes
; place box
	hlcoord 0, 0
	lb bc, 3, 12
	call Textbox
; copy mon name
	ldh a, [hBattleTurn]
	and a
	ld de, wBattleMonNickname
	jr z, .got_name
	ld de, wEnemyMonNickname
.got_name
	hlcoord 1, 1
	call PlaceString
	ld a, "'s"
	ld [bc], a
; copy ability name
	ld de, wStringBufferBattle
	hlcoord 1, 3
	call PlaceString

	ld a, 3
	ldh [hBGMapMode], a
	call UpdateBGMap

	pop de
	ret

.SetupWindow:
	ld hl, wLYOverrides
	ld a, $A7
	ld bc, SCREEN_HEIGHT_PX
	jmp ByteFill

.SlideIn:
	call DelayFrame
	ld c, 14
.SlideIn_Loop:
	ldh a, [rLY]
	cp $60
	jr nz, .SlideIn_Loop

	ld l, d ; LOW(wLYOverrides) = 0
	ld h, HIGH(wLYOverrides)
	ld a, e
	sub d
	ld b, a
.SlideIn_Loop2:
	ld a, [hl]
	sub 8
	ld [hli], a
	dec b
	jr nz, .SlideIn_Loop2

	call DelayFrame
	dec c
	jr nz, .SlideIn_Loop
	ret

.SlideOut:
	call DelayFrame
	ld c, 14
.SlideOut_Loop:
	ldh a, [rLY]
	cp $60
	jr nz, .SlideOut_Loop

	ld l, d ; LOW(wLYOverrides) = 0
	ld h, HIGH(wLYOverrides)
	ld a, e
	sub d
	ld b, a
.SlideOut_Loop2:
	ld a, [hl]
	add 8
	ld [hli], a
	dec b
	jr nz, .SlideOut_Loop2

	call DelayFrame
	dec c
	jr nz, .SlideOut_Loop
	ret

ActivateSwitchInAbilities:
	call GetUserAbility
	ld hl, .JumpList
	ld b, a
.loop
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr z, .jump
	inc hl
	inc hl
	jr .loop

.jump
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.JumpList:
	dbw TRACE, SwitchIn_Trace
	dbw DRIZZLE, SwitchIn_Drizzle
	dbw DROUGHT, SwitchIn_Drought
	dbw SAND_STREAM, SwitchIn_SandStream
	dbw IMPOSTER, SwitchIn_Imposter
	dbw INTIMIDATE, SwitchIn_Intimidate
	dbw DOWNLOAD, SwitchIn_Download
	dbw ANTICIPATION, SwitchIn_Anticipation
	db -1

SwitchIn_Trace:
	call GetTrueOppnentAbility
	cp TRACE
	ret z
	cp IMPOSTER ; Can't Trace Imposter
	ret z
	cp DISGUISE ; Can't Trace Disguise
	ret z
	cp FORECAST ; Can't Trace Forecast
	ret z
	push af
	call AnimateUserAbility
	pop af
	call SetUserAbility
	call GetAbilityName
	ld hl, TraceText
	call StdBattleTextbox
	jp ActivateSwitchInAbilities ; reactivate new ability if applicable

SwitchIn_Drizzle:
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret z
	call AnimateUserAbility
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, RAIN_DANCE
	farcall PlayFXAnimID
	ld hl, DownpourText
	call StdBattleTextbox
	farjp UpdateCastform

SwitchIn_Drought:
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	call AnimateUserAbility
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, SUNNY_DAY
	farcall PlayFXAnimID
	ld hl, SunGotBrightText
	call StdBattleTextbox
	farjp UpdateCastform

SwitchIn_SandStream:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	ret z
	call AnimateUserAbility
	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, SANDSTORM
	farcall PlayFXAnimID
	ld hl, SandstormBrewedText
	call StdBattleTextbox
	farjp UpdateCastform

SwitchIn_SnowWarning:
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ret z
	call AnimateUserAbility
	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, HAIL
	farcall PlayFXAnimID
	ld hl, ItStartedToHailText
	call StdBattleTextbox
	farjp UpdateCastform

SwitchIn_Imposter: ; TO-DO
	ret
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	ret nz
	xor a
	ld [wNumHits], a
	ld a, $1
	ld [wBattleAnimParam], a

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_TRANSFORMED, [hl]
	call ResetActorDisable
	ld hl, wBattleMonSpecies
	ld de, wEnemyMonSpecies
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_mon_species
	ld hl, wEnemyMonSpecies
	ld de, wBattleMonSpecies
	xor a
	ld [wCurMoveNum], a
.got_mon_species

	ret

SwitchIn_Intimidate:
	call AnimateUserAbility
	call GetOpponentAbility
	cp OBLIVIOUS
	jr z, .fail
	cp OWN_TEMPO
	jr z, .fail
	cp INNER_FOCUS
	jr z, .fail
	cp SCRAPPY
	jr z, .fail
	ld b, ATTACK
	ld a, STAT_TARGET | STAT_LOWER
	farjp FarChangeStat

.fail
	push af
	call AnimateOppAbility
	pop af
	call GetAbilityName
	ld hl, ProtectedFromIntimidateText
	jp StdBattleTextbox

SwitchIn_Download:
	call AnimateUserAbility
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonDefense
	jr z, .got_stat
	ld hl, wBattleMonDefense
.got_stat
	ld a, [hli]
	cpl
	ld b, a
	ld a, [hli]
	cpl
	ld c, a
	inc bc
	; bc = -def
	ld de, 4
	add hl, de
	ld a, [hli]
	ld l, [hl]
	ld h, a
	; hl = sp.def
	add hl, bc
	; hl = sp.def - def
	ld b, ATTACK
	jr c, .got_change_stat
	ld b, SP_ATTACK
.got_change_stat
	xor a
	farjp FarChangeStat

SwitchIn_Anticipation:
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonMoves
	ld de, wBattleMonType
	jr z, .got_move_list
	ld hl, wBattleMonMoves
	ld de, wEnemyMonType
.got_move_list
	ld c, 0
.loop
	ld a, [hli]
	and a
	ret z
	push bc
	ld [wCurSpecies], a
	ld [wNamedObjectIndex], a
	push hl
	push de
	ld de, wTempMoveStruct
	call GetMoveData
	ld a, [wTempMoveStructEffect]
	cp EFFECT_SELFDESTRUCT
	jr z, .success
	cp EFFECT_OHKO
	jr z, .success
	ld a, [wTempMoveStructType]
	and STATUS
	cp STATUS
	jr z, .skip_type_matchup
	ld a, [wTempMoveStructType]
	and TYPE_MASK

	pop de
	push de
	ld h, d
	ld l, e
	farcall CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1 ; 1.0 + 0.1
	jr nc, .success
.skip_type_matchup
	pop de
	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret

.success
	pop bc
	pop de
	pop hl
	call AnimateUserAbility
	ld hl, AnticipationText
	jp StdBattleTextbox

DoContactAbilities:
	call GetOpponentAbility
	ld hl, .JumpList
	ld b, a
.loop
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr z, .jump
	inc hl
	inc hl
	jr .loop

.jump
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.JumpList:
	dbw STATIC, Contact_Static
	dbw POISON_POINT, Contact_PoisonPoint
	dbw EFFECT_SPORE, Contact_EffectSpore
	dbw FLAME_BODY, Contact_FlameBody
	db -1

Contact_Static:
	ld b, 1
TryParalyzeOnContact:
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonType
	ld a, [wPlayerScreens]
	jr z, .got_type
	ld hl, wEnemyMonType
	ld a, [wEnemyScreens]
.got_type
; don't affect if protected by safeguard
	bit SCREENS_SAFEGUARD, a
	ret nz
; don't affect ground-types
	ld a, [hli]
	cp GROUND
	ret z
	ld a, [hl]
	cp GROUND
	ret z
; don't paralyze if already have status
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret nz
; don't affect mons w/ Limber
	push bc
	call GetUserAbility
	pop bc
	cp LIMBER
	ret z
; don't affect mons w/ Leaf Guard in sunlight
	cp LEAF_GUARD
	jr nz, .skip_leaf_guard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
.skip_leaf_guard
; if b != 1, skip random check (called from elsewhere)
	dec b
	jr nz, .do_para
; 30% chance
	call BattleRandom
	cp 30 percent
	ret nc
.do_para
; paralyze user
	call AnimateOppAbility
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateUserInParty
	call SwitchTurn
	farcall ApplySpeedModifiers
	call UpdateBattleHuds
	farcall PrintParalyze
	farcall UseHeldStatusHealingItem
	jmp SwitchTurn

Contact_PoisonPoint:
	ld b, 1
TryPoisonOnContact:
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonType
	ld a, [wPlayerScreens]
	jr z, .got_type
	ld hl, wEnemyMonType
	ld a, [wEnemyScreens]
.got_type
; don't affect if protected by safeguard
	bit SCREENS_SAFEGUARD, a
	ret nz
; don't affect poison- or steel-types
	ld a, [hli]
	cp POISON
	ret z
	cp STEEL
	ret z
	ld a, [hl]
	cp POISON
	ret z
	cp STEEL
	ret z
; don't poison if already have status
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret nz
; don't affect mons w/ Immunity
	push bc
	call GetUserAbility
	pop bc
	cp IMMUNITY
	ret z
; don't affect mons w/ Leaf Guard in sunlight
	cp LEAF_GUARD
	jr nz, .skip_leaf_guard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
.skip_leaf_guard
; if b != 1, skip random check (called from elsewhere)
	dec b
	jr nz, .do_poison
; 30% chance
	call BattleRandom
	cp 30 percent
	ret nc
.do_poison
; poison user
	call AnimateOppAbility
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	set PSN, [hl]
	call UpdateUserInParty
	call SwitchTurn
	call UpdateBattleHuds
	ld hl, WasPoisonedText
	call StdBattleTextbox
	farcall UseHeldStatusHealingItem
	jmp SwitchTurn

Contact_EffectSpore:
	ld b, 0
	call BattleRandom
	cp 10 percent
	jp c, TryParalyzeOnContact
	cp 20 percent
	jr c, TryPoisonOnContact
	cp 30 percent
	ret nc
TrySleepOnContact:
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerScreens]
	jr z, .got_type
	ld a, [wEnemyScreens]
.got_type
; don't affect if protected by safeguard
	bit SCREENS_SAFEGUARD, a
	ret nz
; don't sleep if already have status
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret nz
; don't affect mons w/ Insomnia or Vital Spirit
	push bc
	call GetUserAbility
	pop bc
	cp INSOMNIA
	ret z
	cp VITAL_SPIRIT
	ret z
; don't affect mons w/ Leaf Guard in sunlight
	cp LEAF_GUARD
	jr nz, .skip_leaf_guard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
.skip_leaf_guard
; if b != 1, skip random check (called from elsewhere)
	dec b
	jr nz, .do_sleep
; 30% chance
	call BattleRandom
	cp 30 percent
	ret nc
.do_sleep
; sleep user
	call AnimateOppAbility
	call GetUserAbility
	push af
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld b, SLP_MASK
	ld a, [wInBattleTowerBattle]
	and a
	jr z, .random_loop
	ld b, %011
.random_loop
	call BattleRandom
	and b
	jr z, .random_loop
	cp SLP_MASK
	jr z, .random_loop
	inc a
	ld b, a
	pop af
	cp EARLY_BIRD
	jr nz, .got_sleep_timer
	srl b
.got_sleep_timer
	ld [hl], b
	call UpdateUserInParty
	call SwitchTurn
	call UpdateBattleHuds
	ld hl, FellAsleepText
	call StdBattleTextbox
	farcall UseHeldStatusHealingItem
	jmp SwitchTurn

Contact_FlameBody:
	ld b, 1
TryBurnOnContact:
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonType
	ld a, [wPlayerScreens]
	jr z, .got_type
	ld hl, wEnemyMonType
	ld a, [wEnemyScreens]
.got_type
; don't affect if protected by safeguard
	bit SCREENS_SAFEGUARD, a
	ret nz
; don't affect fire-types
	ld a, [hli]
	cp FIRE
	ret z
	ld a, [hl]
	cp FIRE
	ret z
; don't burn if already have status
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret nz
; don't affect mons w/ Water Veil or Water Bubble
	push bc
	call GetUserAbility
	pop bc
	cp WATER_VEIL
	ret z
	cp WATER_BUBBLE
	ret z
; don't affect mons w/ Leaf Guard in sunlight
	cp LEAF_GUARD
	jr nz, .skip_leaf_guard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
.skip_leaf_guard
; if b != 1, skip random check (called from elsewhere)
	dec b
	jr nz, .do_burn
; 30% chance
	call BattleRandom
	cp 30 percent
	ret nc
.do_burn
; burn user
	call AnimateOppAbility
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateUserInParty
	call SwitchTurn
	farcall ApplyBrnEffectOnAttack
	call UpdateBattleHuds
	ld hl, WasBurnedText
	call StdBattleTextbox
	farcall UseHeldStatusHealingItem
	jmp SwitchTurn
