	db 0 ; species ID placeholder

	db 100, 123,  75,  80,  57,  75
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 179 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db KEEN_EYE, SHEER_FORCE, DEFIANT ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm
	; end