BattleCommand_splash:
	call AnimateCurrentMove
	farcall PlayerStats_Splash
	jmp PrintNothingHappened
