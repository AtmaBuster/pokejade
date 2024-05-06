DebugMenu::
	call ClearWindowData

	ld de, SFX_MENU
	call PlaySFX

	farcall ReanchorBGMap_NoOAMUpdate
	ld a, [wBattleMenuCursorPosition]
	ld [wMenuCursorPosition], a
	lb bc, SCREEN_HEIGHT - 2, 11
	hlcoord 0, 0
	call Textbox
	call SafeUpdateSprites
	call HDMATransferTilemapAndAttrmap_Menu
	farcall LoadFonts_NoOAMUpdate
	call UpdateTimePals
	call .GetInput
	jr c, .Exit
	ld a, [wMenuSelection]
	ld hl, .Jumptable
;	rst JumpTable
	call JumpTable
.Exit:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call LoadFontsExtra
	pop af
	ldh [hOAMUpdate], a
	call ExitMenu
	call CloseText
	call UpdateTimePals
	ret

.GetInput:
	xor a
	ldh [hBGMapMode], a
	ld hl, .MenuHeader
	call LoadMenuHeader
	call ScrollingMenu
	and B_BUTTON
	jr nz, .b
	and a
	ret

.b
	scf
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, 11, SCREEN_HEIGHT - 2
	dw .MenuData
	db 1 ; default selection

.MenuData:
	db 0, 8, 0
	db SCROLLINGMENU_ITEMS_NORMAL
	dba .MenuItems
	dba .PlaceMenuStrings
	dba NULL

.PlaceMenuStrings:
	push de
	ld a, [wMenuSelection]
	ld hl, .Strings
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret

; options named "XXX" need to be fixed
.Strings:
	db "Party@"
	db "Set Flags@"
	db "ATMA@"
	db "Sound Test@"
	db "Subgame@"
	db "Warp@"
	db "Color@"
	db "Fill Dex@"
	db "Teach Move@"
	db "Give #@"
	db "Max ¥@"
	db "Warp Any@"
	db "PC@"
	db "Fill Bag@"
	db "Fill TM/HM@"
	db "Play Cry@"
	db "Trainer@"
	db "# Edit@"

.MenuItems
	db 18
	db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
	db -1

.Jumptable
	dw Debug_GiveParty
	dw Debug_SetFlags
	dw Debug_ATMA
	dw Debug_SoundTest
	dw Debug_SubgameMenu
	dw Debug_Warp
	dw Debug_ColorPicker
	dw Debug_FillDex
	dw Debug_TeachMove
	dw Debug_GivePoke
	dw Debug_MaxMoney
	dw Debug_WarpAny
	dw Debug_PC
	dw Debug_FillBag
	dw Debug_FillTMHM
	dw Debug_PlayCry
	dw Debug_Trainer
	dw Debug_PokeEdit

Debug_GiveParty:
; clear party
	xor a
	ld [wPartyCount], a
	ld a, -1
	ld [wPartySpecies], a
	ld hl, .party_info
.loop
	ldi a, [hl]
	and a
	jr z, .done
	ld [wCurPartyLevel], a
	xor a
	ld [wCurItem], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	ld h, d
	ld l, e
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld b, 0
	xor a
	ld [wMonType], a
	farcall TryAddMonToParty
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld b, h
	ld c, l
	pop hl
	call .set_move
	call .set_move
	call .set_move
	call .set_move
	jr .loop

.done
	ld a, [wPartyMon1Level]
	ld [wCurPartyLevel], a
	ld hl, wPartyMon1Personality
	ld a, MON_SHINY | $10 ; mild
	ld [hli], a
	ld a, PRANKSTER
	ld [hli], a
	ld a, POKE_BALL - FIRST_BALL_ITEM
	ld [hli], a
	ld a, $EA
	ld [hli], a
	ld a, $59
	ld [hli], a
	ld a, $A2
	ld [hl], a

	ld hl, wPartyMon1CaughtLevel
	ld a, $9E
	ld [hli], a
	ld a, $01
	ld [hl], a

	ld hl, wPartyMon1ID
	ld a, $E3
	ld [hli], a
	ld a, $20
	ld [hl], a

	ld hl, wPartyMon1OT
	ld a, "K"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld a, "I"
	ld [hli], a
	ld a, "S"
	ld [hli], a
	ld a, "@"
	ld [hl], a

	ld de, wPartyMon1MaxHP
	ld hl, wPartyMon1EVs - 1
	ld b, TRUE
	predef CalcMonStats
	ld hl, wPartyMon1MaxHP + 1
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld c, a
	ld a, b
	ld [hld], a
	ld a, c
	ld [hl], a
	ret

.set_move
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	push bc
	ld a, d
	or e
	jr z, .skip_move
	ld h, d
	ld l, e
	call GetMoveIDFromIndex
.skip_move
	pop bc
	ld [bc], a
	inc bc
	pop hl
	ret

.party_info
	db 90
	dw KOKOPELLI, POUND, 0, 0, 0
	db 50
	dw EXEGGUTOR, FLY, CUT, SURF, STRENGTH
	db 50
	dw MEW, POUND, 0, 0, 0
	db 0

Debug_SetFlags:
	call .set_engine_flags
	call .set_event_flags
	ret

.set_engine_flags
	ld hl, .engine_flags
.loop_engine
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, d
	and e
	inc a
	ret z
	ld b, SET_FLAG
	push hl
	farcall EngineFlagAction
	pop hl
	jr .loop_engine

.set_event_flags
	ld hl, .event_flags
.loop_event
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, d
	and e
	inc a
	ret z
	ld b, SET_FLAG
	push hl
	call EventFlagAction
	pop hl
	jr .loop_event

.engine_flags
	; pokegear
	dw ENGINE_POKEGEAR
	dw ENGINE_PHONE_CARD
	dw ENGINE_MAP_CARD
	dw ENGINE_RADIO_CARD
	dw ENGINE_EXPN_CARD
	; dex
	dw ENGINE_POKEDEX
	; badges
	dw ENGINE_ZEPHYRBADGE
	dw ENGINE_HIVEBADGE
	dw ENGINE_PLAINBADGE
	dw ENGINE_FOGBADGE
	dw ENGINE_STORMBADGE
	dw ENGINE_MINERALBADGE
	dw ENGINE_GLACIERBADGE
	dw ENGINE_RISINGBADGE
	; flypoints
	; end
	dw -1

.event_flags
	dw -1

Debug_SoundTest:
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld [wDebugMenuDataBuffer], a
	ld [wDebugMenuDataBuffer + 1], a
	ld [wDebugMenuDataBuffer + 2], a
	ld [wDebugMenuDataBuffer + 3], a
	hlcoord 0, 0
	lb bc, 6, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ld a, 1
	ld [wDebugMenuCursorPos], a
	call .update_display
	xor a
	ld [wDebugMenuCursorPos], a
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	jp z, .end
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	cp A_BUTTON
	jp z, .play
	and D_UP | D_DOWN
	jr nz, .change
	jr .loop

.change
	ld a, [wDebugMenuCursorPos]
	inc a
	and 1
	ld [wDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .get_value
.left_loop
	dec de
	dec a
	jr nz, .left_loop
	call .put_value
	call .update_display
	jr .loop

.right
	call .get_value
.right_loop
	inc de
	dec a
	jr nz, .right_loop
	call .put_value
	call .update_display
	jr .loop

.update_display
	hlcoord 1, 2
	ld a, " "
	ld [hl], a
	hlcoord 1, 5
	ld a, " "
	ld [hl], a
	ld a, [wDebugMenuCursorPos]
	and a
	jr z, .update_music
	hlcoord 1, 5
	ld a, "▶"
	ldi [hl], a
	inc hl
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 5
	ld de, wDebugMenuDataBuffer + 2
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret

.update_music
	hlcoord 1, 2
	ld a, "▶"
	ldi [hl], a
	inc hl
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 2
	ld de, wDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 3
	ld bc, 18
	ld a, " "
	call ByteFill
	ld hl, Debug_MusicNames
	ld bc, 18
	ld a, [wDebugMenuDataBuffer + 1]
	cp a, NUM_MUSIC_SONGS
	jp nc, .loop
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 1, 3
	call PlaceString
	ret

.play
	ld a, [wDebugMenuCursorPos]
	and a
	jr z, .play_music
	call .get_value
	call PlaySFX
	;call WaitSFX
	jp .loop

.play_music
	ld de, 0
	call PlayMusic
	call DelayFrame
	call .get_value
	call PlayMusic
	jp .loop

.end
	ret

.get_value
	ld a, [wDebugMenuCursorPos]
	ld hl, wDebugMenuDataBuffer
	add a
	add l
	ld l, a
	ldi a, [hl]
	ld e, [hl]
	ld d, a
	ldh a, [hJoyDown]
	and SELECT
	ld a, 1
	ret z
	ld a, 10
	ret

.put_value
	ld a, [wDebugMenuCursorPos]
	ld hl, wDebugMenuDataBuffer
	add a
	add l
	ld l, a
	ld a, d
	ldi [hl], a
	ld [hl], e
	ret

INCLUDE "engine/debug/music_names.asm"

Debug_SubgameMenu:
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	dec a
	ld bc, 3
	ld hl, .Jumptable
	call AddNTimes
	ldi a, [hl]
	ld b, a
	ldi a, [hl]
	ld h, [hl]
	ld l, a
	ld a, b
	call FarCall_hl
	ret

.Jumptable:
	dba SlotMachine
	dba CardFlip
	dba UnownPuzzle

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 10, 0, SCREEN_WIDTH - 1, 9
	dw .MenuData
	db 1 ; default

.MenuData:
	db STATICMENU_CURSOR
	db 3 ; # items
	db "Slots@"
	db "Card@"
	db "Unown@"

Debug_Warp:
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	hlcoord 0, 0
	call Textbox
	ld hl, .MenuHeader
	call LoadMenuHeader
	call ScrollingMenu
	and B_BUTTON
	ret nz
	ld a, [wMenuSelection]
	cp -1
	ret z
	dec a
	ld c, a
	ld b, 0
	ld hl, .SpawnTable
	add hl, bc
	ld a, [hl]
	ld [wDefaultSpawnpoint], a
	farcall FlyFunction.DoFly
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.SpawnTable
	db SPAWN_HOME
	db SPAWN_DEBUG
	db SPAWN_PALLET
	db SPAWN_VIRIDIAN
	db SPAWN_PEWTER
	db SPAWN_CERULEAN
	db SPAWN_ROCK_TUNNEL
	db SPAWN_VERMILION
	db SPAWN_LAVENDER
	db SPAWN_SAFFRON
	db SPAWN_CELADON
	db SPAWN_FUCHSIA
	db SPAWN_CINNABAR
	db SPAWN_INDIGO
	db SPAWN_NEW_BARK
	db SPAWN_CHERRYGROVE
	db SPAWN_VIOLET
	db SPAWN_UNION_CAVE
	db SPAWN_AZALEA
	db SPAWN_CIANWOOD
	db SPAWN_GOLDENROD
	db SPAWN_OLIVINE
	db SPAWN_ECRUTEAK
	db SPAWN_MAHOGANY
	db SPAWN_LAKE_OF_RAGE
	db SPAWN_BLACKTHORN
	db SPAWN_MT_SILVER
	db SPAWN_FAST_SHIP
DEF NUM_DEBUG_SPAWNS EQU 28

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 1, 1, SCREEN_WIDTH - 2, SCREEN_HEIGHT - 2
	dw .MenuData
	db 1

.MenuData:
	db 0
	db 8, 0
	db SCROLLINGMENU_ITEMS_NORMAL
	dba .Items
	dba .DrawItem
	dba NULL

.Items:
	db NUM_DEBUG_SPAWNS
DEF x = 1
rept NUM_DEBUG_SPAWNS
	db x
DEF x = x + 1
endr
	db -1

.DrawItem:
	push de
	ld a, [wMenuSelection]
	dec a
	ld hl, .LocNames
	ld bc, 13
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret

.LocNames:
	db "HOME@@@@@@@@@"
	db "DEBUG@@@@@@@@"
	db "PALLET@@@@@@@"
	db "VIRIDIAN@@@@@"
	db "PEWTEW@@@@@@@"
	db "CERULEAN@@@@@"
	db "ROCK TUNNEL@@"
	db "VERMILION@@@@"
	db "LAVENDER@@@@@"
	db "SAFFRON@@@@@@"
	db "CELADON@@@@@@"
	db "FUCHSIA@@@@@@"
	db "CINNABAR@@@@@"
	db "INDIGO PLAT.@"
	db "NEW BARK@@@@@"
	db "CHERRYGROVE@@"
	db "VIOLET@@@@@@@"
	db "UNION CAVE@@@"
	db "AZALEA@@@@@@@"
	db "CIANWOOD@@@@@"
	db "GOLDENROD@@@@"
	db "OLIVINE@@@@@@"
	db "ECRUTEAK@@@@@"
	db "MAHOGANY@@@@@"
	db "LAKE OF RAGE@"
	db "BLACKTHORN@@@"
	db "MT. SILVER@@@"
	db "FAST SHIP@@@@"

Debug_ColorPicker:
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	call DebugColorPicker
	pop af
	ldh [hMapAnims], a
	ret

INCLUDE "engine/debug/color_picker.asm"

Debug_FillDex:
; give pokedex
	ld de, ENGINE_POKEDEX
	ld b, SET_FLAG
	farcall EngineFlagAction
; set flags
	ld hl, 0
.loop
	inc hl
	ld a, h
	cp HIGH(NUM_DEX_POKEMON + 1)
	jr nz, .setflag
	ld a, l
	cp LOW(NUM_DEX_POKEMON + 1)
	ret z
.setflag
	push hl
	call GetPokemonIDFromIndex
	call SetSeenAndCaughtMon
	pop hl
	jr .loop

Debug_TeachMove:
	ld a, [wPartyCount]
	and a
	ret z
	xor a
	ld [wDebugMenuDataBuffer], a
	ld [wDebugMenuDataBuffer + 1], a
	hlcoord 0, 0
	lb bc, 6, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	ret z
	cp A_BUTTON
	jr z, .teach
	ld b, a
	ldh a, [hJoyDown]
	and $f
	or b
	cp D_LEFT
	jr z, .left1
	cp D_RIGHT
	jr z, .right1
	cp D_DOWN
	jr z, .left10
	cp D_UP
	jr z, .right10
	cp D_LEFT | SELECT
	jr z, .left100
	cp D_RIGHT | SELECT
	jr z, .right100
	jr .loop

.left1
	call .left
	call .update_display
	jr .loop

.right1
	call .right
	call .update_display
	jr .loop

.left100
	ld c, 100
	jr .left10loop

.right100
	ld c, 100
	jr .right10loop

.left10
	ld c, 10
.left10loop
	call .left
	dec c
	jr nz, .left10loop
	call .update_display
	jr .loop

.right10
	ld c, 10
.right10loop
	call .right
	dec c
	jr nz, .right10loop
	call .update_display
	jr .loop

.teach
	ld a, [wDebugMenuDataBuffer]
	and a
	jr nz, .ok_teach
	ld a, [wDebugMenuDataBuffer + 1]
	and a
	ret z
.ok_teach
	xor a
	ld [wCurPartyMon], a
	ld a, [wDebugMenuDataBuffer]
	ld h, a
	ld a, [wDebugMenuDataBuffer + 1]
	ld l, a
	call GetMoveIDFromIndex
	ld [wTempTMHM], a
	ld [wPutativeTMHMMove], a
	call GetMoveName
	ld de, wStringBuffer2
	ld hl, wStringBuffer1
	ld bc, 13
	call CopyBytes
	predef LearnMove
	ret

.left
	ld a, [wDebugMenuDataBuffer + 1]
	and a
	jr nz, .go_left
	ld a, [wDebugMenuDataBuffer]
	and a
	jr nz, .go_left2
	ld a, HIGH(NUM_ATTACKS)
	ld [wDebugMenuDataBuffer], a
	ld a, LOW(NUM_ATTACKS)
	ld [wDebugMenuDataBuffer + 1], a
	ret

.go_left2
	dec a
	ld [wDebugMenuDataBuffer], a
	xor a
.go_left
	dec a
	ld [wDebugMenuDataBuffer + 1], a
	ret

.right
	ld a, [wDebugMenuDataBuffer + 1]
	cp LOW(NUM_ATTACKS)
	jr nz, .go_right
	ld a, [wDebugMenuDataBuffer]
	cp HIGH(NUM_ATTACKS)
	jr nz, .go_right
	xor a
	ld [wDebugMenuDataBuffer], a
	ld [wDebugMenuDataBuffer + 1], a
	ret

.go_right
	ld a, [wDebugMenuDataBuffer + 1]
	inc a
	ld [wDebugMenuDataBuffer + 1], a
	ret nz
	ld a, [wDebugMenuDataBuffer]
	inc a
	ld [wDebugMenuDataBuffer], a
	ret

.update_display
	hlcoord 3, 2
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 2
	ld de, wDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 3
	ld a, " "
	ld bc, 18
	call ByteFill
	ld hl, wDebugMenuDataBuffer
	ld a, [hli]
	ld l, [hl]
	ld h, a
	and a
	jr nz, .doname
	ld a, l
	and a
	ret z
.doname
	call GetMoveIDFromIndex
	ld [wNamedObjectIndex], a
	call GetMoveName
	hlcoord 1, 3
	ld de, wStringBuffer1
	call PlaceString
	ret

Debug_GivePoke:
	xor a
	ld [wDebugMenuDataBuffer], a
	ld [wDebugMenuDataBuffer + 1], a
	ld [wDebugMenuDataBuffer + 2], a
	ld [wDebugMenuDataBuffer + 3], a
	ld [wDebugMenuDataBuffer + 4], a
	ld [wDebugMenuDataBuffer + 5], a
	hlcoord 0, 0
	lb bc, 8, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ld a, 2
	ld [wDebugMenuCursorPos], a
	call .update_display
	ld a, 1
	ld [wDebugMenuCursorPos], a
	call .update_display
	xor a
	ld [wDebugMenuCursorPos], a
	call .update_display

.loop
	call JoyTextDelay
	ldh a, [hJoyDown]
	and $e
	ld b, a
	ldh a, [hJoyLast]
	or b
	bit A_BUTTON_F, a
	jr nz, .givepoke
	bit B_BUTTON_F, a
	ret nz
	bit D_DOWN_F, a
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	ld b, 1
	bit START_F, a
	jr nz, .start
	bit SELECT_F, a
	jr z, .select
	ld b, 10
	jr .select
.start
	ld b, 100
.select
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right
	jr .loop

.up
	ld a, [wDebugMenuCursorPos]
	and a
	jr nz, .do_up
	ld a, 3
.do_up
	dec a
	jr .curchange

.down
	ld a, [wDebugMenuCursorPos]
	cp 2
	jr nz, .do_down
	ld a, -1
.do_down
	inc a
.curchange
	ld [wDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .getdat
.leftloop
	dec de
	dec b
	jr nz, .leftloop
	call .putdat
	call .update_display
	jr .loop

.right
	call .getdat
.rightloop
	inc de
	dec b
	jr nz, .rightloop
	call .putdat
	call .update_display
	jr .loop

.getdat
	ld a, [wDebugMenuCursorPos]
	add a
	add LOW(wDebugMenuDataBuffer)
	ld l, a
	ld h, HIGH(wDebugMenuDataBuffer)
	ld a, [hli]
	ld e, [hl]
	ld d, a
	dec hl
	ret

.putdat
	ld [hl], d
	inc hl
	ld [hl], e
	ret

.givepoke
	ld a, [wDebugMenuDataBuffer]
	ld h, a
	ld a, [wDebugMenuDataBuffer + 1]
	ld l, a
	cphl16 0
	jp z, .loop
	cphl16 NUM_POKEMON + 1
	jp nc, .loop
	ld a, [wDebugMenuDataBuffer + 5]
	and a
	jp z, .loop
	cp 101
	jp nc, .loop
	ld [wCurPartyLevel], a
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld a, [wDebugMenuDataBuffer + 3]
	ld l, a
	ld h, 0
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld b, 0
	farcall GivePoke
	ret

.update_display
	ld a, " "
	hlcoord 1, 2
	ld [hl], a
	hlcoord 1, 5
	ld [hl], a
	hlcoord 1, 8
	ld [hl], a
	ld a, [wDebugMenuCursorPos]
	and a
	jr z, .put_mon
	dec a
	jr z, .put_item

; fallthrough
.put_level
	hlcoord 1, 8
	ld a, "▶"
	ld [hl], a
	hlcoord 3, 8
	ld a, "L"
	ld [hli], a
	ld a, "v"
	ld [hli], a
	inc hl
	ld de, wDebugMenuDataBuffer + 5
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

.put_mon
	hlcoord 1, 2
	ld a, "▶"
	ld [hl], a
	hlcoord 3, 2
	ld de, wDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, [wDebugMenuDataBuffer]
	ld h, a
	ld a, [wDebugMenuDataBuffer + 1]
	ld l, a
	cphl16 0
	ret z
	cphl16 NUM_POKEMON + 1
	ret nc
	push hl
	hlcoord 1, 3
	ld a, " "
	ld bc, 18
	call ByteFill
	pop hl
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld de, wStringBuffer1
	hlcoord 1, 3
	call PlaceString
	ret

.put_item
	hlcoord 1, 5
	ld a, "▶"
	ld [hl], a
	hlcoord 3, 5
	ld de, wDebugMenuDataBuffer + 3
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 1, 6
	ld bc, 18
	ld a, " "
	call ByteFill
	ld a, [wDebugMenuDataBuffer + 3]
	and a
	ret z
	cp NUM_ITEM_POCKET + 1
	ret nc
	ld l, a
	ld h, 0
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	call GetItemName
	ld de, wStringBuffer1
	hlcoord 1, 6
	call PlaceString
	ret

Debug_MaxMoney:
	ld hl, wMoney
	ld a, HIGH(MAX_MONEY >> 8)
	ld [hli], a
	ld a, LOW(MAX_MONEY >> 8)
	ld [hli], a
	ld a, LOW(MAX_MONEY)
	ld [hl], a
	ld hl, wCoins
	ld a, HIGH(MAX_COINS)
	ld [hli], a
	ld a, LOW(MAX_COINS)
	ld [hl], a
	ret

Debug_WarpAny:
	ld a, 1
	ld [wDebugMenuDataBuffer], a
	ld [wDebugMenuDataBuffer + 1], a
	ld [wDebugMenuDataBuffer + 2], a
	hlcoord 0, 0
	lb bc, 3, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ld a, 2
	ld [wDebugMenuCursorPos], a
	call .update_display
	ld a, 1
	ld [wDebugMenuCursorPos], a
	call .update_display
	xor a
	ld [wDebugMenuCursorPos], a
	call .update_display

.loop
	call JoyTextDelay
	ldh a, [hJoyDown]
	and $e
	ld b, a
	ldh a, [hJoyLast]
	or b
	bit A_BUTTON_F, a
	jr nz, .warp
	bit B_BUTTON_F, a
	ret nz
	bit D_DOWN_F, a
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	ld b, 1
	bit START_F, a
	jr nz, .start
	bit SELECT_F, a
	jr z, .select
	ld b, 10
	jr .select
.start
	ld b, 100
.select
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right
	jr .loop

.up
	ld a, [wDebugMenuCursorPos]
	and a
	jr nz, .do_up
	ld a, 3
.do_up
	dec a
	jr .curchange

.down
	ld a, [wDebugMenuCursorPos]
	cp 2
	jr nz, .do_down
	ld a, -1
.do_down
	inc a
.curchange
	ld [wDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .getdat
.leftloop
	dec a
	dec b
	jr nz, .leftloop
	call .putdat
	call .update_display
	jr .loop

.right
	call .getdat
.rightloop
	inc a
	dec b
	jr nz, .rightloop
	call .putdat
	call .update_display
	jr .loop

.getdat
	ld a, [wDebugMenuCursorPos]
	add LOW(wDebugMenuDataBuffer)
	ld c, a
	ldh a, [c]
	ret

.putdat
	ldh [c], a
	ret

.warp
	ld hl, wDebugMenuDataBuffer
	ld de, wNextWarp
	ld bc, 3
	call CopyBytes
	ld a, BANK(EscapeRopeOrDig.UsedDigOrEscapeRopeScript)
	ld hl, EscapeRopeOrDig.UsedDigOrEscapeRopeScript + 1
	call FarQueueScript
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.update_display
	ld a, " "
	hlcoord 1, 1
	ld [hl], a
	hlcoord 1, 2
	ld [hl], a
	hlcoord 1, 3
	ld [hl], a
	ld a, [wDebugMenuCursorPos]
	and a
	ld c, a
	ld b, 0
	ld hl, wDebugMenuDataBuffer
	add hl, bc
	ld d, h
	ld e, l
	hlcoord 1, 1
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld a, "▶"
	ld [hli], a
	inc hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

Debug_PC:
	farcall PokemonCenterPC
	ret

Debug_FillBag:
	ld hl, wNumItems
	ld bc, wNumPCItems - wNumItems
	xor a
	rst ByteFill
	ld [wDebugMenuDataBuffer], a
	ld [wDebugMenuDataBuffer + 1], a

	ld a, -1
	ld hl, wItems
	ld [hl], a
	ld hl, wKeyItems
	ld [hl], a
	ld hl, wBalls
	ld [hl], a

	ldh a, [hJoyDown]
	and SELECT
	ret nz ; SELECT to empty

	call .FillKeyItems
	call .FillBalls
	call .FillItems

	ld a, [wDebugMenuDataBuffer]
	and a
	ret nz
	ld a, [wNumItems]
	sub MAX_ITEMS
	cpl
	inc a
	ld [wDebugMenuDataBuffer + 1], a

	ret

.FillKeyItems:
	ld hl, FIRST_KEY_ITEM
	lb bc, 1, NUM_KEY_ITEM_POCKET
	jr .key_item_ball_loop

.FillBalls:
	ld hl, FIRST_BALL_ITEM
	lb bc, MAX_ITEM_STACK, NUM_BALL_ITEM_POCKET

.key_item_ball_loop
	push hl
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld a, b
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	pop hl
	inc hl
	dec c
	jr nz, .key_item_ball_loop
	ret

.FillItems:
	ld hl, .ItemList
.item_loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	or e
	ret z
	push hl
	ld h, d
	ld l, e
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld a, MAX_ITEM_STACK
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	pop hl
	jr nc, .bag_full
	jr .item_loop

.bag_full
	ld a, [wDebugMenuDataBuffer]
	inc a
	ld [wDebugMenuDataBuffer], a
	jr .item_loop

.ItemList
	dw MAX_REPEL
	dw RARE_CANDY
	dw ESCAPE_ROPE
	dw FULL_RESTORE

	dw SACRED_ASH
	dw MAX_REVIVE
	dw PP_UP
	dw MAX_ELIXER

	dw FIRE_STONE
	dw LEAF_STONE
	dw MOON_STONE
	dw SUN_STONE
	dw THUNDERSTONE
	dw WATER_STONE
	dw DUSK_STONE
	dw DAWN_STONE
	dw SHINY_STONE
	dw PEAT_BLOCK

	dw DRAGON_SCALE
	dw KINGS_ROCK
	dw METAL_COAT
	dw UP_GRADE
	dw OVAL_STONE
	dw BLACK_AUGITE
	dw ELECTIRIZER
	dw MAGMARIZER
	dw RAZOR_CLAW
	dw DUBIOUS_DISC
	dw PRISM_SCALE
	dw REAPER_CLOTH
	dw DEEPSEATOOTH
	dw DEEPSEASCALE

	dw AMULET_COIN
	dw BERRY
	dw BERSERK_GENE
	dw EVERSTONE
	dw EXP_SHARE
	dw LEFTOVERS
	dw LUCKY_EGG
	dw 0

Debug_FillTMHM:
	ld hl, wTMsHMs
	ld e, NUM_TMS + NUM_HMS
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTMsHMs)
	ldh [rSVBK], a
	ld a, 99
.loop
	ld [hli], a
	dec e
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret

Debug_PlayCry:
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld hl, wDebugMenuDataBuffer
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [wDebugMenuCursorPos], a
	ld a, LOW(wDebugMenuDataBuffer)
	ld [hl], a
	hlcoord 0, 0
	lb bc, 7, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	call .update_numbers
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	ret z
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	cp A_BUTTON
	jr z, .play
	cp D_UP
	jr z, .up
	cp D_DOWN
	jr z, .down
	jr .loop
	ret

.left
	ld a, [wDebugMenuDataBuffer + 8]
	ld c, a
	ldh a, [c]
	ld h, a
	inc c
	ldh a, [c]
	ld l, a
	call .updateleft
	ld a, l
	ldh [c], a
	dec c
	ld a, h
	ldh [c], a
	call .update_numbers
	jr .loop

.right
	ld a, [wDebugMenuDataBuffer + 8]
	ld c, a
	ldh a, [c]
	ld h, a
	inc c
	ldh a, [c]
	ld l, a
	call .updateright
	ld a, l
	ldh [c], a
	dec c
	ld a, h
	ldh [c], a
	call .update_numbers
	jr .loop

.up
	ld a, [wDebugMenuDataBuffer + 8]
	cp LOW(wDebugMenuDataBuffer)
	jr z, .underflow
	dec a
	dec a
	jr .set_cursor
.underflow
	ld a, LOW(wDebugMenuDataBuffer + 6)
	jr .set_cursor

.down
	ld a, [wDebugMenuDataBuffer + 8]
	cp LOW(wDebugMenuDataBuffer + 6)
	jr z, .overrflow
	inc a
	inc a
	jr .set_cursor
.overrflow
	ld a, LOW(wDebugMenuDataBuffer)

.set_cursor
	ld [wDebugMenuDataBuffer + 8], a
	call .update_numbers
	jr .loop

.play
	ld a, [hJoyDown]
	and SELECT
	jr nz, .copyvanilla
	ld hl, wDebugMenuDataBuffer + 2
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryLength + 1], a
	ld a, [hl]
	ld [wCryLength], a
	farcall _PlayCry
	jp .loop

.copyvanilla
	ld hl, wDebugMenuDataBuffer
	ld d, [hl]
	inc hl
	ld e, [hl]
	dec de
	ld a, d
	and a
	ld hl, PokemonCries
	ld a, BANK(PokemonCries)
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld de, wDebugMenuDataBuffer + 2
	ld bc, 6
	call FarCopyBytes
	ld c, LOW(wDebugMenuDataBuffer + 2)
REPT 3
	ldh a, [c]
	inc c
	ld d, a
	ldh a, [c]
	ld e, a
	ld a, d
	ldh [c], a
	dec c
	ld a, e
	ldh [c], a
	inc c
	inc c
ENDR
	call .update_numbers
	jp .loop

.update_numbers
	hlcoord 8, 1
	ld bc, 11
	ld a, " "
	call ByteFill
	hlcoord 1, 1
	ld bc, SCREEN_WIDTH * 2
	ld [hl], a
	add hl, bc
	ld [hl], a
	add hl, bc
	ld [hl], a
	add hl, bc
	ld [hl], a
	ld a, [wDebugMenuDataBuffer + 8]
	sub LOW(wDebugMenuDataBuffer)
	hlcoord 1, 1
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld a, "▶"
	ld [hl], a
	hlcoord 2, 3
	ld de, .basecry
	call PlaceString
	hlcoord 2, 5
	ld de, .pitch
	call PlaceString
	hlcoord 2, 7
	ld de, .length
	call PlaceString
	hlcoord 8, 3
	ld de, wDebugMenuDataBuffer + 2
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 8, 5
	ld de, wDebugMenuDataBuffer + 4
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 8, 7
	ld de, wDebugMenuDataBuffer + 6
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 15, 3
	ld de, wDebugMenuDataBuffer + 2
	ld b, 2
	call PrintHexNum
	hlcoord 15, 5
	ld de, wDebugMenuDataBuffer + 4
	ld b, 2
	call PrintHexNum
	hlcoord 15, 7
	ld de, wDebugMenuDataBuffer + 6
	ld b, 2
	call PrintHexNum
	hlcoord 2, 1
	ld de, wDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, [wDebugMenuDataBuffer]
	cp HIGH(NUM_POKEMON)
	jr c, .show_name
	ld a, [wDebugMenuDataBuffer + 1]
	cp LOW(NUM_POKEMON) + 1
	ret nc
.show_name
	ld a, [wDebugMenuDataBuffer]
	ld h, a
	ld a, [wDebugMenuDataBuffer + 1]
	ld l, a
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld de, wStringBuffer1
	hlcoord 8, 1
	call PlaceString
	ret

.basecry
	db "Base@"
.pitch
	db "Pitch@"
.length
	db "Length@"

.updateleft
	call .getupdateamt
.leftloop
	dec hl
	dec de
	ld a, d
	or e
	jr nz, .leftloop
	ret

.updateright
	call .getupdateamt
.rightloop
	inc hl
	dec de
	ld a, d
	or e
	jr nz, .rightloop
	ret

.getupdateamt
	ldh a, [hJoyDown]
	and START | SELECT
	and a
	jr z, .neither
	cp START
	jr z, .start
	cp SELECT
	jr z, .select
; both
	ld de, 1000
	ret
.select
	ld de, 10
	ret
.start
	ld de, 100
	ret
.neither
	ld de, 1
	ret

PrintHexNum:
	ld a, [de]
	inc de
	call .print_byte
	dec b
	jr nz, PrintHexNum
	ret

.print_byte
	push af
	swap a
	call .print_digit
	pop af
.print_digit
	and $f
	cp $a
	jr c, .ok
	add "A"
.ok
	add "0"
	ld [hli], a
	ret

Debug_Trainer:
	xor a
	ld [wDebugMenuDataBuffer], a
	ld [wDebugMenuDataBuffer + 1], a
	ld [wDebugMenuCursorPos], a
	hlcoord 0, 0
	lb bc, 6, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	jp z, .end
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	cp A_BUTTON
	jp z, .fight
	and D_UP | D_DOWN
	jr nz, .change
	jr .loop

.change
	ld a, [wDebugMenuCursorPos]
	inc a
	and 1
	ld [wDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .get_value
.left_loop
	dec d
	dec a
	jr nz, .left_loop
	call .put_value
	ld a, [wDebugMenuCursorPos]
	and a
	call z, .reset_trainer_num
	call .update_display
	jr .loop

.right
	call .get_value
.right_loop
	inc d
	dec a
	jr nz, .right_loop
	call .put_value
	ld a, [wDebugMenuCursorPos]
	and a
	call z, .reset_trainer_num
	call .update_display
	jr .loop

.reset_trainer_num
	ld a, 1
	ld [wDebugMenuDataBuffer + 1], a
	ret

.update_display
	hlcoord 1, 2
	ld a, " "
	ld [hl], a
	hlcoord 1, 5
	ld a, " "
	ld [hl], a
	ld a, [wDebugMenuCursorPos]
	and a
	hlcoord 1, 2
	jr z, .got_cursor_pos
	hlcoord 1, 5
.got_cursor_pos
	ld a, "▶"
	ld [hl], a
	call .update_class
	hlcoord 3, 5
	ld a, " "
	ld bc, 15
	call ByteFill
	call .get_trainer_name
	jr c, .skip_trainer_name
	hlcoord 3, 5
	ld de, wStringBuffer1
	call PlaceString
.skip_trainer_name
	hlcoord 3, 6
	ld de, wDebugMenuDataBuffer + 1
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

.update_class
	hlcoord 3, 2
	ld a, " "
	ld bc, 15
	call ByteFill
	ld a, TRAINER_NAME
	ld [wNamedObjectType], a
	ld a, [wDebugMenuDataBuffer]
	and a
	jr z, .skip_class_name
	cp NUM_TRAINER_CLASSES
	jr nc, .skip_class_name
	ld [wCurSpecies], a
	ld [wTrainerClass], a
	call GetName
	hlcoord 3, 2
	ld de, wStringBuffer1
	call PlaceString
.skip_class_name
	hlcoord 3, 3
	ld de, wDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

.fight
	ld a, [wDebugMenuDataBuffer]
	and a
	jp z, .loop
	cp NUM_TRAINER_CLASSES
	jp nc, .loop
	ld [wOtherTrainerClass], a
	ld a, [wDebugMenuDataBuffer + 1]
	and a
	jp z, .loop
	ld [wOtherTrainerID], a
	ld a, $1
	ld [wBattleScriptFlags], a
	ld hl, wWinTextPointer
	ld a, LOW(DebugWinText)
	ld [hli], a
	ld a, HIGH(DebugWinText)
	ld [hli], a
	ld a, LOW(DebugLossText)
	ld [hli], a
	ld a, HIGH(DebugLossText)
	ld [hl], a
	call BufferScreen
	predef StartBattle
	ld a, MAPSETUP_RELOADMAP
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
	ld hl, wScriptFlags
	res SCRIPT_RUNNING, [hl]
	pop af
	ret

.end
	ret

.get_value
	ld a, [wDebugMenuCursorPos]
	ld hl, wDebugMenuDataBuffer
	add l
	ld l, a
	ld d, [hl]
	ldh a, [hJoyDown]
	and SELECT
	ld a, 1
	ret z
	ld a, 10
	ret

.put_value
	ld a, [wDebugMenuCursorPos]
	ld hl, wDebugMenuDataBuffer
	add l
	ld l, a
	ld [hl], d
	ret

.cancel_trainer_name
	scf
	ret

.get_trainer_name
	ld a, [wDebugMenuDataBuffer]
	and a
	jr z, .cancel_trainer_name
	cp NUM_TRAINER_CLASSES
	jr nc, .cancel_trainer_name
	dec a
	ld c, a
	add a
	add c
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	ld a, BANK(TrainerGroups)
	add hl, bc
	call GetFarByte
	push af
	ld a, BANK(TrainerGroups)
	inc hl
	call GetFarWord
	pop af
	ld b, a
	ld a, [wDebugMenuDataBuffer + 1]
	and a
	jr z, .cancel_trainer_name
	dec a
	and a
	jr z, .got_loc
	ld c, a
.trainer_name_loop
	ld a, b
	call GetFarByte
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	pop bc
	dec c
	jr z, .got_loc
	jr .trainer_name_loop

.got_loc
	inc hl
	ld de, wStringBuffer1
	ld a, b
	ld bc, 18
	call FarCopyBytes
	ld a, "@"
	ld [wStringBuffer2 - 1], a
	ld hl, wStringBuffer1
	ld c, 18
	call Debug_SanitizeString
	and a
	ret

Debug_SanitizeString:
.loop
	ld a, [hli]
	cp "@"
	ret z
	cp $80
	jr nc, .loop
	dec hl
	ld a, "@"
	ld [hl], a
	ret

Debug_PokeEdit:
; Edits the first mon in the party
	ld a, [wPartyCount]
	and a
	ret z
; Copy data to debug data buffer
	ld a, [wPartyMon1Species]
	ld de, wDebugE_Species
	ld hl, GetPokemonIndexFromID
	call .CopyToBuffer

	ld a, [wPartyMon1Item]
	ld de, wDebugE_Item
	ld hl, GetItemIndexFromID
	call .CopyToBuffer

	ld bc, wPartyMon1Moves
	ld de, wDebugE_Moves
	ld a, 4
.mv_to_buf_loop
	push af
	ld a, [bc]
	inc bc
	ld hl, GetMoveIndexFromID
	call .CopyToBuffer
	inc de
	pop af
	dec a
	jr nz, .mv_to_buf_loop

	ld a, [wPartyMon1ID]
	ld [wDebugE_TID], a
	ld a, [wPartyMon1ID + 1]
	ld [wDebugE_TID + 1], a

	ld hl, wPartyMon1EVs
	ld de, wDebugE_EVs
	ld bc, 12
	rst CopyBytes

	ld a, [wPartyMon1Happiness]
	ld [wDebugE_Happiness], a

	ld a, [wPartyMon1Level]
	ld [wDebugE_Level], a

	ld hl, wTilemap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	rst ByteFill
	ld hl, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, 7
	rst ByteFill
	call WaitBGMap2
	call Debug_PokeEdit_MainLoop
	ret nc

; copy data back to mon struct
	ld bc, wDebugE_Species
	ld de, wPartyMon1Species
	ld hl, GetPokemonIDFromIndex
	call .CopyFromBuffer
	ld [wPartySpecies], a

	ld bc, wDebugE_Item
	ld de, wPartyMon1Item
	ld hl, GetItemIDFromIndex
	call .CopyFromBuffer

	ld bc, wDebugE_Moves
	ld de, wPartyMon1Moves
	ld a, 4
.mv_from_buf_loop
	push af
	ld hl, GetMoveIDFromIndex
	call .CopyFromBuffer
	inc de
	inc bc
	pop af
	dec a
	jr nz, .mv_from_buf_loop

	ld a, [wDebugE_TID]
	ld [wPartyMon1ID], a
	ld a, [wDebugE_TID + 1]
	ld [wPartyMon1ID + 1], a

	ld hl, wDebugE_EVs
	ld de, wPartyMon1EVs
	ld bc, 12
	rst CopyBytes

	ld a, [wDebugE_Happiness]
	ld [wPartyMon1Happiness], a

	ld a, [wDebugE_Level]
	ld [wPartyMon1Level], a

; fix PP
	;;;

; fix EXP
	ld a, [wPartyMon1Species]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wPartyMon1Level]
	ld d, a
	farcall CalcExpAtLevel
	ldh a, [hProduct + 1]
	ld [wPartyMon1Exp], a
	ldh a, [hProduct + 2]
	ld [wPartyMon1Exp + 1], a
	ldh a, [hProduct + 3]
	ld [wPartyMon1Exp + 2], a

; recalc stats
	ld a, [wPartyMon1Level]
	ld [wCurPartyLevel], a
	ld de, wPartyMon1MaxHP
	ld hl, wPartyMon1EVs - 1
	ld b, TRUE
	predef CalcMonStats
	ld hl, wPartyMon1MaxHP + 1
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld c, a
	ld a, b
	ld [hld], a
	ld a, c
	ld [hld], a
	ret

.CopyToBuffer
; copies ID from a to de, using hl as a function
	call _hl_
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	ret

.CopyFromBuffer
; copies index from bc to de, using hl as a function
	push hl
	push hl
	ld hl, .CopyFromBuffer_ret
	add sp, 4
	push hl
	add sp, -2
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	ret
.CopyFromBuffer_ret
	ld [de], a
	ret

DEF DEBUGE_MAX_CURSOR EQU 26

Debug_PokeEdit_MainLoop:
; init display
	ld a, DEBUGE_MAX_CURSOR
.init_display_loop
	dec a
	ld [wDebugMenuCursorPos], a
	push af
	call .CursorJumptable
	pop af
	jr nz, .init_display_loop
.MainLoop:
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp START
	jr z, .exit
	cp B_BUTTON
	jr z, .exit_no_change
	call Debug_PokeEdit_Joypad
	push af
	call c, .CursorJumptable
	pop af
	call c, WaitBGMap
	call .DrawCursor
	jr .MainLoop

.exit
	scf
	ret

.exit_no_change
	and a
	ret

.DrawCursor:
	lb bc, DEBUGE_MAX_CURSOR, 0
	ld de, .CursorPositions
.draw_cursor_loop
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	ld a, [wDebugMenuCursorPos]
	cp c
	ld a, " "
	jr nz, .got_cursor_tile
	ld a, "▶"
.got_cursor_tile
	ld [hl], a
	inc c
	dec b
	jr nz, .draw_cursor_loop
	ret

.CursorPositions:
	table_width 2, .CursorPositions
	dwcoord 1, 0
	dwcoord 1, 1
	dwcoord 2, 2
	dwcoord 2, 3
	dwcoord 2, 4
	dwcoord 2, 5
	dwcoord 1, 6
	dwcoord 9, 6
	dwcoord 14, 6
	dwcoord 2, 7
	dwcoord 7, 7
	dwcoord 12, 7
	dwcoord 2, 8
	dwcoord 7, 8
	dwcoord 12, 8
	dwcoord 1, 9
	dwcoord 4, 9
	dwcoord 7, 9
	dwcoord 10, 9
	dwcoord 13, 9
	dwcoord 16, 9
	dwcoord 2, 10
	dwcoord 3, 11
	dwcoord 0, 12
	dwcoord 1, 13
	dwcoord 1, 14
	assert_table_length DEBUGE_MAX_CURSOR

.CursorJumptable:
	ld a, [wDebugMenuCursorPos]
	ld c, a
	ld b, 0
	ld hl, .CursorJumptable_Ptr
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.CursorJumptable_Ptr:
	table_width 2, .CursorJumptable_Ptr
	dw .Species
	dw .Item
	dw .Move1
	dw .Move2
	dw .Move3
	dw .Move4
	dw .TID
	dw .Happiness
	dw .Level
	dw .EV1
	dw .EV2
	dw .EV3
	dw .EV4
	dw .EV5
	dw .EV6
	dw .DV1
	dw .DV2
	dw .DV3
	dw .DV4
	dw .DV5
	dw .DV6
	dw .Ability
	dw .Ball
	dw .Delta
	dw .Shiny
	dw .Gender
	assert_table_length DEBUGE_MAX_CURSOR

.Species
	call .Gender
	call .Delta
	ld hl, wDebugE_Species
	ld a, [hli]
	ld l, [hl]
	ld h, a
	push hl
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 2, 0
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	hlcoord 8, 0
	ld a, " "
	ld bc, 10
	rst ByteFill
	pop hl
	ld a, h
	ld h, l
	ld l, a
	or h
	ret z
	cphl16 NUM_POKEMON + 1
	ret nc
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndex], a
	call GetPokemonName
	hlcoord 8, 0
	ld de, wStringBuffer1
	rst PlaceString
	ret

.Item
	ld hl, wDebugE_Item
	ld a, [hli]
	ld l, [hl]
	ld h, a
	push hl
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 2, 1
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	hlcoord 7, 1
	ld a, " "
	ld bc, 12
	rst ByteFill
	pop hl
	ld a, h
	ld h, l
	ld l, a
	or h
	jr z, .no_item
	cphl16 NUM_ITEMS + 1
	ret nc
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	call GetItemName
	hlcoord 7, 1
	ld de, wStringBuffer1
	rst PlaceString
	ret

.no_item
	ld de, .no_item_str
	hlcoord 7, 1
	rst PlaceString
	ret

.no_item_str
	db "NO ITEM@"

.Move1
	hlcoord 3, 2
	push hl
	ld hl, wDebugE_Moves
	jr .move_n

.Move2
	hlcoord 3, 3
	push hl
	ld hl, wDebugE_Moves + 2
	jr .move_n
.Move3
	hlcoord 3, 4
	push hl
	ld hl, wDebugE_Moves + 4
	jr .move_n
.Move4
	hlcoord 3, 5
	push hl
	ld hl, wDebugE_Moves + 6
.move_n
	ld a, [hli]
	ld c, [hl]
	ld b, a
	pop hl
	push bc
	push hl
	ld hl, sp+2
	ld d, h
	ld e, l
	pop hl
	push hl
	lb bc, PRINTNUM_LEADINGZEROS | 2, 3
	call PrintNum
	pop hl
	ld bc, 4
	add hl, bc
	push hl
	ld a, " "
	ld bc, 12
	rst ByteFill
	pop hl
	pop de
	push hl
	ld a, d
	ld h, e
	ld l, a
	or h
	jr z, .skip_move
	cphl16 NUM_ATTACKS + 1
	jr nc, .skip_move
	call GetMoveIDFromIndex
	ld [wNamedObjectIndex], a
	call GetMoveName
	pop hl
	ld de, wStringBuffer1
	rst PlaceString
	ret

.skip_move
	pop hl
	ret

.TID
	ld a, [wDebugE_TID]
	ld e, a
	ld a, [wDebugE_TID + 1]
	ld d, a
	push de
	ld hl, sp+0
	ld d, h
	ld e, l
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	hlcoord 2, 6
	call PrintNum
	add sp, 2
	ret

.Happiness
	ld a, [wDebugE_Happiness]
	ld e, a
	push de
	ld hl, sp+0
	ld d, h
	ld e, l
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	hlcoord 10, 6
	call PrintNum
	add sp, 2
	ret

.Level
	ld a, [wDebugE_Level]
	ld e, a
	push de
	ld hl, sp+0
	ld d, h
	ld e, l
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	hlcoord 15, 6
	call PrintNum
	add sp, 2
	ret

.EV1
	hlcoord 3, 7
	ld a, [wDebugE_EVs]
	jr .EV_n
.EV2
	hlcoord 8, 7
	ld a, [wDebugE_EVs+1]
	jr .EV_n
.EV3
	hlcoord 13, 7
	ld a, [wDebugE_EVs+2]
	jr .EV_n
.EV4
	hlcoord 3, 8
	ld a, [wDebugE_EVs+3]
	jr .EV_n
.EV5
	hlcoord 8, 8
	ld a, [wDebugE_EVs+4]
	jr .EV_n
.EV6
	hlcoord 13, 8
	ld a, [wDebugE_EVs+5]
.EV_n
	ld e, a
	push de
	push hl
	ld hl, sp+2
	ld d, h
	ld e, l
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	add sp, 2
	ret

.DV1
	hlcoord 2, 9
	ld a, [wDebugE_DVs + 2]
	swap a
	jr .DV_n
.DV2
	hlcoord 5, 9
	ld a, [wDebugE_DVs]
	swap a
	jr .DV_n
.DV3
	hlcoord 8, 9
	ld a, [wDebugE_DVs]
	jr .DV_n
.DV4
	hlcoord 11, 9
	ld a, [wDebugE_DVs + 1]
	swap a
	jr .DV_n
.DV5
	hlcoord 14, 9
	ld a, [wDebugE_DVs + 1]
	jr .DV_n
.DV6
	hlcoord 17, 9
	ld a, [wDebugE_DVs + 2]
.DV_n
	and $F
	ld e, a
	push de
	push hl
	ld hl, sp+2
	ld d, h
	ld e, l
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	add sp, 2
	ret

.Ability
	ld a, [wDebugE_Ability]
	ld e, a
	push de
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 3, 10
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 8, 10
	ld bc, 12
	ld a, " "
	rst ByteFill
	pop de
	ld a, e
	cp NUM_ABILITIES
	ret nc
	call GetAbilityName
	hlcoord 8, 10
	ld de, wStringBuffer1
	rst PlaceString
	ret

.Ball
	ld a, [wDebugE_CaughtBall]
	and MON_BALL_MASK
	ld e, a
	push de
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 4, 11
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	hlcoord 8, 11
	ld bc, 12
	ld a, " "
	rst ByteFill
	pop de
	ld a, e
	cp NUM_BALL_ITEM_POCKET
	ret nc
	ld l, a
	ld h, HIGH(FIRST_BALL_ITEM)
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	call GetItemName
	ld de, wStringBuffer1
	hlcoord 8, 11
	rst PlaceString
	ret

.Delta
	ld a, [wDebugE_Species]
	ld l, a
	ld a, [wDebugE_Species + 1]
	ld h, a
	call GetPokemonIDFromIndex
	ld [wCurSpecies], a
	ld a, [wDebugE_CaughtBall]
	ld [wCurDeltaIndex], a
	call GetBaseData
	ld a, [wDebugE_CaughtBall]
	swap a
	rrca
	and %111
	hlcoord 1, 12
	add "0"
	ld [hli], a
	inc hl
	inc a
	ld bc, 17
	ld a, " "
	rst ByteFill
	ld a, [wBaseType1]
	ld [wNamedObjectIndex], a
	farcall GetTypeName
	hlcoord 3, 12
	ld de, wStringBuffer1
	rst PlaceString
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	ret z
	ld [wNamedObjectIndex], a
	farcall GetTypeName
	hlcoord 11, 12
	ld a, "/"
	ld [hli], a
	ld de, wStringBuffer1
	rst PlaceString
	ret

.Shiny
	hlcoord 2, 13
	ld de, .shiny_str
	rst PlaceString
	ld a, [wDebugE_Personality]
	and MON_SHINY
	ld a, "Y"
	jr nz, .got_shiny_char
	ld a, "n"
.got_shiny_char
	hlcoord 8, 13
	ld [hl], a
	ret

.shiny_str
	db "SHINY:@"

.Gender
	hlcoord 2, 14
	ld de, .gender_str
	rst PlaceString
	ld a, [wDebugE_Species]
	ld l, a
	ld a, [wDebugE_Species + 1]
	ld h, a
	call GetPokemonIDFromIndex
	ld [wCurSpecies], a
	ld a, [wDebugE_CaughtBall]
	ld [wCurDeltaIndex], a
	call GetBaseData
	ld a, [wBaseGender]
	cp GENDER_F0
	ld b, "♂"
	jr z, .got_gender_symbol
	cp GENDER_F100
	ld b, "♀"
	jr z, .got_gender_symbol
	cp GENDER_UNKNOWN
	ld b, "-"
	jr z, .got_gender_symbol
	ld a, [wDebugE_Personality]
	and MON_GENDER
	ld b, "♀"
	jr nz, .got_gender_symbol
	ld b, "♂"
.got_gender_symbol
	hlcoord 9, 14
	ld [hl], b
	ret

.gender_str
	db "GENDER:@"

Debug_PokeEdit_Joypad:
	bit D_UP_F, a
	jr nz, .up
	bit D_DOWN_F, a
	jr nz, .down
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right
	and a
	ret

.left
	ldh a, [hJoyDown]
	ld bc, -100
	bit A_BUTTON_F, a
	jr nz, .leftright
	ld bc, -10
	bit SELECT_F, a
	jr nz, .leftright
	ld bc, -1
	jr .leftright

.right
	ldh a, [hJoyDown]
	ld bc, 100
	bit A_BUTTON_F, a
	jr nz, .leftright
	ld bc, 10
	bit SELECT_F, a
	jr nz, .leftright
	ld bc, 1
.leftright
	call .CursorJumptable
	scf
	ret

.down
	ld a, [wDebugMenuCursorPos]
	inc a
	cp DEBUGE_MAX_CURSOR
	jr nz, .got_new_pos
	xor a
	jr .got_new_pos

.up
	ld a, [wDebugMenuCursorPos]
	and a
	jr z, .up_loop
	dec a
	jr .got_new_pos
.up_loop
	ld a, DEBUGE_MAX_CURSOR - 1
.got_new_pos
	ld [wDebugMenuCursorPos], a
	scf
	ret

.CursorJumptable:
	push bc
	ld a, [wDebugMenuCursorPos]
	ld c, a
	ld b, 0
	ld hl, .CursorJumptable_Ptr
	add hl, bc
	add hl, bc
	pop bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.CursorJumptable_Ptr:
	table_width 2, .CursorJumptable_Ptr
	dw .Species
	dw .Item
	dw .Move1
	dw .Move2
	dw .Move3
	dw .Move4
	dw .TID
	dw .Happiness
	dw .Level
	dw .EV1
	dw .EV2
	dw .EV3
	dw .EV4
	dw .EV5
	dw .EV6
	dw .DV1
	dw .DV2
	dw .DV3
	dw .DV4
	dw .DV5
	dw .DV6
	dw .Ability
	dw .Ball
	dw .Delta
	dw .Shiny
	dw .Gender
	assert_table_length DEBUGE_MAX_CURSOR

.Delta
	ld a, [wDebugE_CaughtBall]
	ld b, a
	swap a
	rrca
	add c
	and %111
	rrca
	rrca
	rrca
	ld c, a
	ld a, b
	and %00011111
	or c
	ld [wDebugE_CaughtBall], a
	ret

.Shiny
	ld a, [wDebugE_Personality]
	xor MON_SHINY
	ld [wDebugE_Personality], a
	ret

.Gender
	ld a, [wDebugE_Personality]
	xor MON_GENDER
	ld [wDebugE_Personality], a
	ret

.Species
	ld de, wDebugE_Species
	jr .simple_edit

.Move1
	ld de, wDebugE_Moves
	jr .simple_edit

.Move2
	ld de, wDebugE_Moves + 2
	jr .simple_edit

.Move3
	ld de, wDebugE_Moves + 4
	jr .simple_edit

.Move4
	ld de, wDebugE_Moves + 6
	jr .simple_edit

.TID
	ld de, wDebugE_TID

.simple_edit
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	add hl, bc
.put_hl_to_de
	ld a, h
	ld [de], a
	dec de
	ld a, l
	ld [de], a
	ret

.Happiness
	ld a, [wDebugE_Happiness]
	add c
	ld [wDebugE_Happiness], a
	ret

.Level
	ld a, [wDebugE_Level]
	add c
	dec a
	cp 100
	jr c, .done_level
	ld c, a
	ld a, b
	and a
	ld a, -100
	jr z, .got_level_fix
	ld a, 100
.got_level_fix
	add c
.done_level
	inc a
	ld [wDebugE_Level], a
	ret

.EV1
	ld a, [wDebugE_EVs]
	add c
	ld [wDebugE_EVs], a
	ret
.EV2
	ld a, [wDebugE_EVs+1]
	add c
	ld [wDebugE_EVs+1], a
	ret
.EV3
	ld a, [wDebugE_EVs+2]
	add c
	ld [wDebugE_EVs+2], a
	ret
.EV4
	ld a, [wDebugE_EVs+3]
	add c
	ld [wDebugE_EVs+3], a
	ret
.EV5
	ld a, [wDebugE_EVs+4]
	add c
	ld [wDebugE_EVs+4], a
	ret
.EV6
	ld a, [wDebugE_EVs+5]
	add c
	ld [wDebugE_EVs+5], a
	ret

.DV1
	ld hl, wDebugE_DVs + 2
	ld b, $F0
	jr .DV_n
.DV2
	ld hl, wDebugE_DVs
	ld b, $F0
	jr .DV_n
.DV3
	ld hl, wDebugE_DVs
	ld b, $0F
	jr .DV_n
.DV4
	ld hl, wDebugE_DVs + 1
	ld b, $F0
	jr .DV_n
.DV5
	ld hl, wDebugE_DVs + 1
	ld b, $0F
	jr .DV_n
.DV6
	ld hl, wDebugE_DVs + 2
	ld b, $0F
.DV_n
	ld a, c
	swap a
	or c
	ld c, a
	ld a, [hl]
	and b
	add c
	and b
	ld c, a
	ld a, b
	cpl
	and [hl]
	or c
	ld [hl], a
	ret

.Ability
	ld a, [wDebugE_Ability]
	add c
	ld [wDebugE_Ability], a
	ret

.Ball
	ld a, [wDebugE_CaughtBall]
	ld b, a
	add c
	and MON_BALL_MASK
	ld c, a
	ld a, b
	and ~MON_BALL_MASK
	or c
	ld [wDebugE_CaughtBall], a
	ret

.Item
	ld de, wDebugE_Item
	call .simple_edit
	inc de
.item_loop
	call Debug_PokeEdit_GetItemSection
	jp c, .put_hl_to_de
	push de
	ld d, b
	ld c, a
	ld b, 0
	push hl
	ld hl, .item_section_offsets
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	ld a, d
	and a
	jr z, .got_item_add
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
.got_item_add
	add hl, bc
	pop de
	jr .item_loop

.item_section_offsets
	dw FIRST_KEY_ITEM - NUM_ITEM_POCKET - 1
	dw FIRST_BALL_ITEM - NUM_KEY_ITEM_POCKET - FIRST_KEY_ITEM
	dw -NUM_BALL_ITEM_POCKET - FIRST_BALL_ITEM

Debug_PokeEdit_GetItemSection:
	cphl16 NUM_ITEM_POCKET + 1
	jr c, .item_pocket
	cphl16 FIRST_KEY_ITEM
	jr c, .item_pocket_error
	cphl16 NUM_KEY_ITEM_POCKET + FIRST_KEY_ITEM
	jr c, .key_item_pocket
	cphl16 FIRST_BALL_ITEM
	jr c, .key_item_pocket_error
	cphl16 NUM_BALL_ITEM_POCKET + FIRST_BALL_ITEM
	jr c, .ball_pocket
; ball_pocket_error
	ld a, 2
	and a
	ret

.ball_pocket
	ld a, 2
	scf
	ret

.key_item_pocket_error
	ld a, 1
	and a
	ret

.key_item_pocket
	ld a, 1
	scf
	ret

.item_pocket_error
	xor a
	ret

.item_pocket
	xor a
	scf
	ret

Debug_ATMA:
	ldh a, [hJoyDown]
	and SELECT
	jr z, .no_select
	ld hl, wRoamMon1
	ld bc, 11 * 3
	xor a
	rst ByteFill
	ret

.no_select
	ld hl, wRoamMon1
	ld de, LATIAS
	call .init
	ld hl, wRoamMon2
	ld de, LATIOS
	call .init
	ld hl, wRoamMon3
	ld de, CELEBI
	call .init

	ld a, [wMapGroup]
	ld [wRoamMon1MapGroup], a
	ld [wRoamMon2MapGroup], a
	ld [wRoamMon3MapGroup], a
	ld a, [wMapNumber]
	ld [wRoamMon1MapNumber], a
	ld [wRoamMon2MapNumber], a
	ld [wRoamMon3MapNumber], a

	ret

.init
	ld a, [hl]
	and a
	ret nz
	push hl
	ld h, d
	ld l, e
	call GetPokemonIDFromIndex
	pop hl
	ld [hli], a
	ld a, 40
	ld [hl], a
	ld de, wRoamMon1HP - wRoamMon1
	add hl, de
	xor a
	ld [hl], a
	ret
