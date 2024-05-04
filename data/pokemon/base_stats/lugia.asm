	db 0 ; species ID placeholder

	db 106,  90, 130, 110,  90, 154
	evs  0,   0,   0,   0,   0,   3
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, FLYING ; type
	db 3 ; catch rate
	db 220 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/lugia/front.dimensions"
	db NO_ABILITY, NO_ABILITY, NO_ABILITY, NO_ABILITY ; abilities
	db GROWTH_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm
	; end