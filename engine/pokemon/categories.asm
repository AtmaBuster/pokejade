GetMoveCategoryName:
	ld a, b
	call GetMoveAddress
	inc hl
	inc hl
	call GetFarByte

	and ~TYPE_MASK
	rlc a
	rlc a
	dec a

	ld hl, CategoryNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, wStringBuffer1
	ld bc, MOVE_NAME_LENGTH
	jmp CopyBytes

INCLUDE "data/types/category_names.asm"
