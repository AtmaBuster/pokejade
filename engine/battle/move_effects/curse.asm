BattleCommand_curse:
	ld de, wBattleMonType1
	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld de, wEnemyMonType1
	ld bc, wEnemyStatLevels

.go

; Curse is different for Ghost-types.

	ld a, [de]
	cp GHOST
	jr z, .ghost
	inc de
	ld a, [de]
	cp GHOST
	jr z, .ghost

; Raise Attack and Defense, and lower Speed.
	ld a, 1
	ld [wBattleAnimParam], a
	ld b, SPEED
	call ForceLowerStat
	ld b, ATTACK
	call ForceRaiseStat
	ld b, DEFENSE
	jmp ForceRaiseStat

.ghost

; Cut HP in half and put a curse on the opponent.

	call CheckHiddenOpponent
	jr nz, .failed

	call CheckSubstituteOpp
	jr nz, .failed

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
	jr nz, .failed

	set SUBSTATUS_CURSE, [hl]
	call AnimateCurrentMove
	ld hl, GetHalfMaxHP
	call CallBattleCore
	ld hl, SubtractHPFromUser
	call CallBattleCore
	call UpdateUserInParty
	ld hl, PutACurseText
	jmp StdBattleTextbox

.failed
	call AnimateFailedMove
	jmp PrintButItFailed
