GetDexNumberNazoh:
	ld de, DexListNazoh
	jr GetDexNumberFromList

GetDexNumberHolon:
	ld de, DexListHolon
	jr GetDexNumberFromList

GetDexNumberNational:
	ld de, DexListNational
	; fallthrough

GetDexNumberFromList:
; gets the dex number of mon hl from list de, returns in de
	farcall _GetDexNumberFromList
	ret

CheckDexNumberNazoh:
	push hl
	call GetDexNumberNazoh
	pop hl
	ld a, d
	or e
	ret

CheckDexNumberHolon:
	push hl
	call GetDexNumberHolon
	pop hl
	ld a, d
	or e
	ret

CheckDexNumberNational:
	push hl
	call GetDexNumberNational
	pop hl
	ld a, d
	or e
	ret
