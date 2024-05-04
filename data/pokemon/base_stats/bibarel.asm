	db 0 ; species ID placeholder

	db  79,  85,  60,  71,  55,  60
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, WATER ; type
	db 127 ; catch rate
	db 116 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db SIMPLE, UNAWARE, MOODY, MOODY ; abilities
	db GROWTH_MEDIUM_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm
	; end