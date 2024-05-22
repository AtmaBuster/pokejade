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
	jmp z, GetPlayerAbility
	jmp GetEnemyAbility

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
	ld hl, TempPlayerAbilityText
	jp StdBattleTextbox

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
	ld hl, TempPlayerAbilityText
	jp StdBattleTextbox

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
	jp StdBattleTextbox

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
	jp StdBattleTextbox

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
	jp StdBattleTextbox

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
