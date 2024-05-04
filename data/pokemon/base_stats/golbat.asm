	db 0 ; species ID placeholder

	db  75,  80,  70,  90,  65,  75
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/golbat/front.dimensions"
	db INNER_FOCUS, INNER_FOCUS, INFILTRATOR ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 250 ; base happiness
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm
	; end