	db 0 ; species ID placeholder

	db  80,  75, 150,  50,  75, 150
	evs  0,   0,   2,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db STEEL, STEEL ; type
	db 3 ; catch rate
	db 215 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db CLEAR_BODY, CLEAR_BODY, LIGHT_METAL ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 35 ; base happiness
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm
	; end