BattleCommand_clearhazards:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr z, .not_leeched
	res SUBSTATUS_LEECH_SEED, [hl]
	ld hl, ShedLeechSeedText
	call StdBattleTextbox
.not_leeched

	ld hl, wPlayerScreens
	ld de, wPlayerWrapCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_wrap
	ld hl, wEnemyScreens
	ld de, wEnemyWrapCount
.got_screens_wrap
	ld a, [hl]
	and SCREENS_SPIKES_MASK
	jr z, .no_spikes
	ld a, [hl]
	and ~SCREENS_SPIKES_MASK
	ld [hl], a
	push de
	push hl
	ld hl, BlewSpikesText
	call StdBattleTextbox
	pop hl
	pop de
.no_spikes
	bit SCREENS_STEALTH_ROCK, [hl]
	jr z, .no_stealth_rock
	res SCREENS_STEALTH_ROCK, [hl]
	push de
	push hl
	ld hl, BlewRockText
	call StdBattleTextbox
	pop hl
	pop de
.no_stealth_rock
	ld a, [hl]
	and SCREENS_TOXIC_SPIKES_MASK
	jr z, .no_toxic_spikes
	ld a, [hl]
	and ~SCREENS_TOXIC_SPIKES_MASK
	ld [hl], a
	ld hl, BlewToxicSpikesText
	push de
	call StdBattleTextbox
	pop de
.no_toxic_spikes
	ld a, [de]
	and a
	ret z
	xor a
	ld [de], a
	ld hl, ReleasedByText
	jmp StdBattleTextbox
