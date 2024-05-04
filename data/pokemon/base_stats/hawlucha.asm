	db 0 ; species ID placeholder

	db  78,  92,  75, 118,  74,  63
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FLYING ; type
	db 100 ; catch rate
	db 175 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db LIMBER, UNBURDEN, MOLD_BREAKER ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_FLYING, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm
	; end