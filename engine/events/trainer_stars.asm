UpdateTrainerStars:
	ld hl, wTrainerStars
; check Hall of Fame
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr z, .no_hall_of_fame
	set TRAINER_STAR_HALLOFFAME_F, [hl]
.no_hall_of_fame
; check Pokedex
	bit TRAINER_STAR_POKEDEX_F, [hl]
	jr nz, .no_pokedex ; already set, don't waste time checking
	push hl
	ld hl, wPokedexCaught
	ld bc, 400 / 8 ; check first 400 mons
	call CountSetBits16
	ld h, b
	ld l, c
	cphl16 400
	pop hl
	jr c, .no_pokedex
	set TRAINER_STAR_POKEDEX_F, [hl]
.no_pokedex
; TO-DO : 3 more stars
	ret

CountTrainerStars:
	push hl
	push de
	push bc
	call UpdateTrainerStars
	ld a, [wTrainerStars]
	ld c, 0
	ld b, 5
.loop
	srl a
	jr nc, .no_carry
	inc c
.no_carry
	dec b
	jr nz, .loop
	ld a, c
	jmp PopBCDEHL
