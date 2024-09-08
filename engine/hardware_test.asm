HardwareTest:
	call MBC30_ROMTest
	jr nc, .no_MBC30_ROM
	ld hl, hHWType
	set HW_MBC30_ROM, [hl]
.no_MBC30_ROM
	call MBC30_RAMTest
	jr nc, .no_MBC30_RAM
	ld hl, hHWType
	set HW_MBC30_RAM, [hl]
.no_MBC30_RAM
	ret

PUSHS

DEF HW_TEST_STRING_1 EQUS "\"MOTTO TAKAMETE HATENAKU\""
DEF HW_TEST_STRING_2 EQUS "\"KOKORO NO OKU MADE\""
DEF HW_TEST_STRING_3 EQUS "\"ANATA DAKE GA TSUKAERU\""
DEF HW_TEST_STRING_4 EQUS "\"TEKUNUKKU DE TOKASHITSUKUSHITE\""

PUSHC
setcharmap ascii

SECTION "Hardware Test String 1", ROMX[$4000], BANK[$01]
HWTestString1:
	db HW_TEST_STRING_1
.end

SECTION "Hardware Test String 2", ROMX[$4000], BANK[$80]
HWTestString2:
	db HW_TEST_STRING_2
.end

SECTION "Hardware Test String 3", ROMX[$4000], BANK[$81]
HWTestString3:
	db HW_TEST_STRING_3
.end

SECTION "Hardware Test String 4", ROMX[$4000], BANK[$FF]
HWTestString4:
	db HW_TEST_STRING_4
.end

POPS

MACRO test_string
	ld a, BANK(\1)
	ld hl, \1
	ld bc, \1.end - \1
	ld de, wStringBuffer1
	call FarCopyBytes

	ld hl, wStringBuffer1
	ld de, \1_Check
	ld c, \1.end - \1
	call .CheckTestString
	jr nz, .fail
ENDM

MBC30_ROMTest:
; Test 1: test string 1 @ 01:4000
	test_string HWTestString1
; Test 2: test string 2 @ 80:4000
	test_string HWTestString2
; Test 3: test string 3 @ 81:4000
	test_string HWTestString3
; Test 4: test string 4 @ FF:4000
	test_string HWTestString4

	scf
	ret

.fail
	and a
	ret

.CheckTestString:
; compares c bytes from hl and de
; returns z if identical, nz if not
.loop
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	cp b
	ret nz
	dec c
	jr nz, .loop
	ret

HWTestString1_Check:
	db HW_TEST_STRING_1
HWTestString2_Check:
	db HW_TEST_STRING_2
HWTestString3_Check:
	db HW_TEST_STRING_3
HWTestString4_Check:
	db HW_TEST_STRING_4

POPC

MBC30_RAMTest:
; Test 1: check for proper RAM size in header
	ld a, [$0149] ; Header RAM size
	cp $04
	jr nz, .fail

; Test 2: check for SRAM working *at all*
	xor a ; ld a, 0
	call OpenSRAM

	ld de, $BFC0 ; TO-DO
	ld hl, .TestString1
	call .WriteTestString

	ld de, $BFC0 ; TO-DO
	ld hl, .TestString1
	call .CheckTestString

	call CloseSRAM
	jr nz, .fail

; Test 3: check for SRAM bank 4
	ld a, 4
	call OpenSRAM

	ld de, $BFC0 ; TO-DO
	ld hl, .TestString2
	call .WriteTestString

	ld de, $BFC0 ; TO-DO
	ld hl, .TestString2
	call .CheckTestString

	call CloseSRAM
	jr nz, .fail

; Test 4: check that SRAM bank 0 was NOT overwritten
	xor a ; ld a, 0
	call OpenSRAM

	ld de, $BFC0 ; TO-DO
	ld hl, .TestString1
	call .CheckTestString

	call CloseSRAM
	jr nz, .fail

	scf
	ret

.fail
	and a
	ret

.WriteTestString:
	ld b, 16
:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, :-
	ret

.CheckTestString:
	ld b, 16
:
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec b
	jr nz, :-
	ret

.TestString1
	db "POKéMON JADE VER"
.TestString2
	db "MBC30 SRAM CHECK"
