	db 0 ; species ID placeholder

	db 110, 160, 110, 100,  80, 110
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 3 ; catch rate
	db 220 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db SLOW_START, SLOW_START, SLOW_START ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 0 ; base happiness
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm
	; end