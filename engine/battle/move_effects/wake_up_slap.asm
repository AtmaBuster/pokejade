BattleCommand_wakeupslap:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld a, [hl]
	and SLP_MASK
	ret z
	xor a
	ld [hl], a
	ld hl, WokeUpText
	call SwitchTurn
	call StdBattleTextbox
	jmp SwitchTurn
