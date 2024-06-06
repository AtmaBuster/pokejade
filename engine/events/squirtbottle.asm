_WailmerPail:
	ld hl, .WailmerPailScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.WailmerPailScript:
	end

; TO-DO
	refreshmap
	special UpdateTimePals
	callasm .CheckCanUseWailmerPail
	end

.CheckCanUseWailmerPail:
	jr .nope

	farcall GetFacingObject
	jr c, .nope

	ld a, 1
	ld [wScriptVar], a
	ret

.nope
	xor a
	ld [wScriptVar], a
	ret
