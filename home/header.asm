; rst vectors (called through the rst instruction)

SECTION "rst0", ROM0[$0000]
Bankswitch::
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

SECTION "rst8", ROM0[$0008]
FarCall::
	ldh [hFarCallSavedA], a
	ld a, h
	ldh [hFarCallSavedH], a
	jmp RstFarCall

SECTION "rst10", ROM0[$0010]

GetScriptByte::
	push hl
	push bc
	ldh a, [hROMBank]
	push af
	jmp _GetScriptByte

SECTION "rst18", ROM0[$0018]

AddNTimes::
	and a
	ret z
	push bc
	jmp _AddNTimes

SECTION "rst20", ROM0[$0020]

CopyBytes::
	inc b
	srl c
	jmp _CopyBytes

SECTION "rst28", ROM0[$0028]

ByteFill::
	inc b
	srl c
	jmp _ByteFill

SECTION "rst30", ROM0[$0030]

PlaceString::
	jmp _PlaceString

SwapHLDE::
	push de
	ld d, h
	ld e, l
	pop hl
	ret

SECTION "rst38", ROM0[$0038]

Crash_rst38::
	crashvec ERR_RST38

SECTION "vblank", ROM0[$0040]
_VBlank::
	push af
	push bc
	push de
	push hl

	jmp VBlank

SECTION "lcd", ROM0[$0048]
_LCD::
	jr hLCDInterruptFunction

PopAFBCDEHL::
	pop af
PopBCDEHL::
	pop bc
	pop de
	pop hl
DoNothing::
	ret ; no-optimize Stub Function (global do nothing)

SECTION "timer", ROM0[$0050]
Crash_inttimer::
	crashvec ERR_INTTIMER

SECTION "serial", ROM0[$0058]
_Serial::
	push af
	push bc
	push de
	push hl

	jmp Serial

SECTION "joypad", ROM0[$0060]
Crash_intjoy::
	crashvec ERR_INTJOY

SECTION "Low ROM", ROM0[$0068]

INCLUDE "home/crash.asm"


SECTION "Header", ROM0[$0100]

Start::
; Nintendo requires all Game Boy ROMs to begin with a nop ($00) and a jp ($C3)
; to the starting address.
	nop ; no-optimize nops
	jp _Start

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00

ENDSECTION
