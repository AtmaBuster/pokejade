	db 0 ; species ID placeholder

	db  70,  55,  75,  60,  45,  65
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
	db 190 ; catch rate
	db 74 ; base exp
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