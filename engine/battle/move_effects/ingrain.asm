BattleCommand_ingrain:
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	bit SUBSTATUS_INGRAIN, [hl]
	jmp nz, FailMove
	set SUBSTATUS_INGRAIN, [hl]
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	set SUBSTATUS_CANT_RUN, [hl]
	farcall AnimateCurrentMove
	ld hl, PlantedRootsText
	jmp StdBattleTextbox
