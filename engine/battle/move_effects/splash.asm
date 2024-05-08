BattleCommand_Splash:
	call AnimateCurrentMove
	farcall PlayerStats_Splash
	jmp PrintNothingHappened
