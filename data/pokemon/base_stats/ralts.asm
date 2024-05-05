	db 0 ; species ID placeholder

	db  28,  25,  25,  40,  45,  35
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, FAIRY ; type
	db 235 ; catch rate
	db 70 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db SYNCHRONIZE, TRACE, PIXILATE ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 35 ; base happiness
	dn EGG_HUMANSHAPE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm
	; end