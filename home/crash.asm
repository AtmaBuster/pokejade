Crash_div0::
	di
	ldh [hCrashStoreAF + 1], a
	ld a, ERR_DIV0
; fallthrough
CrashHandler::
	ldh [hCrashType], a
	ld a, BANK(_CrashHandler)
	ld [MBC3RomBank], a
	jp _CrashHandler
