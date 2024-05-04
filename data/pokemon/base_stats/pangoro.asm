	db 0 ; species ID placeholder

	db  95, 124,  78,  58,  69,  71
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, DARK ; type
	db 65 ; catch rate
	db 173 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db IRON_FIST, MOLD_BREAKER, SCRAPPY ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_GROUND, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm
	; end