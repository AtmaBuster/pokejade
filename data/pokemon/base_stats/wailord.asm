	db 0 ; species ID placeholder

	db 170,  90,  45,  60,  90,  45
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 206 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db WATER_VEIL, OBLIVIOUS, PRESSURE ; abilities
	db 0 ; unused
	db GROWTH_FLUCTUATING ; growth rate
	db 70 ; base happiness
	dn EGG_GROUND, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm
	; end