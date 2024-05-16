; PrintDayCareText.TextTable indexes

	const_def
	const DAYCARETEXT_INTRO
	const DAYCARETEXT_ASK_DEPOSIT
	const DAYCARETEXT_ASK_DEPOSIT_2
	const DAYCARETEXT_ONLY_ONE_MON
	const DAYCARETEXT_WHICH_ONE
	const DAYCARETEXT_DOING_GREAT
	const DAYCARETEXT_GROWN_BY
	const DAYCARETEXT_ASK_SEE
	const DAYCARETEXT_COME_AGAIN
	const DAYCARETEXT_CANT_RAISE_EGG
	const DAYCARETEXT_ONE_LIVING_MON
	const DAYCARETEXT_TOO_SOON
	const DAYCARETEXT_COST
	const DAYCARETEXT_NOT_ENOUGH_MONEY
	const DAYCARETEXT_PARTY_FULL
	const DAYCARETEXT_GOT_BACK
	const DAYCARETEXT_TAKE_OTHER

DayCareWoman:
	ld a, [wScriptVar]
	and a
	jr z, .normal_start
	dec a
	jp z, .mon1_retrieve_start
	dec a
	jp z, .mon2_retrieve_start
.normal_start
	ld a, DAYCARETEXT_INTRO
	call PrintDayCareText
	call PromptButton
	ld hl, wDayCare
	bit DAYCARE_HAS_MON1_F, [hl]
	jr z, .AskDepositMons
	bit DAYCARE_HAS_MON2_F, [hl]
	jr nz, .ShowMons
.AskDepositMons:
	ld a, DAYCARETEXT_ASK_DEPOSIT
	call PrintDayCareText
	call YesNoBox
	jp nc, .TryDepositMon
	ld hl, wDayCare
	bit DAYCARE_HAS_MON1_F, [hl]
	jr nz, .ShowMons
	bit DAYCARE_HAS_MON2_F, [hl]
	jr nz, .ShowMons
	jp .ComeAgain

.TryDepositMon:
	call DayCareDepositPokemon
	jmp c, PrintDayCareText

	farcall DepositDayCareMon
	call DayCare_InitBreeding

	ld a, [wDayCare]
	bit DAYCARE_HAS_MON2_F, a
	jp nz, .ComeAgain

	ld a, DAYCARETEXT_ASK_DEPOSIT_2
	call PrintDayCareText
	call YesNoBox
	jp c, .ComeAgain
	jr .TryDepositMon

.ShowMons:
	ld a, DAYCARETEXT_DOING_GREAT
	call PrintDayCareText
	call PromptButton
	ld a, DAYCARETEXT_ASK_SEE
	call PrintDayCareText
	call YesNoBox
	jp c, .ComeAgain

	call .CheckMon1Growth
	call .CheckMon2Growth

	ld a, [wDayCare]
	bit DAYCARE_HAS_MON2_F, a
	ld a, 0 ; no-optimize a = 0
	jr z, .got_menu
	inc a
.got_menu
	ld [wWhichIndexSet], a
	ld hl, SeeMonMenuHeader
	call LoadMenuHeader
	call DoNthMenu
	call CloseWindow
	jp c, .ComeAgain
	ld a, [wMenuSelection]
	and a
	jp z, .ComeAgain

	dec a
	ld a, 0
	jr nz, .ChooseMon2
.ChooseMon1
	ld hl, wBreedMon1Nickname
	ld de, wStringBuffer2
	call .PrintMonGrowth
	jp c, PrintDayCareText
	ld a, 1
	ld [wScriptVar], a
	ret
.mon1_retrieve_start:
	xor a
	ld [wScriptVar], a
	ld a, [wBreedMon1Species]
	call PlayMonCry
	call WaitSFX
	ld bc, wStringBuffer3
	ld de, wMoney
	farcall TakeMoney
	ld a, DAYCARETEXT_GOT_BACK
	call PrintDayCareText
	farcall RetrieveBreedmon1
	ld hl, wDayCare
	res DAYCARE_MONS_COMPATIBLE_F, [hl]
	res DAYCARE_HAS_MON1_F, [hl]
	bit DAYCARE_HAS_MON2_F, [hl]
	jr z, .TakeOther
	res DAYCARE_HAS_MON2_F, [hl]
	set DAYCARE_HAS_MON1_F, [hl]
	farcall TransferBreedmon2ToBreedmon1
	ld hl, wDayCare
	jr .TakeOther

.ChooseMon2:
	ld hl, wBreedMon2Nickname
	ld de, wStringBuffer2 + 4
	call .PrintMonGrowth
	jp c, PrintDayCareText
	ld a, 2
	ld [wScriptVar], a
	ret
.mon2_retrieve_start:
	xor a
	ld [wScriptVar], a
	ld a, [wBreedMon2Species]
	call PlayMonCry
	call WaitSFX
	ld bc, wStringBuffer3
	ld de, wMoney
	farcall TakeMoney
	ld a, DAYCARETEXT_GOT_BACK
	call PrintDayCareText
	farcall RetrieveBreedmon2
	ld hl, wDayCare
	res DAYCARE_HAS_MON2_F, [hl]
	res DAYCARE_MONS_COMPATIBLE_F, [hl]
.TakeOther
	bit DAYCARE_HAS_MON1_F, [hl]
	jr z, .ComeAgain
	ld a, DAYCARETEXT_TAKE_OTHER
	call PrintDayCareText
	call YesNoBox
	jp nc, .ChooseMon1
.ComeAgain:
	ld a, DAYCARETEXT_COME_AGAIN
	jmp PrintDayCareText

.CheckMon1Growth:
	ld a, [wDayCare]
	bit DAYCARE_HAS_MON1_F, a
	ret z
	farcall GetBreedMon1LevelGrowth
	ld [wStringBuffer2], a
	ld a, b
	ld [wStringBuffer2 + 1], a
	ld a, e
	ld [wStringBuffer2 + 2], a
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon1Personality]
	ld [wTempMonPersonality], a
	ld a, TEMPMON
	ld [wMonType], a
	predef GetGender
	ld b, -1
	jr c, .got_gender_1
	ld b, 1
	jr z, .got_gender_1
	dec b
.got_gender_1
	ld a, b
	ld [wStringBuffer2 + 3], a
	ret

.CheckMon2Growth:
	ld a, [wDayCare]
	bit DAYCARE_HAS_MON2_F, a
	ret z
	farcall GetBreedMon2LevelGrowth
	ld [wStringBuffer2 + 4], a
	ld a, b
	ld [wStringBuffer2 + 5], a
	ld a, e
	ld [wStringBuffer2 + 6], a
	ld a, [wBreedMon2Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon2Personality]
	ld [wTempMonPersonality], a
	ld a, TEMPMON
	ld [wMonType], a
	predef GetGender
	ld b, -1
	jr c, .got_gender_2
	ld b, 1
	jr z, .got_gender_2
	dec b
.got_gender_2
	ld a, b
	ld [wStringBuffer2 + 7], a
	ret

.PrintMonGrowth:
	ld b, a
	push bc
	push de
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	rst CopyBytes
	pop de
	ld a, [de]
	and a
	jr z, .no_growth
	ld [wStringBuffer2 + 8], a
	ld hl, 100
	ld bc, 100
	rst AddNTimes
	xor a
	ld [wStringBuffer3], a
	ld a, h
	ld [wStringBuffer3 + 1], a
	ld a, l
	ld [wStringBuffer3 + 2], a
	ld a, DAYCARETEXT_GROWN_BY
	jr .join_print_growth

.no_growth
	xor a
	ld [wStringBuffer3], a
	ld [wStringBuffer3 + 1], a
	ld a, 100
	ld [wStringBuffer3 + 2], a
	ld a, DAYCARETEXT_TOO_SOON
.join_print_growth
	pop bc
	dec b
	jr z, .skip_level_text
	call PrintDayCareText
	call PromptButton
.skip_level_text
	ld a, DAYCARETEXT_COST
	call PrintDayCareText
	call YesNoBox
	ld a, DAYCARETEXT_COME_AGAIN
	ret c
	ld de, wMoney
	ld bc, wStringBuffer3
	farcall CompareMoney
	jr c, .not_enough_money
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .party_full
	and a
	ret

.not_enough_money
	ld a, DAYCARETEXT_NOT_ENOUGH_MONEY
	scf
	ret

.party_full
	ld a, DAYCARETEXT_PARTY_FULL
	scf
	ret

SeeMonMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw .Items
	dw .Display
	dw 0

.Items:
	db 2, 1, 0, -1
	db 3, 1, 2, 0, -1

.Display:
	ld h, d
	ld l, e
	ld a, [wMenuSelection]
	and a
	jr z, .cancel
	dec a
	ld de, wStringBuffer2 + 3
	push de
	ld de, wBreedMon1Nickname
	jr z, .got_nickname
	pop de
	ld de, wStringBuffer2 + 7
	push de
	ld de, wBreedMon2Nickname
.got_nickname
	push hl
	rst PlaceString
	pop hl
	ld de, 12
	add hl, de
	pop de
	ld a, [de]
	cp -1
	ld b, " "
	jr z, .got_gender_symbol
	and a
	ld b, "♂"
	jr z, .got_gender_symbol
	ld b, "♀"
.got_gender_symbol
	ld a, b
	ld [hli], a
	inc hl
	dec de
	ld a, [de]
	cp 100
	jr c, .under_100
	lb bc, 1, 3
	call PrintNum
	ret

.under_100
	ld a, "L"
	ld [hli], a
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

.cancel
	ld de, .cancel_string
	jp PlaceString

.cancel_string
	db "CANCEL@"

DayCareDepositPokemon:
	ld a, [wPartyCount]
	cp 2
	jr c, .OnlyOneMon
	ld a, DAYCARETEXT_WHICH_ONE
	call PrintDayCareText
	ld b, PARTYMENUACTION_GIVE_MON
	farcall SelectTradeOrDayCareMon
	jr c, .Declined
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .Egg
	farcall CheckCurPartyMonFainted
	jr c, .NoOtherMons
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNickname
	and a
	ret

.OnlyOneMon:
	ld a, DAYCARETEXT_ONLY_ONE_MON
	scf
	ret

.Declined:
	ld a, DAYCARETEXT_COME_AGAIN
	scf
	ret

.Egg:
	ld a, DAYCARETEXT_CANT_RAISE_EGG
	scf
	ret

.NoOtherMons:
	ld a, DAYCARETEXT_ONE_LIVING_MON
	scf
	ret

PrintDayCareText:
	ld e, a
	ld d, 0
	ld hl, .TextTable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jmp PrintText

.TextTable:
	dw .Intro          ; DAYCARETEXT_INTRO
	dw .AskDeposit     ; DAYCARETEXT_ASK_DEPOSIT
	dw .AskDeposit2    ; DAYCARETEXT_ASK_DEPOSIT_2
	dw .OnlyOneMon     ; DAYCARETEXT_ONLY_ONE_MON
	dw .WhichOne       ; DAYCARETEXT_WHICH_ONE
	dw .DoingGreat     ; DAYCARETEXT_DOING_GREAT
	dw .GrownBy        ; DAYCARETEXT_GROWN_BY
	dw .AskSee         ; DAYCARETEXT_ASK_SEE
	dw .ComeAgain      ; DAYCARETEXT_COME_AGAIN
	dw .CantRaiseEgg   ; DAYCARETEXT_CANT_RAISE_EGG
	dw .OneLivingMon   ; DAYCARETEXT_ONE_LIVING_MON
	dw .TooSoon        ; DAYCARETEXT_TOO_SOON
	dw .Cost           ; DAYCARETEXT_COST
	dw .NotEnoughMoney ; DAYCARETEXT_NOT_ENOUGH_MONEY
	dw .PartyFull      ; DAYCARETEXT_PARTY_FULL
	dw .GotBack        ; DAYCARETEXT_GOT_BACK
	dw .TakeOther      ; DAYCARETEXT_TAKE_OTHER

.Intro:
	text_far _DayCareIntroText
	text_end
.AskDeposit:
	text_far _DayCareAskDepositText
	text_end
.AskDeposit2:
	text_far _DayCareAskDeposit2Text
	text_end
.OnlyOneMon:
	text_far _DayCareOnlyOneMonText
	text_end
.WhichOne:
	text_far _DayCareWhichOneText
	text_end
.DoingGreat:
	text_far _DayCareDoingGreatText
	text_end
.GrownBy:
	text_far _DayCareGrownByText
	text_end
.AskSee:
	text_far _DayCareAskSeeText
	text_end
.ComeAgain:
	text_far _DayCareComeAgainText
	text_end
.CantRaiseEgg:
	text_far _DayCareCantRaiseEggText
	text_end
.OneLivingMon:
	text_far _DayCareOneLivingMonText
	text_end
.TooSoon:
	text_far _DayCareTooSoonText
	text_end
.Cost:
	text_far _DayCareCostText
	text_end
.NotEnoughMoney:
	text_far _DayCareNotEnoughMoneyText
	text_end
.PartyFull:
	text_far _DayCarePartyFullText
	text_end
.GotBack:
	text_far _DayCareGotBackText
	text_end
.TakeOther:
	text_far _DayCareTakeOtherText
	text_end

DayCareManOutside:
	ld hl, wDayCare
	bit DAYCARE_HAS_EGG_F, [hl]
	jr nz, .AskGiveEgg
	ld hl, .NotYetText
	jmp PrintText

.NotYetText:
	text_far _NotYetText
	text_end

.AskGiveEgg:
	ld hl, .FoundAnEggText
	call PrintText
	call YesNoBox
	jr c, .Declined
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	call DayCare_GiveEgg
	ld hl, wDayCare
	res DAYCARE_HAS_EGG_F, [hl]
	call DayCare_InitBreeding
	ld hl, .ReceivedEggText
	call PrintText
	ld de, SFX_GET_EGG
	call PlaySFX
	ld c, 120
	call DelayFrames
	ld hl, .TakeGoodCareOfEggText
	jr .Load0

.Declined:
	ld hl, .IllKeepItThanksText

.Load0:
	call PrintText
	xor a ; FALSE
	ld [wScriptVar], a
	ret

.PartyFull:
	ld hl, .NoRoomForEggText
	call PrintText
	ld a, TRUE
	ld [wScriptVar], a
	ret

.FoundAnEggText:
	text_far _FoundAnEggText
	text_end

.ReceivedEggText:
	text_far _ReceivedEggText
	text_end

.TakeGoodCareOfEggText:
	text_far _TakeGoodCareOfEggText
	text_end

.IllKeepItThanksText:
	text_far _IllKeepItThanksText
	text_end

.NoRoomForEggText:
	text_far _NoRoomForEggText
	text_end

DayCare_GiveEgg:
	ld a, [wEggMonLevel]
	ld [wCurPartyLevel], a
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	inc a
	ld [hl], a

	ld c, a
	ld b, 0
	add hl, bc
	ld a, EGG
	ld [hli], a
	ld a, [wEggMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	ld [hl], -1

	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggMonNickname
	rst CopyBytes

	ld hl, wPartyMonOTs
	ld bc, NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggMonOT
	rst CopyBytes

	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggMon
	ld bc, BOXMON_STRUCT_LENGTH
	rst CopyBytes

	call GetBaseData
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld b, h
	ld c, l
	ld hl, MON_ID + 1
	add hl, bc
	push hl
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push bc
	ld b, FALSE
	predef CalcMonStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret

.PartyFull:
	scf
	ret

DayCare_GetCurrentPartyMember:
	ld a, [wPartyCount]
	dec a
	rst AddNTimes
	ld d, h
	ld e, l
	ret

DayCare_InitBreeding:
	ld a, [wDayCare]
	bit DAYCARE_HAS_MON2_F, a
	ret z
	bit DAYCARE_HAS_MON1_F, a
	ret z
	farcall CheckBreedmonCompatibility
	ld a, [wBreedingCompatibility]
	and a
	ret z
	inc a
	ret z
	ld hl, wDayCare
	set DAYCARE_MONS_COMPATIBLE_F, [hl]
.loop
	call Random
	cp 150
	jr c, .loop
	ld [wStepsToEgg], a
; fallthrough
.UselessJump:
	xor a
	ld hl, wEggMon
	ld bc, BOXMON_STRUCT_LENGTH
	rst ByteFill
	ld hl, wEggMonNickname
	ld bc, MON_NAME_LENGTH
	rst ByteFill
	ld hl, wEggMonOT
	ld bc, NAME_LENGTH
	rst ByteFill
	ld a, [wBreedMon1DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld a, TEMPMON
	ld [wMonType], a
	ld hl, DITTO
	call GetPokemonIDFromIndex
	ld c, a
	ld a, [wBreedMon1Species]
	cp c
	ld a, $1
	jr z, .LoadWhichBreedmonIsTheMother
	ld a, [wBreedMon2Species]
	cp c
	ld a, $0 ; no-optimize a = 0
	jr z, .LoadWhichBreedmonIsTheMother
	farcall GetGender
	ld a, $0 ; no-optimize a = 0
	jr z, .LoadWhichBreedmonIsTheMother
	inc a

.LoadWhichBreedmonIsTheMother:
	ld [wBreedMotherOrNonDitto], a
	and a
	ld a, [wBreedMon1Species]
	jr z, .GotMother
	ld a, [wBreedMon2Species]

.GotMother:
	ld [wCurPartySpecies], a
	farcall GetLowestEvolutionStage
	ld a, EGG_LEVEL
	ld [wCurPartyLevel], a
	call Daycare_CheckAlternateOffspring
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld [wEggMonSpecies], a

	call GetBaseData
	ld hl, wEggMonNickname
	ld de, .String_EGG
	call CopyName2
	ld hl, wPlayerName
	ld de, wEggMonOT
	ld bc, NAME_LENGTH
	rst CopyBytes
	xor a
	ld [wEggMonItem], a
	ld de, wEggMonMoves
	xor a ; FALSE
	ld [wSkipMovesBeforeLevelUp], a
	predef FillMoves
	farcall InitEggMoves
	ld hl, wEggMonID
	ld a, [wPlayerID]
	ld [hli], a
	ld a, [wPlayerID + 1]
	ld [hl], a
	ld a, [wCurPartyLevel]
	ld d, a
	farcall CalcExpAtLevel
	ld hl, wEggMonExp
	ldh a, [hMultiplicand]
	ld [hli], a
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a
	xor a
	ld b, wEggMonDVs - wEggMonEVs
	ld hl, wEggMonEVs
.loop2
	ld [hli], a
	dec b
	jr nz, .loop2
	ld hl, DITTO
	call GetPokemonIDFromIndex
	ld b, a
	ld hl, wEggMonDVs
	call Random
	ld [hli], a
	ld [wTempMonDVs], a
	call Random
	ld [hld], a
	ld [wTempMonDVs + 1], a
	ld de, wBreedMon1DVs
	ld a, [wBreedMon1Species]
	cp b
	jr z, .GotDVs
	ld de, wBreedMon2DVs
	ld a, [wBreedMon2Species]
	cp b
	jr z, .GotDVs
	ld a, TEMPMON
	ld [wMonType], a
	push hl
	farcall GetGender
	pop hl
	ld de, wBreedMon1DVs
	ld bc, wBreedMon2DVs
	jr c, .SkipDVs
	jr z, .ParentCheck2
	ld a, [wBreedMotherOrNonDitto]
	and a
	jr z, .GotDVs
	ld d, b
	ld e, c
	jr .GotDVs

.ParentCheck2:
	ld a, [wBreedMotherOrNonDitto]
	and a
	jr nz, .GotDVs
	ld d, b
	ld e, c

.GotDVs:
	ld a, [de]
	inc de
	and $f
	ld b, a
	ld a, [hl]
	and $f0
	add b
	ld [hli], a
	ld a, [de]
	and $7
	ld b, a
	ld a, [hl]
	and $f8
	add b
	ld [hl], a

.SkipDVs:
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, NAME_LENGTH
	rst CopyBytes
	ld hl, wEggMonMoves
	ld de, wEggMonPP
	predef FillPP
	ld hl, wMonOrItemNameBuffer
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	rst CopyBytes
	ld a, [wBaseEggSteps]
	ld hl, wEggMonHappiness
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, [wCurPartyLevel]
	ld [wEggMonLevel], a
	ret

.String_EGG:
	db "EGG@"

Daycare_CheckAlternateOffspring:
	; returns [wCurPartySpecies] in a, unless that species may give birth to an alternate species (e.g., gender variant)
	; if an alternate species is possible, it returns it 50% of the time
	call Random
	add a
	ld a, [wCurPartySpecies]
	ret nc
	push hl
	push de
	push bc
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld de, 4
	ld hl, .alternate_offspring_table
	call IsInWordArray
	pop bc
	pop de
	ld a, [wCurPartySpecies]
	jr nc, .done
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetPokemonIDFromIndex
.done
	pop hl
	ret

.alternate_offspring_table
	dw NIDORAN_F, NIDORAN_M
	dw -1
