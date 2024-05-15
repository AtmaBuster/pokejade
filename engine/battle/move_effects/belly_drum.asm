BattleCommand_bellydrum:
	farcall GetHalfMaxHP
	farcall CheckUserHasEnoughHP
	jr nc, .failed

	push bc
	ld b, $f0 | ATTACK
	ld a, STAT_SKIPTEXT
	call _ForceRaiseStat
	ld a, [wFailedMessage]
	and a
	pop bc
	jr nz, .failed

	push bc
	call AnimateCurrentMove
	pop bc
	farcall SubtractHPFromUser
	call UpdateUserInParty
; TO-DO : contrary
	ld hl, BellyDrumText
	jmp StdBattleTextbox

.failed
	call AnimateFailedMove
	jmp PrintButItFailed
