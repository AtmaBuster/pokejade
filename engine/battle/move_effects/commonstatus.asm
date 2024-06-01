BattleCommand_simplestatus:
	ld hl, .CommandTable
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld e, a
.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	and c
	inc a
	ret z
	ld a, e
	call CompareMove
	jr z, .go_to_command
	inc hl
	inc hl
	inc hl
	jr .loop

.go_to_command
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	cp BANK(@)
	jp nz, FarCall_hl
	jp hl

MACRO statuscommand
	dw \1
	dba \2
ENDM
.CommandTable
	statuscommand TAUNT, BattleCommand_taunt
	statuscommand YAWN,  BattleCommand_yawn
	dw -1

BattleCommand_taunt:
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerTauntTimer
	jr z, .got_timer
	ld hl, wEnemyTauntTimer
.got_timer
	ld a, [hl]
	and a
	jr nz, .fail
	ld [hl], 3
	ld hl, TauntText
	jmp StdBattleTextbox

.fail
	farjp FailMove

BattleCommand_yawn:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .fail
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .fail
	ld a, BATTLE_VARS_SUBSTATUS6_OPP
	call GetBattleVarAddr
	ld a, [hl]
	and %11 ; yawn flags
	jr nz, .fail
	ldh a, [hBattleTurn]
	and a
	ld de, wEnemyScreens
	jr z, .go
	ld de, wPlayerScreens
.go
	ld a, [de]
	bit SCREENS_SAFEGUARD, a
	jr nz, .fail

	ld a, 2
	or [hl]
	ld [hl], a
	farcall AnimateCurrentMove
	ld hl, YawnText
	jmp StdBattleTextbox

.fail
	farjp FailMove
