BattleCommand_commondamagemod:
	push bc
	push de
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
	jr z, .done
	ld a, e
	farcall CompareMove
	jr z, .go_to_command
	inc hl
	inc hl
	jr .loop

.go_to_command
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	pop bc
	jp hl

.done
	pop de
	pop bc
	ret

.CommandTable:
	dw RAGE_FIST,    BattleCommand_ragefist
	dw FACADE,       BattleCommand_facade
	dw WRING_OUT,    BattleCommand_wringout
	dw ERUPTION,     BattleCommand_lifepower
	dw WATER_SPOUT,  BattleCommand_lifepower
	dw ACROBATICS,   BattleCommand_acrobatics
	dw ASSURANCE,    BattleCommand_assurance
	dw WAKE_UP_SLAP, BattleCommand_checksleep
	dw -1

BattleCommand_ragefist:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurBattleMon]
	ld hl, wPlayerRageFistCounter
	jr z, .got_it
	ld a, [wCurOTMon]
	ld hl, wEnemyRageFistCounter
.got_it
	add l
	ld l, a
	adc h
	sub l
	ld h, a

	ld a, [hl]
	and a
	ret z

	cp 6
	jr c, .counter_ok
	ld a, 6
.counter_ok
	push de
	push bc

	ld c, d
	ld b, 0
	ld hl, 0
	inc a
	rst AddNTimes

	pop bc
.div_loop
	ld a, h
	and a
	jr z, .finished

	srl h
	rr l
	srl c

	jr .div_loop

.finished
	pop de
	ld d, l
	ret

BattleCommand_facade:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret z
	bit BRN, a
	call nz, .UndoBurnAttackDrop
	jr CommonDoublePower

.UndoBurnAttackDrop:
	farcall GetUserAbility
	cp GUTS
	ret z
	jr CommonDoublePower

BattleCommand_acrobatics:
	push bc
	farcall CheckUserKnockOff
	pop bc
	jr nz, CommonDoublePower
	ldh a, [hBattleTurn]
	ld a, [wBattleMonItem]
	jr z, .got_item
	ld a, [wEnemyMonItem]
.got_item
	and a
	ret nz
	jr CommonDoublePower

BattleCommand_assurance:
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_TOOK_DAMAGE, a
	ret z
CommonDoublePower:
; double power
	sla d
	ret nc
; if overflow, double attack instead
	rr d
	sla b
	ret nc
; if overflow, halve defense instead
	rr b
	srl c
	ret nz
; if 0, set to 1
	inc c
	ret

BattleCommand_checksleep:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP_MASK
	ret z
	jr CommonDoublePower
