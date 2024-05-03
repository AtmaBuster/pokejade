BattleCommand_Libra:
	call AnimateCurrentMove
	ld hl, LibraText
	call StdBattleTextbox
	ld hl, wEnemyMonType
	ldh a, [hBattleTurn]
	and a
	jr z, .got_var
	ld hl, wBattleMonType
.got_var
	ld a, [hli]
	cp [hl]
	jr z, .single_type

	ld a, [hld]
	ld [wNamedObjectIndex], a
	push hl
	farcall GetTypeName
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, STRING_BUFFER_LENGTH
	rst CopyBytes
	pop hl
	ld a, [hl]
	ld [wNamedObjectIndex], a
	farcall GetTypeName

	ld hl, LibraTypeDualText
	jmp StdBattleTextbox

.single_type
	ld [wNamedObjectIndex], a
	farcall GetTypeName
	ld hl, LibraTypeSingleText
	jmp StdBattleTextbox
