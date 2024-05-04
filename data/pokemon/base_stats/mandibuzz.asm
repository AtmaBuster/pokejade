	db 0 ; species ID placeholder

	db 110,  65, 105,  80,  55,  95
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
	db 60 ; catch rate
	db 179 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F100 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db BIG_PECKS, OVERCOAT, WEAK_ARMOR ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm
	; end