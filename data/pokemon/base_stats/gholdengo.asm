	db 0 ; species ID placeholder

	db  87,  60,  95,  84, 133,  91
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, GHOST ; type
	db 45 ; catch rate
	db 200 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 50 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db GOOD_AS_GOLD, GOOD_AS_GOLD, GOOD_AS_GOLD ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm
	; end