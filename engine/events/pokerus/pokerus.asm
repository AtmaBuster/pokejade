GivePokerusAndConvertBerries:
	call ConvertBerriesToBerryJuice
	call ApplyPickup
	call ApplyHoneyGather
	ld hl, wPartyMon1PokerusStatus
	ld a, [wPartyCount]
	ld b, a
	ld de, PARTYMON_STRUCT_LENGTH
; Check to see if any of your Pokemon already has Pokerus.
; If so, sample its spread through your party.
; This means that you cannot get Pokerus de novo while
; a party member has an active infection.
.loopMons
	ld a, [hl]
	and $f
	jr nz, .TrySpreadPokerus
	add hl, de
	dec b
	jr nz, .loopMons

; If we haven't been to Goldenrod City at least once,
; prevent the contraction of Pokerus.
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_REACHED_GOLDENROD_F, [hl]
	ret z
	call Random
	ldh a, [hRandomAdd]
	and a
	ret nz
	ldh a, [hRandomSub]
	cp 3
	ret nc ; 3/65536 chance (00 00, 00 01 or 00 02)
	ld a, [wPartyCount]
	ld b, a
.randomMonSelectLoop
	call Random
	and $7
	cp b
	jr nc, .randomMonSelectLoop
	ld hl, wPartyMon1PokerusStatus
	call GetPartyLocation ; get pokerus byte of random mon
	ld a, [hl]
	and $f0
	ret nz ; if it already has pokerus, do nothing
.randomPokerusLoop ; Simultaneously sample the strain and duration
	call Random
	and a
	jr z, .randomPokerusLoop
	ld b, a
	and $f0
	jr z, .load_pkrs
	ld a, b
	and $7
	inc a
.load_pkrs
	ld b, a ; this should come before the label
	swap b
	and $3
	inc a
	add b
	ld [hl], a
	ret

.TrySpreadPokerus:
	call Random
	cp 33 percent + 1
	ret nc ; 1/3 chance

	ld a, [wPartyCount]
	cp 1
	ret z ; only one mon, nothing to do

	ld c, [hl]
	ld a, b
	cp 2
	jr c, .checkPreviousMonsLoop ; no more mons after this one, go backwards

	call Random
	cp 50 percent + 1
	jr c, .checkPreviousMonsLoop ; 1/2 chance, go backwards
.checkFollowingMonsLoop
	add hl, de
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z ; if mon has cured pokerus, stop searching
	dec b ; go on to next mon
	ld a, b
	cp 1
	jr nz, .checkFollowingMonsLoop ; no more mons left
	ret

.checkPreviousMonsLoop
	ld a, [wPartyCount]
	cp b
	ret z ; no more mons
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z ; if mon has cured pokerus, stop searching
	inc b ; go on to next mon
	jr .checkPreviousMonsLoop

.infectMon
	ld a, c
	and $f0
	ld b, a
	ld a, c
	swap a
	and $3
	inc a
	add b
	ld [hl], a
	ret

ConvertBerriesToBerryJuice:
; If we haven't been to Goldenrod City at least once,
; prevent Shuckle from turning held Berry into Berry Juice.
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_REACHED_GOLDENROD_F, [hl]
	ret z
	call Random
	cp 1 out_of 16 ; 6.25% chance
	ret nc
	ld hl, SHUCKLE
	call GetPokemonIDFromIndex
	ld [wTempSpecies], a
	ld hl, wPartyMons
	ld a, [wPartyCount]
.partyMonLoop
	push af
	push hl
	ld a, [wTempSpecies]
	cp [hl]
	jr nz, .loopMon
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	push hl
	call GetItemIndexFromID
	cphl16 BERRY
	pop hl
	jr z, .convertToJuice

.loopMon
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop af
	dec a
	jr nz, .partyMonLoop
.done
	xor a
	ld [wTempSpecies], a
	ret

.convertToJuice
	push hl
	ld hl, BERRY_JUICE
	call GetItemIDFromIndex
	pop hl
	ld [hl], a
	pop hl
	pop af
	jr .done

ApplyPickup:
	ld hl, wPartyMon1Ability
	ld a, [wPartyCount]
	ld c, a
.party_loop
	ld a, [hl]
	cp PICKUP
	call z, .TryPickup
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec c
	jr nz, .party_loop
	ret

.TryPickup:
	push bc
	push hl

	ld bc, MON_ITEM - MON_ABILITY
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .done

	call Random2
	ldh a, [hRand32 + 2]
	;cp 10 percent
	cp 90 percent
	jr nc, .done

; find item slot
	push hl
	ld hl, PickupTable_SlotPercents
	ldh a, [hRand32 + 3]
	ld d, a
	ld e, 0
.item_slot_loop
	ld a, [hli]
	cp d
	jr nc, .got_slot
	inc e
	jr .item_slot_loop
.got_slot
	pop hl
	push hl
	ld bc, MON_LEVEL - MON_ITEM
	add hl, bc
	ld a, [hl]
	dec a
	ld c, 10
	call SimpleDivide
	ld d, b

	ld a, e
	cp 9
	ld hl, PickupTable_Common
	jr c, .got_table
	sub 9
	ld hl, PickupTable_Rare
.got_table
	add d
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	call GetItemIDFromIndex

	pop hl
	ld [hl], a

.done
	pop hl
	pop bc
	ret

INCLUDE "data/pokemon/pickup_table.asm"

ApplyHoneyGather:
	ld hl, wPartyMon1Ability
	ld a, [wPartyCount]
	ld c, a
.party_loop
	ld a, [hl]
	cp HONEY_GATHER
	call z, .TryHoney
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec c
	jr nz, .party_loop
	ret

.TryHoney:
	push bc
	push hl

	ld bc, MON_ITEM - MON_ABILITY
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .done

	ld a, 100
	call RandomRange
	inc a
	ld e, a
	push hl
	ld bc, MON_LEVEL - MON_ITEM
	add hl, bc
	ld a, [hl]
	pop hl

	srl a
	and a
	jr nz, .got_pcnt
	inc a
.got_pcnt
	cp e
	jr c, .done

	push hl
	ld hl, MASTER_BALL ; TO-DO
	call GetItemIDFromIndex
	pop hl
	ld [hl], a

.done
	pop hl
	pop bc
	ret
