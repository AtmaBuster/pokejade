BattleCommand_trickroom:
	call AnimateCurrentMove
	ld a, [wTrickRoomTimer]
	and a
	jr nz, .return_to_normal
	ld a, 5
	ld [wTrickRoomTimer], a
	ld hl, TrickRoomUsedText
	jp StdBattleTextbox

.return_to_normal
	xor a
	ld [wTrickRoomTimer], a
	ld hl, TrickRoomReturnedText
	jp StdBattleTextbox
