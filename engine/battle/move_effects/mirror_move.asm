BattleCommand_mirrormove:
	call ClearLastMove

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed

	call CheckUserMove
	jr nz, .use

.failed
	call AnimateFailedMove

	ld hl, MirrorMoveFailedText
	call StdBattleTextbox
	jmp EndMoveEffect

.use
	ld a, b
	ld [hl], a
	ld [wNamedObjectIndex], a

	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l
	pop af

	call GetMoveData
	call GetMoveName
	call CopyName1
	call CheckUserIsCharging
	jr nz, .done

	ld a, [wBattleAnimParam]
	push af
	call BattleCommand_lowersub
	pop af
	ld [wBattleAnimParam], a

.done
	call BattleCommand_movedelay
	jmp ResetTurn
