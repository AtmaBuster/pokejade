BattleCommand_startsandstorm:
	ld b, WEATHER_SANDSTORM
	ld hl, SandstormBrewedText
	jr StartWeather

BattleCommand_startsun:
	ld b, WEATHER_SUN
	ld hl, SunGotBrightText
	jr StartWeather

BattleCommand_startrain:
	ld b, WEATHER_RAIN
	ld hl, DownpourText
	jr StartWeather

BattleCommand_starthail:
	ld b, WEATHER_HAIL
	ld hl, ItStartedToHailText
StartWeather:
	ld a, [wBattleWeather]
	cp b
	jr z, .failed

	ld a, b
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	call AnimateCurrentMove
	call StdBattleTextbox
	farjp UpdateCastform

.failed
	call AnimateFailedMove
	jmp PrintButItFailed
