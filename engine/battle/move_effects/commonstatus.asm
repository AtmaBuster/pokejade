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
