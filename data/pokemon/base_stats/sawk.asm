	db 0 ; species ID placeholder

	db  75, 125,  75,  85,  30,  75
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 163 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db STURDY, INNER_FOCUS, MOLD_BREAKER ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm
	; end