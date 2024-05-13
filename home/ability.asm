CheckFieldAbility:
	push bc
	push de
	push hl
	call _CheckFieldAbility
	pop hl
	pop de
	pop bc
	ret

_CheckFieldAbility:
; checks if ability a should be active
; returns carry if any lead party mon, up to and including the first non-fainted one, has that ability
; also returns the relevant mon's level in a
	ld e, a
	ld a, [wPartyCount]
	and a
	ret z

	ld d, 0
.loop
	ld a, d
	ld hl, wPartyMon1Ability
	call GetPartyLocation
	ld a, [hl]
	cp e
	jr z, .ok
	ld bc, MON_HP - MON_ABILITY
	add hl, bc
	ld a, [hli]
	or [hl]
	ret nz
	inc d
	jr .loop

.ok
	ld bc, MON_LEVEL - MON_ABILITY
	add hl, bc
	ld a, [hl]
	scf
	ret

CheckFirstFieldAbility:
	ld e, a
	ld a, [wPartyCount]
	and a
	ret z
	ld hl, wPartyMon1Ability
	ld a, [hl]
	cp e
	jr z, .ok
	and a
	ret

.ok
	ld a, [wPartyMon1Level]
	scf
	ret
