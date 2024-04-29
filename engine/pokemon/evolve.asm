EvolvePokemon:
	ld hl, wEvolvableFlags
	xor a
	ld [hl], a
	ld a, [wCurPartyMon]
	ld c, a
	ld b, SET_FLAG
	call EvoFlagAction
EvolveAfterBattle:
	xor a
	ld [wMonTriedToEvolve], a
	dec a
	ld [wCurPartyMon], a
	push hl
	push bc
	push de
	ld hl, wPartyCount

	push hl

EvolveAfterBattle_MasterLoop:
	ld hl, wCurPartyMon
	inc [hl]

	pop hl

	inc hl
	ld a, [hl]
	cp $ff
	jmp z, .ReturnToMap

	ld [wEvolutionOldSpecies], a

	push hl
	ld a, [wCurPartyMon]
	ld c, a
	ld hl, wEvolvableFlags
	ld b, CHECK_FLAG
	call EvoFlagAction
	ld a, c
	and a
	jr z, EvolveAfterBattle_MasterLoop

	ld a, [wEvolutionOldSpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ldh [hTemp], a

	push hl
	xor a
	ld [wMonType], a
	predef CopyMonToTempMon
	pop hl

.loop
	call GetNextEvoAttackByte
	and a
	jr z, EvolveAfterBattle_MasterLoop

	push af
	call IsMonHoldingEverstone
	jmp z, .everstone_cancel
	pop af

	cp EVOLVE_TRADE
	jr z, .skip_link_disable

	ld c, a
	ld a, [wLinkMode]
	and a
	ld a, c
	jmp nz, .link_mode_cancel

.skip_link_disable
	ld b, 0
	dec c
	ld d, h
	ld e, l

	ld hl, .Jumptable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld bc, .confirm_evo
	push bc
	push hl
	ld h, d
	ld l, e
	ret

.Jumptable:
	dw EvoTest_Level
	dw EvoTest_Item
	dw EvoTest_Trade
	dw EvoTest_Happiness
	dw EvoTest_LevelRand1
	dw EvoTest_LevelRand2
	dw EvoTest_LevelFemale
	dw EvoTest_LevelItem
	dw EvoTest_LevelMove ; TO-DO
	dw EvoTest_LevelItemNite ; TO-DO
	dw EvoTest_LevelWithDark ; TO-DO
	dw EvoTest_LevelAbility ; TO-DO
	dw EvoTest_LevelLandmark ; TO-DO
	dw EvoTest_ItemNite ; TO-DO
	dw EvoTest_ItemBloodMoon ; TO-DO
	dw EvoTest_ItemMale ; TO-DO
	dw EvoTest_ItemFemale ; TO-DO
	dw EvoTest_Sylveon ; TO-DO
	dw EvoTest_Coins

.confirm_evo
	jmp nc, .skip_species_next

IF 0
	ld b, a

	cp EVOLVE_TRADE
	jr z, .trade

	ld a, [wLinkMode]
	and a
	jmp nz, .dont_evolve_check

	ld a, b
	cp EVOLVE_ITEM
	jmp z, .item

	ld a, [wForceEvolution]
	and a
	jmp nz, .dont_evolve_check

	ld a, b
	cp EVOLVE_LEVEL
	jmp z, .level

	cp EVOLVE_HAPPINESS
	jr z, .happiness

; EVOLVE_STAT
	call GetNextEvoAttackByte
	ld c, a
	ld a, [wTempMonLevel]
	cp c
	jmp c, .skip_evolution_species_parameter

	call IsMonHoldingEverstone
	jmp z, .skip_evolution_species_parameter

	push hl
	ld de, wTempMonAttack
	ld hl, wTempMonDefense
	ld c, 2
	call CompareBytes
	ld c, ATK_EQ_DEF
	jr z, .got_tyrogue_evo
	ld c, ATK_LT_DEF
	jr c, .got_tyrogue_evo
	ld c, ATK_GT_DEF
.got_tyrogue_evo
	pop hl

	call GetNextEvoAttackByte
	cp c
	jmp nz, .skip_evolution_species
	jmp .proceed

.happiness
	ld a, [wTempMonHappiness]
	cp HAPPINESS_TO_EVOLVE
	jmp c, .skip_evolution_species_parameter

	call IsMonHoldingEverstone
	jmp z, .skip_evolution_species_parameter

	call GetNextEvoAttackByte
	cp TR_ANYTIME
	jmp z, .proceed
	cp TR_MORNDAY
	jr z, .happiness_daylight

; TR_EVENITE
	ld a, [wTimeOfDay]
	cp NITE_F
	jmp c, .skip_half_species_parameter ; MORN_F or DAY_F < NITE_F
	jr .proceed

.happiness_daylight
	ld a, [wTimeOfDay]
	cp NITE_F
	jmp nc, .skip_half_species_parameter ; NITE_F or EVE_F >= NITE_F
	jr .proceed

.trade
	ld a, [wLinkMode]
	and a
	jmp z, .skip_evolution_species_parameter

	call IsMonHoldingEverstone
	jmp z, .skip_evolution_species_parameter

	call GetNextEvoAttackByte
	ld b, a
	call GetNextEvoAttackByte
	push hl
	ld h, a
	ld l, b
	call GetItemIDFromIndex
	ld b, a
	pop hl
	inc a
	jr z, .proceed
	dec a

	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jmp z, .skip_half_species_parameter

	ld a, [wTempMonItem]
	cp b
	jmp nz, .skip_half_species_parameter

	xor a
	ld [wTempMonItem], a
	jr .proceed

.item
	call GetNextEvoAttackByte
	ld b, a
	call GetNextEvoAttackByte
	push hl
	ld h, a
	ld l, b
	call GetItemIDFromIndex
	ld b, a
	pop hl
	ld a, [wCurItem]
	cp b
	jmp nz, .skip_evolution_species

	ld a, [wForceEvolution]
	and a
	jmp z, .skip_evolution_species
	ld a, [wLinkMode]
	and a
	jmp nz, .skip_evolution_species
	jr .proceed

.level
	call GetNextEvoAttackByte
	ld b, a
	ld a, [wTempMonLevel]
	cp b
	jmp c, .skip_half_species_parameter
	call IsMonHoldingEverstone
	jmp z, .skip_half_species_parameter
ENDC

.proceed
	ld a, [wTempMonLevel]
	ld [wCurPartyLevel], a
	ld a, $1
	ld [wMonTriedToEvolve], a

	ldh a, [hTemp]
	call GetFarWord
	call GetPokemonIDFromIndex
	ld [wEvolutionNewSpecies], a
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	call CopyName1
	ld hl, EvolvingText
	call PrintText

	ld c, 50
	call DelayFrames

	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 20
	call ClearBox

	ld a, $1
	ldh [hBGMapMode], a
	call ClearSprites

	farcall EvolutionAnimation

	push af
	call ClearSprites
	pop af
	jmp c, CancelEvolution

	ld hl, CongratulationsYourPokemonText
	call PrintText

	ld a, [wEvolutionNewSpecies]
	ld [wCurSpecies], a
	ld [wTempMonSpecies], a
	ld [wNamedObjectIndex], a
	call GetPokemonName

	push hl
	ld hl, EvolvedIntoText
	call PrintTextboxText
	farcall StubbedTrainerRankings_MonsEvolved

	ld de, MUSIC_NONE
	call PlayMusic
	ld de, SFX_CAUGHT_MON
	call PlaySFX
	call WaitSFX

	ld c, 40
	call DelayFrames

	call ClearTilemap
	call UpdateSpeciesNameIfNotNicknamed
	call GetBaseData

	ld hl, wTempMonExp + 2
	ld de, wTempMonMaxHP
	ld b, TRUE
	predef CalcMonStats

	ld a, [wCurPartyMon]
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld e, l
	ld d, h
	ld bc, MON_MAXHP
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, wTempMonHP + 1
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a

	ld hl, wTempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes

	ld a, [wCurSpecies]
	ld [wTempSpecies], a
	xor a
	ld [wMonType], a
	call LearnLevelMoves
	ld a, [wTempSpecies]
	call SetSeenAndCaughtMon

	ld a, [wTempSpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(UNOWN)
	if HIGH(UNOWN) == 0
		or h
	else
		jr nz, .skip_unown
		if HIGH(UNOWN) == 1
			dec h
		else
			ld a, h
			cp HIGH(UNOWN)
		endc
	endc
	jr nz, .skip_unown
	ld hl, wTempMonDVs
	predef GetUnownLetter
	farcall UpdateUnownDex

.skip_unown
	pop de
	pop hl
	ld a, [wTempMonSpecies]
	ld [hl], a
	push hl
	ld l, e
	ld h, d
	jmp EvolveAfterBattle_MasterLoop

IF 0
	ld a, b
	cp EVOLVE_STAT
	jr nz, .skip_evolution_species_parameter
	inc hl
.skip_evolution_species_parameter
	inc hl
.skip_half_species_parameter
	inc hl
.skip_evolution_species
	inc hl
	inc hl
	jmp .loop
ENDC

.everstone_cancel
	pop af
.link_mode_cancel
	ld a, c
	call GetEvoTypeSkipCount
	ld c, a
	ld b, 0
	dec c
	add hl, bc
	jmp .loop

.skip_species_next
	inc hl
	inc hl
	jmp .loop

.ReturnToMap:
	pop de
	pop bc
	pop hl
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wBattleMode]
	and a
	ret nz
	ld a, [wMonTriedToEvolve]
	and a
	jmp nz, RestartMapMusic
	ret

UpdateSpeciesNameIfNotNicknamed:
	ld a, [wCurSpecies]
	push af
	ld a, [wBaseSpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	pop af
	ld [wCurSpecies], a
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
.loop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	jr nz, .loop

	ld a, [wCurPartyMon]
	ld bc, MON_NAME_LENGTH
	ld hl, wPartyMonNicknames
	rst AddNTimes
	push hl
	ld a, [wCurSpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, wStringBuffer1
	pop de
	ld bc, MON_NAME_LENGTH
	jmp CopyBytes

CancelEvolution:
	ld hl, StoppedEvolvingText
	call PrintText
	call ClearTilemap
	jmp EvolveAfterBattle_MasterLoop

IsMonHoldingEverstone:
	push hl
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	call GetItemIndexFromID
	cphl16 EVERSTONE
	pop hl
	ret

CongratulationsYourPokemonText:
	text_far _CongratulationsYourPokemonText
	text_end

EvolvedIntoText:
	text_far _EvolvedIntoText
	text_end

StoppedEvolvingText:
	text_far _StoppedEvolvingText
	text_end

EvolvingText:
	text_far _EvolvingText
	text_end

LearnLevelMoves:
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ldh [hTemp], a
	call SkipEvolutions

.find_move
	call GetNextEvoAttackByte
	and a
	jr z, .done

	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	call GetNextEvoAttackByte
	ld e, a
	call GetNextEvoAttackByte
	ld d, a
	jr nz, .find_move

	push hl
	ld h, d
	ld l, e
	call GetMoveIDFromIndex
	ld d, a
	ld hl, wPartyMon1Moves
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes

	ld b, NUM_MOVES
.check_move
	call GetNextEvoAttackByte
	cp d
	jr z, .has_move
	dec b
	jr nz, .check_move
	jr .learn
.has_move

	pop hl
	jr .find_move

.learn
	ld a, d
	ld [wPutativeTMHMMove], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	pop hl
	jr .find_move

.done
	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a
	ret

FillMoves:
; Fill in moves at de for wCurPartySpecies at wCurPartyLevel

	push hl
	push de
	push bc
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ldh [hTemp], a
	call SkipEvolutions
	jr .GetLevel

.NextMove:
	pop de
.GetMove:
	inc hl
	inc hl
.GetLevel:
	call GetNextEvoAttackByte
	and a
	jr z, .done
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jr c, .done
	ld a, [wSkipMovesBeforeLevelUp]
	and a
	jr z, .CheckMove
	ld a, [wPrevPartyLevel]
	cp b
	jr nc, .GetMove

.CheckMove:
	push de
	ld c, NUM_MOVES
	ldh a, [hTemp]
	push hl
	call GetFarWord
	call GetMoveIDFromIndex
	pop hl
	ld b, a
.CheckRepeat:
	ld a, [de]
	inc de
	cp b
	jr z, .NextMove
	dec c
	jr nz, .CheckRepeat
	pop de
	push de
	ld c, NUM_MOVES
.CheckSlot:
	ld a, [de]
	and a
	jr z, .LearnMove
	inc de
	dec c
	jr nz, .CheckSlot
	pop de
	push de
	push hl
	ld h, d
	ld l, e
	call ShiftMoves
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .ShiftedMove
	push de
	ld bc, wPartyMon1PP - (wPartyMon1Moves + NUM_MOVES - 1)
	add hl, bc
	ld d, h
	ld e, l
	call ShiftMoves
	pop de

.ShiftedMove:
	pop hl

.LearnMove:
	ldh a, [hTemp]
	push hl
	call GetFarWord
	call GetMoveIDFromIndex
	pop hl
	ld b, a
	ld [de], a
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .NextMove
	push hl
	ld a, b
	ld hl, MON_PP - MON_MOVES
	add hl, de
	push hl
	ld l, a
	ld a, MOVE_PP
	call GetMoveAttribute
	pop hl
	ld [hl], a
	pop hl
	jr .NextMove

.done
	jmp PopBCDEHL

ShiftMoves:
	ld c, NUM_MOVES - 1
.loop
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop
	ret

EvoFlagAction:
	push de
	ld d, $0
	predef SmallFarFlagAction
	pop de
	ret

GetLowestEvolutionStage:
; Return the first mon to evolve into wCurPartySpecies.
; Instead of looking it up, we just load it from a table. This is a lot more efficient.
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld bc, FirstEvoStages - 2
	add hl, hl
	add hl, bc
	ld a, BANK(FirstEvoStages)
	call GetFarWord
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ret

SkipEvolutions::
; Receives a pointer to the evos and attacks for a mon in b:hl, and skips to the attacks.
	ld a, b
	call GetFarByte
	inc hl
	and a
	ret z
	call GetEvoTypeSkipCount
	ld c, a
	ld b, 0
	dec c
	add hl, bc
	jr SkipEvolutions

DetermineEvolutionItemResults::
; in: b:de: pointer to evos and attacks struct, wCurItem: item
; out: de: species ID or zero; a, b, hl: clobbered
	ld h, d
	ld l, e
	ld de, 0
	ld a, b
	ldh [hTemp], a
.loop
	call GetNextEvoAttackByte
	and a
	ret z
	cp EVOLVE_ITEM
	jr nz, .skip_parameters
	call GetNextEvoAttackByte
	ld b, a
	call GetNextEvoAttackByte
	push hl
	ld h, a
	ld l, b
	call GetItemIDFromIndex
	ld b, a
	pop hl
	ld a, [wCurItem]
	cp b
	jr nz, .skip_species
	ldh a, [hTemp]
	call GetFarWord
	ld d, h
	ld e, l
	ret

.skip_species
	inc hl
	inc hl
	jr .loop

.skip_parameters
	push bc
	call GetEvoTypeSkipCount
	ld c, a
	ld b, 0
	dec c
	add hl, bc
	pop bc
	jr .loop

GetNextEvoAttackByte:
	ldh a, [hTemp]
	call GetFarByte
	inc hl
	ret

GetEvoTypeSkipCount:
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, .skip_amounts
	add hl, bc
	pop bc
	ld a, [hl]
	pop hl
	ret

.skip_amounts
	db 4 ; EVOLVE_LEVEL
	db 5 ; EVOLVE_ITEM
	db 5 ; EVOLVE_TRADE
	db 4 ; EVOLVE_HAPPINESS
	db 4 ; EVOLVE_LEVEL_RAND1
	db 4 ; EVOLVE_LEVEL_RAND2
	db 4 ; EVOLVE_LEVEL_FEMALE
	db 5 ; EVOLVE_LEVEL_ITEM
	db 5 ; EVOLVE_LEVEL_MOVE
	db 5 ; EVOLVE_LEVEL_ITEM_NIGHT
	db 4 ; EVOLVE_LEVEL_WITH_DARK
	db 5 ; EVOLVE_LEVEL_ABILITY
	db 4 ; EVOLVE_LANDMARK
	db 5 ; EVOLVE_ITEM_NITE
	db 5 ; EVOLVE_ITEM_BLOODMOON
	db 5 ; EVOLVE_ITEM_MALE
	db 5 ; EVOLVE_ITEM_FEMALE
	db 5 ; EVOLVE_SYLVEON
	db 3 ; EVOLVE_COINS

EvoTest_Level:
	call GetNextEvoAttackByte
	ld b, a
	ld a, [wTempMonLevel]
	cp b
	ccf
	ret

EvoTest_Item:
	call GetNextEvoAttackByte
	ld b, a
	call GetNextEvoAttackByte
	push hl
	ld h, a
	ld l, b
	call GetItemIDFromIndex
	ld b, a
	pop hl
	ld a, [wCurItem]
	cp b
	jr nz, .fail
	scf
	ret

.fail
	and a
	ret

EvoTest_Trade:
	ld a, [wFakeLinkTradeEvo]
	and a
	jr z, .check_link_mode
	xor a
	ld [wFakeLinkTradeEvo], a
	jr .continue

.check_link_mode
	ld a, [wLinkMode]
	and a
	jr z, .skip_item_fail

.continue
	call GetNextEvoAttackByte
	ld b, a
	call GetNextEvoAttackByte
	push hl
	ld h, a
	ld l, b
	call GetItemIDFromIndex
	ld b, a
	pop hl
	inc a
	jr z, .success

	ld a, [wTempMonItem]
	cp b
	jr nz, .fail

	xor a
	ld [wTempMonItem], a
.success
	scf
	ret

.skip_item_fail
	inc hl
	inc hl
.fail
	and a
	ret

EvoTest_Happiness:
	ld a, [wTempMonHappiness]
	cp HAPPINESS_TO_EVOLVE
	jr c, .skip_time_fail
	call GetNextEvoAttackByte
	cp TR_ANYTIME
	jr z, .success
	cp TR_MORNDAY
	jr z, .day

	ld a, [wTimeOfDay]
	cp NITE_F
	jr c, .fail
	jr .success

.day
	ld a, [wTimeOfDay]
	cp NITE_F
	jr nc, .fail
.success
	scf
	ret

.skip_time_fail
	inc hl
.fail
	and a
	ret

EvoTest_LevelRand1:
	call EvoTest_Level
	ret nc
	push hl
	call EvoTest_Rand_Check
	pop hl
	jr z, .fail
	scf
	ret

.fail
	and a
	ret

EvoTest_LevelRand2:
	call EvoTest_Level
	ret nc
	push hl
	call EvoTest_Rand_Check
	pop hl
	jr nz, .fail
	scf
	ret

.fail
	and a
	ret

EvoTest_Rand_Check:
	ld a, [wTempMonDVs]
	ld b, a
	ld a, [wTempMonDVs + 1]
	xor b
	ld b, a
	ld a, [wTempMonDVs + 2]
	xor b
	ld b, a
	ld c, 8
	xor a
	ld d, a
.loop
	rr b
	rl d
	xor d
	ld d, 0
	dec c
	jr nz, .loop
	and a
	ret

EvoTest_LevelFemale:
	call EvoTest_Level
	ret nc
	ld a, [wTempMonPersonality]
	and MON_GENDER
	ret z
	scf
	ret

EvoTest_LevelItem:
EvoTest_LevelMove:
EvoTest_LevelItemNite:
EvoTest_LevelWithDark:
EvoTest_LevelAbility:
EvoTest_LevelLandmark:
EvoTest_ItemNite:
EvoTest_ItemBloodMoon:
EvoTest_ItemMale:
EvoTest_ItemFemale:
EvoTest_Sylveon:
	ret

EvoTest_Coins:
	call GetNextEvoAttackByte
	ld c, a
	call GetNextEvoAttackByte
	ld b, a

	ld a, [wGimmighoulCoins]
	ld e, a
	ld a, [wGimmighoulCoins + 1]
	ld d, a

	cp b
	jr c, .fail
	jr nz, .success
	ld a, e
	cp c
	jr c, .fail

.success
	push hl
	ld a, b
	cpl
	ld h, a
	ld a, c
	cpl
	ld l, a
	inc hl
	add hl, de
	ld a, l
	ld [wGimmighoulCoins], a
	ld a, h
	ld [wGimmighoulCoins + 1], a
	pop hl

	scf
	ret

.fail
	and a
	ret
