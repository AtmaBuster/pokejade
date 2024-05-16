Debug_NewGame:
	ld hl, .defaultname
	ld de, wPlayerName
	ld bc, 5
	rst CopyBytes

	call Random
	and 1
	ld [wPlayerGender], a

	ld hl, .defaultrival
	ld de, wRivalName
	ld bc, 7
	rst CopyBytes

	farcall InitializeEventsScript.SetEvents
	call Debug_SetStartingEvents
	call Debug_SetStartingScenes

	call Debug_GiveRandomStarter

	farcall GenerateMonPersonality
	ld a, b
	ld hl, wStarterTreeckoPersonality
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld hl, LETTER
	call .GetItem
	ld hl, PARKS_NOTE
	call .GetItem

	ld hl, wStatusFlags
	set STATUSFLAGS_POKEDEX_F, [hl]
	ld hl, wStatusFlags2
	set STATUSFLAGS2_BADGE_CASE_F, [hl]
	ld hl, wUnlockedDexFlags
	set NAZOH_DEX_UNLOCK_F, [hl]

	ret

.defaultname
	db "JADE@"
.defaultrival
	db "JASPER@"

.GetItem:
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	jp ReceiveItem

Debug_SetStartingEvents:
	call .DoList
	ld de, EVENT_INITIALIZED_EVENTS
	ld b, SET_FLAG
	jp EventFlagAction

.DoList:
	ld hl, .event_list
.loop
	ld a, [hli]
	cp -1
	ret z
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	call EventFlagAction
	pop hl
	jr .loop

.event_list
	dbw SET_FLAG, EVENT_GOT_STARTER
	dbw SET_FLAG, EVENT_STOPPED_AT_SHALE_CHECKPOINT
	dbw SET_FLAG, EVENT_GOT_POKEDEX
	dbw SET_FLAG, EVENT_OBSIDIAN_MEADOW_PROF
	dbw SET_FLAG, EVENT_OBSIDIAN_MEADOW_STARTERS
	dbw SET_FLAG, EVENT_OBSIDIAN_MEADOW_RIVAL
	dbw RESET_FLAG, EVENT_PARKS_LAB_PROF
	dbw RESET_FLAG, EVENT_PARKS_LAB_RIVAL
	db -1

Debug_SetStartingScenes:
	ld hl, .scene_list
.loop
	ld a, [hli]
	cp -1
	ret z
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push de
	push hl
	call GetMapSceneID
	pop hl
	pop bc
	ld a, b
	ld [de], a
	jr .loop

.scene_list
MACRO scenelistentry
	db \1
	db GROUP_\2
	db MAP_\2
ENDM
	scenelistentry 3, OBSIDIAN_TOWN
	scenelistentry 2, PARKS_LAB
	scenelistentry 2, OBSIDIAN_MEADOW
	scenelistentry 1, PLAYERS_HOUSE_1F
	scenelistentry 1, SHALE_CITY
	db -1

Debug_GiveRandomStarter:
	ld a, 7
	ld [wCurPartyLevel], a
	xor a
	ld [wCurItem], a
.randloop
	call Random
	and %11
	and a
	jr z, .randloop
	dec a
	ld hl, TREECKO
	ld de, EVENT_GOT_TREECKO
	jr z, .gotit
	ld hl, TORCHIC
	ld de, EVENT_GOT_TORCHIC
	jr z, .gotit
	ld hl, MUDKIP
	ld de, EVENT_GOT_MUDKIP
.gotit
	push hl
	ld b, SET_FLAG
	call EventFlagAction
	pop hl
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld b, 0
	xor a
	ld [wMonType], a
	farcall TryAddMonToParty
	ret
