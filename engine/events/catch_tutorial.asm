CatchTutorial::
	ld a, [wBattleType]
	dec a
	ld c, a
	ld hl, .dw
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.dw
	dw .DudeTutorial
	dw .DudeTutorial
	dw .DudeTutorial

.DudeTutorial:
	xor a
	ldh [hJoyDown], a
	ldh [hJoyPressed], a
	ld a, [wOptions]
	push af
	and ~TEXT_DELAY_MASK
	add TEXT_DELAY_MED
	ld [wOptions], a
	ld hl, .AutoInput
	ld a, BANK(.AutoInput)
	call StartAutoInput
	farcall StartTutorialBattle
	xor a
	call StopAutoInput
	pop af

	ld [wOptions], a
	ret

.AutoInput:
	db NO_INPUT, $ff ; end
