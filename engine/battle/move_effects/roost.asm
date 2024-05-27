BattleCommand_roost:
	ld a, [wAttackMissed]
	and a
	ret nz
; backs up the user's type, and removes flying type from it
; restored at the end of the turn
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_ROOST, [hl]
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonType
	ld de, wBattleMonTypeBackup
	jr z, .got_type
	ld hl, wEnemyMonType
	ld de, wEnemyMonTypeBackup
.got_type
; back up type
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a
; check if pure flying. if so, set to pure normal
	ld a, [hli]
	cp FLYING
	jr nz, .no_type_1_flying
	ld a, [hld]
	cp FLYING
	jr z, .pure_flying
; copy type 2 to type 1
	ld [hl], a
	ret

.pure_flying
; set to pure normal
	ld a, NORMAL
	ld [hli], a
	ld [hl], a
	ret

.no_type_1_flying
; check if type 2 is flying
; if so, copy type 1 to type 2
	ld b, a
	ld a, [hl]
	cp FLYING
	ret nz ; no flying type to change
	ld [hl], b
	ret
