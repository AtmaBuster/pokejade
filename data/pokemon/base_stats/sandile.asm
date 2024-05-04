	db 0 ; species ID placeholder

	db  50,  72,  35,  65,  35,  35
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, DARK ; type
	db 180 ; catch rate
	db 58 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db INTIMIDATE, MOXIE, ANGER_POINT ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm
	; end