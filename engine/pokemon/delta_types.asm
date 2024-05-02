GetDeltaTypes::
	ld a, [wCurSpecies]
	call GetPokemonIndexFromID
	dec hl
	add hl, hl
	ld de, DeltaTypePointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurDeltaIndex]
	and MON_DELTA_MASK
	swap a
	rrca
	and a
	ret z
	ld c, a
.loop
	dec c
	jr z, .got_type
	ld a, [hli]
	cp -1
	ret z
	inc hl
	jr .loop

.got_type
	ld a, [hli]
	cp -1
	ret z
	ld [wBaseType1], a
	ld a, [hl]
	ld [wBaseType2], a
	ret

INCLUDE "data/pokemon/delta_types.asm"
