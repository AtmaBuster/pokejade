PickupTable_Common:
	dw POTION
	dw ANTIDOTE
	dw SUPER_POTION
	dw GREAT_BALL
	dw REPEL
	dw ESCAPE_ROPE
	dw X_ATTACK
	dw FULL_HEAL
	dw ULTRA_BALL
	dw HYPER_POTION
	dw RARE_CANDY
	dw PROTEIN
	dw REVIVE
	dw HP_UP
	dw FULL_RESTORE
	dw MAX_REVIVE
	dw PP_UP
	dw MAX_ELIXER

PickupTable_Rare:
	dw HYPER_POTION
	dw NUGGET
	dw KINGS_ROCK
	dw FULL_RESTORE
	dw ETHER
	dw STAR_PIECE
	dw TM01 + 44 - 1
	dw ELIXER
	dw TM01 +  1 - 1
	dw LEFTOVERS
	dw TM01 + 26 - 1

PickupTable_SlotPercents:
	db 30 percent
	db 40 percent
	db 50 percent
	db 60 percent
	db 70 percent
	db 80 percent
	db 90 percent
	db 94 percent
	db 98 percent
	db 99 percent
	db 100 percent
