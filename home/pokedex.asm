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
