MarvelScaleCheck:
; check ablility
	push bc
	ld bc, -20 ; careful
	add hl, bc
	pop bc
	ld a, [hl]
	cp MARVEL_SCALE
	ret nz
; check stats
	push bc
	ld bc, 11 ; careful 2
	add hl, bc
	pop bc
	ld a, [hl]
	and a
	ret z
; defense *= 1.5
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld b, h
	ld c, l
	ret

GutsToxicBoostCheck:
	cp GUTS
	jr z, .guts
	cp TOXIC_BOOST
	ret nz
;toxic_boost
	bit PSN, e
	jr nz, .mul
	ret

.guts
	ld a, e
	and a
	ret z
.mul
	push bc
	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc
	pop bc
	ret

