UpdateCastform:
	call SwitchTurn
	call .Update
	call SwitchTurn
.Update:
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpecies
	ld a, [wBattleMonAbility]
	jr z, .got_species
	ld hl, wEnemyMonSpecies
	ld a, [wEnemyMonAbility]
.got_species
	push af
; don't affect any mons other than castform
	ld a, [hl]
	call GetPokemonIndexFromID
; high byte of all forms are the same
	ld a, h
	cp HIGH(CASTFORM)
	jr nz, .not_castform
	ld a, l
	cp LOW(CASTFORM)
	jr z, .castform
; last mons are castform alt forms
	cp LOW(CASTFORM_SUNNY)
	jr nc, .castform
.not_castform
	pop af
	ret

.castform
	pop af
; if it doesn't have forecast, switch to normal form
	cp FORECAST
	ld hl, CASTFORM
	ld b, NORMAL
	jr nz, .set_form
; otherwise, set form according to the weather
	farcall GetBattleWeather
	and a
	jr z, .set_form
	cp WEATHER_SANDSTORM
	jr z, .set_form
	cp WEATHER_RAIN
	ld hl, CASTFORM_RAINY
	ld b, WATER
	jr z, .set_form
	cp WEATHER_SUN
	ld hl, CASTFORM_SUNNY
	ld b, FIRE
	jr z, .set_form
	cp WEATHER_HAIL
	ld hl, CASTFORM_SNOWY
	ld b, ICE
	jr z, .set_form
	ret ; shouldn't get here
.set_form
	ldh a, [hBattleTurn]
	and a
	ld de, wBattleMonSpecies
	ld c, LOW(wBattleMonType) ; HIGH(wBattleMonType) == HIGH(wBattleMonSpecies) == d
	jr z, .got_form
	ld de, wEnemyMonSpecies
	ld c, LOW(wEnemyMonType) ; HIGH(wEnemyMonType) == HIGH(wEnemyMonSpecies) == d
.got_form
; if this is the current form, don't change
	push de
	push hl
	call .CheckSameForm
	pop hl
	pop de
	ret z
; set type
	ld a, b
	ld b, d
	ld [bc], a
	inc bc
	ld [bc], a
; set form
	ldh a, [hBattleTurn]
	and a
	ld bc, wTempBattleMonSpecies
	jr z, .got_temp_species
	ld bc, wTempEnemyMonSpecies
.got_temp_species
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld [de], a
	ld [bc], a
; show ability
	farcall AnimateUserAbility
; play animation
	xor a
	ld [wNumHits], a
	ld hl, ANIM_REFRESH_SPRITE
	call GetMoveIDFromIndex
	farcall LoadAnim
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	jr z, .no_sub
	ld hl, SUBSTITUTE
	call GetMoveIDFromIndex
	farcall LoadAnim
.no_sub
	ld hl, ChangedFormText
	jmp StdBattleTextbox

.CheckSameForm:
	ld a, [de]
	push hl
	call GetPokemonIndexFromID
	pop de
	ld a, h
	cp d
	ret nz
	ld a, l
	cp e
	ret

ApplySpeedModifiers:
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [wBattleMonAbility]
	cp QUICK_FEET
	ret z
	ld a, [wBattleMonStatus]
	and 1 << PAR
	ret z
	ld hl, wBattleMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .player_ok
	ld b, $1 ; min speed

.player_ok
	ld [hl], b
	ret

.enemy
	ld a, [wEnemyMonAbility]
	cp QUICK_FEET
	ret z
	ld a, [wEnemyMonStatus]
	and 1 << PAR
	ret z
	ld hl, wEnemyMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .enemy_ok
	ld b, $1 ; min speed

.enemy_ok
	ld [hl], b
	ret

ApplyBrnEffectOnAttack:
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [wBattleMonAbility]
	cp GUTS
	ret z
	ld a, [wBattleMonStatus]
	and 1 << BRN
	ret z
	ld hl, wBattleMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .player_ok
	ld b, $1 ; min attack

.player_ok
	ld [hl], b
	ret

.enemy
	ld a, [wEnemyMonAbility]
	cp GUTS
	ret z
	ld a, [wEnemyMonStatus]
	and 1 << BRN
	ret z
	ld hl, wEnemyMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .enemy_ok
	ld b, $1 ; min attack

.enemy_ok
	ld [hl], b
	ret

HandleTrickRoom:
	ld hl, wTrickRoomTimer
	ld a, [hl]
	and a
	ret z

	dec [hl]
	ret nz

	ld hl, TrickRoomReturnedText
	jp StdBattleTextbox

CheckUserKnockOff:
	ldh a, [hBattleTurn]
	and a
	jr z, CheckPlayerKnockOff
CheckEnemyKnockOff:
	ld a, [wCurOTMon]
	ld hl, wEnemyKnockOffFlag
	call GetKnockOffFlag
	ret z
	ld bc, 0
	ld hl, wEnemyMonItem
	ret

CheckOpponentKnockOff:
	ldh a, [hBattleTurn]
	and a
	jr z, CheckEnemyKnockOff
CheckPlayerKnockOff:
	ld a, [wCurBattleMon]
	ld hl, wPlayerKnockOffFlag
	call GetKnockOffFlag
	ret z
	ld bc, 0
	ld hl, wBattleMonItem
	ret

GetKnockOffFlag:
; gets bit a of *hl
	ld b, a
	inc b
	xor a
	inc a
.loop
	dec b
	jr z, .done
	rla
	jr .loop
.done
	and [hl]
	ret

SetKnockOffFlag:
	ld b, a
	inc b
	xor a
	inc a
.loop
	dec b
	jr z, .done
	rla
	jr .loop
.done
	or [hl]
	ld [hl], a
	ret

HandleTailwind:
	call SetPlayerTurn
	ld hl, wPlayerTailwindTimer
	call .CheckTimer
	call SetEnemyTurn
	ld hl, wEnemyTailwindTimer
.CheckTimer:
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
	ld hl, TailwindPeteredOutText
	jmp StdBattleTextbox

HandleIngrain:
	call SetPlayerTurn
	call .Check
	call SetEnemyTurn
.Check:
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_INGRAIN, a
	ret z

	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP

.got_hp
; Don't restore if we're already at max HP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	jr nz, .restore
	ld a, [hl]
	cp c
	ret z

.restore
	farcall GetSixteenthMaxHP
	call SwitchTurn
	farcall RestoreHP
	ld hl, AbsorbedNutrientsText
	jmp StdBattleTextbox

HandleRoost:
	call SetPlayerTurn
	call .Check
	call SetEnemyTurn
.Check:
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	bit SUBSTATUS_ROOST, [hl]
	ret z
	res SUBSTATUS_ROOST, [hl]
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonTypeBackup
	ld de, wBattleMonType
	jr z, .got_type
	ld hl, wEnemyMonTypeBackup
	ld de, wEnemyMonType
.got_type
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

HandleRageFist:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurOTMon]
	ld hl, wEnemyRageFistCounter
	jr z, .got_it
	ld a, [wCurBattleMon]
	ld hl, wPlayerRageFistCounter
.got_it
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	inc [hl]
	ret nz
	dec [hl]
	ret

SetDamageFlag:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	set SUBSTATUS_TOOK_DAMAGE, [hl]
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	res SUBSTATUS_FOCUS_PUNCH, [hl]
	ret
