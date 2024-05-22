BattleCommand_gastroacid:
	ld a, [wAttackMissed]
	and a
	jmp nz, FailMove
	farcall GetOpponentAbility
	cp DISGUISE
	jmp z, FailMove
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	set SUBSTATUS_GASTRO_ACID, [hl]
	call AnimateCurrentMove
	ld hl, GastroAcidText
	jmp StdBattleTextbox
