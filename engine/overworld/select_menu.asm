SelectMenu::
; check if any options are set
	ld hl, wRegisterOptions
	xor a
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jr z, RunRegisterEvent
; check if should jump to one without menu
	ld hl, wRegisterOptions
	sub [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jr nz, .show_dpad_menu
	ld a, [wRegisterOptionUp]
	jr RunRegisterEvent

.show_dpad_menu
	call ClearWindowData
	farcall ReanchorBGMap_NoOAMUpdate
	hlcoord 6, 5
	lb bc, 6, 6
	call Textbox
	call RegisterDPadMenuGraphics
	call HDMATransferTilemapAndAttrmap_Menu
	farcall LoadRegisterMenuGraphics_NoOAMUpdate
	call RegisterDPadMenuInput
	push af
	call CloseText
	pop af
	ret nc
	jr RunRegisterEvent

RegisterDPadMenuInput:
.loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and SELECT | B_BUTTON
	ret nz
	ld hl, wRegisterOptions
	ldh a, [hJoyPressed]
	bit D_UP_F, a
	jr nz, .hit
	inc hl
	bit D_DOWN_F, a
	jr nz, .hit
	inc hl
	bit D_LEFT_F, a
	jr nz, .hit
	inc hl
	bit D_RIGHT_F, a
	jr z, .loop
.hit
	ld a, [hl]
	scf
	ret

RunRegisterEvent:
	ld hl, .Events
	jmp JumpTable

.Events:
	dw Register_None
	dw Register_Item
	dw Register_FlyTeleport
	dw Register_Cut
	dw Register_SweetScent
	dw Register_Dig

Register_None:
	call OpenText
	ld b, BANK(MayRegisterOptionsText)
	ld hl, MayRegisterOptionsText
	call MapTextbox
	call WaitButton
	jmp CloseText

Register_Item:
	call CheckRegisteredItem
	jmp nc, UseRegisteredItem
	call OpenText
	ld b, BANK(MayRegisterItemText)
	ld hl, MayRegisterItemText
	call MapTextbox
	call WaitButton
	jmp CloseText

Register_FlyTeleport:
; TO-DO
	call OpenText
	ld de, ENGINE_BADGE_FLY
	farcall CheckEngineFlag
	jr c, .check_teleport

	ld hl, FLY
	farcall CheckPartyMoveIndex
	jr c, .check_teleport

	call GetMapEnvironment
	call CheckOutdoorMap
	jr nz, .fail

	xor a
	ldh [hMapAnims], a
	call LoadStandardMenuHeader
	call ClearSprites
	farcall _FlyMap
	ld a, e
	cp -1
	jr z, .illegal
	cp NUM_SPAWNS
	jr nc, .illegal

	ld [wDefaultSpawnpoint], a
	call CloseWindow

	ld a, BANK(FlyFunction.FlyScript)
	ld hl, FlyFunction.FlyScript
	call CallScript
	scf
	ret

.illegal
	call CloseWindow
	call WaitBGMap
	scf
	ret

.check_teleport
	ret

.fail
	ret

Register_Cut:
	call OpenText
	ld hl, CUT
	farcall CheckPartyMoveIndex
	jr c, .cant_cut

	ld de, ENGINE_BADGE_CUT
	farcall CheckEngineFlag
	jr c, .cant_cut

	farcall CheckMapForSomethingToCut
	jr c, .nothing_to_cut

	ld a, BANK(Script_Cut)
	ld hl, Script_Cut
	call CallScript
	scf
	ret

.nothing_to_cut
	ld b, BANK(.NothingToCutText)
	ld hl, .NothingToCutText
	jr .fail_cut

.cant_cut
	ld b, BANK(Select_NoMonWithMoveText)
	ld hl, Select_NoMonWithMoveText
	jr .fail_cut

.no_badge
	ld b, BANK(Select_NoBadgeText)
	ld hl, Select_NoBadgeText
.fail_cut
	call MapTextbox
	call WaitButton
	call CloseText
	scf
	ret

.NothingToCutText:
	text_far _CutNothingOWText
	text_end

Select_NoMonWithMoveText:
	text_far _NoMonWithMoveText
	text_end

Select_NoBadgeText:
	text_far _BadgeRequiredText
	text_end

Register_SweetScent:
	call OpenText
	ld hl, SWEET_SCENT
	farcall CheckPartyMoveIndex
	jr c, .no_sweet_scent

	ld a, BANK(SweetScentFromMenu.SweetScent_NoRefresh)
	ld hl, SweetScentFromMenu.SweetScent_NoRefresh
	call CallScript
	scf
	ret

.no_sweet_scent
	ld b, BANK(Select_NoMonWithMoveText)
	ld hl, Select_NoMonWithMoveText
	call MapTextbox
	call WaitButton
	call CloseText
	scf
	ret

Register_Dig:
	call OpenText
	ld hl, DIG
	farcall CheckPartyMoveIndex
	jr c, .no_dig
	call GetMapEnvironment
	cp CAVE
	jr z, .incave
	cp DUNGEON
	jr z, .incave
.fail
	ld b, BANK(EscapeRopeOrDig.CantUseDigText)
	ld hl, EscapeRopeOrDig.CantUseDigText
.fail_msg
	call MapTextbox
	call WaitButton
	call CloseText
	scf
	ret

.no_dig
	ld b, BANK(Select_NoMonWithMoveText)
	ld hl, Select_NoMonWithMoveText
	jr .fail_msg

.incave
	ld hl, wDigWarpNumber
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail

	ld hl, wDigWarpNumber
	ld de, wNextWarp
	ld bc, 3
	rst CopyBytes
	farcall GetPartyNickname
	ld a, BANK(EscapeRopeOrDig.UsedDigScript_NoRefresh)
	ld hl, EscapeRopeOrDig.UsedDigScript_NoRefresh
	call CallScript
	scf
	ret

MayRegisterItemText:
	text_far _MayRegisterItemText
	text_end

MayRegisterOptionsText:
	text_far _MayRegisterOptionsText
	text_end

RegisterDPadMenuGraphics:
	hlcoord 9, 8
	ld a, $80
	call .CopyGraphic

	decoord 9, 6
	ld a, [wRegisterOptionUp]
	call .PutGraphic
	decoord 9, 10
	ld a, [wRegisterOptionDown]
	call .PutGraphic
	decoord 7, 8
	ld a, [wRegisterOptionLeft]
	call .PutGraphic
	decoord 11, 8
	ld a, [wRegisterOptionRight]
.PutGraphic:
	push de
	call .GetGraphicIndex
	pop de
	add a
	add a
	add $84
	ld h, d
	ld l, e
.CopyGraphic:
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	ld [hli], a
	inc a
	ld [hl], a
	ret

.GetGraphicIndex:
	ld c, a
	add a
	ld hl, .Events
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Events:
	dw .EvNone
	dw .EvItem
	dw .EvFlyTeleport
	dw .EvCut
	dw .EvSweetScent
	dw .EvDig

.EvItem
	call CheckRegisteredItem
	jr c, .EvNone
	ld a, REGISTERED_ITEM
	ret

.EvCut
	ld hl, CUT
	farcall CheckPartyMoveIndex
	jr c, .EvNone
	ld a, REGISTERED_CUT
	ret

.EvFlyTeleport
	ld de, ENGINE_BADGE_FLY
	farcall CheckEngineFlag
	jr c, .EvTeleport
	ld hl, FLY
	farcall CheckPartyMoveIndex
	jr c, .EvTeleport
	ld a, REGISTERED_FLY_TELEPORT
	ret

.EvTeleport
	ld hl, TELEPORT
	farcall CheckPartyMoveIndex
	jr c, .EvNone
	ld a, REGISTERED_TELEPORT_ICON
	ret

.EvSweetScent
	ld hl, SWEET_SCENT
	farcall CheckPartyMoveIndex
	jr c, .EvNone
	ld a, REGISTERED_SWEET_SCENT
	ret

.EvDig
	ld hl, DIG
	farcall CheckPartyMoveIndex
	jr c, .EvNone
	ld a, REGISTERED_DIG
	ret

.EvNone
	xor a
	ret

CheckRegisteredItem:
	ld a, [wWhichRegisteredItem]
	and a
	jr z, .NoRegisteredItem
	and REGISTERED_POCKET
	rlca
	rlca
	ld hl, .Pockets
	jmp JumpTable

.Pockets:
; entries correspond to *_POCKET constants
	dw .CheckItem
	dw .CheckBall
	dw .CheckKeyItem
	dw .CheckTMHM

.CheckItem:
	ld hl, wNumItems
	call .CheckRegisteredNo
	jr c, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	call .IsSameItem
	jr c, .NoRegisteredItem
	and a
	ret

.CheckKeyItem:
	ld a, [wRegisteredItem]
	call GetItemIndexFromID
	ld a, l
	ld hl, wKeyItems
	call IsInByteArray
	jr nc, .NoRegisteredItem
	ld a, [wRegisteredItem]
	ld [wCurItem], a
	and a
	ret

.CheckBall:
	ld hl, wNumBalls
	call .CheckRegisteredNo
	jr nc, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	call .IsSameItem
	jr c, .NoRegisteredItem
	ret

.CheckTMHM:
; fallthrough
.NoRegisteredItem:
	xor a
	ld [wWhichRegisteredItem], a
	ld [wRegisteredItem], a
	scf
	ret

.CheckRegisteredNo:
	ld a, [wWhichRegisteredItem]
	and REGISTERED_NUMBER
	dec a
	cp [hl]
	jr nc, .NotEnoughItems
	ld [wCurItemQuantity], a
	and a
	ret

.NotEnoughItems:
	scf
	ret

.IsSameItem:
	ld a, [wRegisteredItem]
	cp [hl]
	jr nz, .NotSameItem
	ld [wCurItem], a
	and a
	ret

.NotSameItem:
	scf
	ret

UseRegisteredItem:
	farcall CheckItemMenu
	ld a, [wItemAttributeValue]
	ld hl, .SwitchTo
	jmp JumpTable

.SwitchTo:
; entries correspond to ITEMMENU_* constants
	dw .CantUse
	dw .NoFunction
	dw .NoFunction
	dw .NoFunction
	dw .Current
	dw .Party
	dw .Overworld

.NoFunction:
	call OpenText
	call CantUseItem
	call CloseText
	and a
	ret

.Current:
	call OpenText
	call DoItemEffect
	call CloseText
	and a
	ret

.Party:
	call ReanchorMap
	call FadeToMenu
	call DoItemEffect
	call CloseSubmenu
	call CloseText
	and a
	ret

.Overworld:
	call ReanchorMap
	ld a, 1
	ld [wUsingItemWithSelect], a
	call DoItemEffect
	xor a
	ld [wUsingItemWithSelect], a
	ld a, [wItemEffectSucceeded]
	cp 1
	jr nz, ._cantuse
	scf
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.CantUse:
	call ReanchorMap

._cantuse
	call CantUseItem
	call CloseText
	and a
	ret
