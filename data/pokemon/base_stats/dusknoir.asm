	db 0 ; species ID placeholder

	db  45, 100, 135,  45,  65, 135
	evs  0,   0,   1,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 45 ; catch rate
	db 210 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db PRESSURE, PRESSURE, FRISK ; abilities
	db 0 ; unused
	db GROWTH_FAST ; growth rate
	db 35 ; base happiness
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm
	; end