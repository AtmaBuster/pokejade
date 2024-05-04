	db 0 ; species ID placeholder

	db  65,  75,  90,  44,  97, 123
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db POISON, DRAGON ; type
	db 55 ; catch rate
	db 173 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db POISON_POINT, POISON_TOUCH, ADAPTABILITY ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm
	; end