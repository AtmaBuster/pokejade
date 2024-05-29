BattleCommand_tailwind:
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerTailwindTimer
	jr z, .got_timer
	ld hl, wEnemyTailwindTimer
.got_timer
	ld [hl], 4
	farcall AnimateCurrentMove
	ld hl, TailwindBlewText
	jmp StdBattleTextbox
