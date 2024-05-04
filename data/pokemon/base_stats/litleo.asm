	db 0 ; species ID placeholder

	db  65,  50,  58,  72,  73,  54
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, NORMAL ; type
	db 220 ; catch rate
	db 74 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F87_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db RIVALRY, UNAWARE, MOXIE ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm
	; end