	db 0 ; species ID placeholder

	db  75,  50,  80,  65,  95,  90
	evs  0,   0,   0,   0,   1,   1
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 147 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db LEVITATE, LEVITATE, LEVITATE ; abilities
	db 0 ; unused
	db GROWTH_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm
	; end