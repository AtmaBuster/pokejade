	db 0 ; species ID placeholder

	db  71,  73,  88,  59, 120,  89
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 55 ; catch rate
	db 100 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db MEGALAUNCHER, MEGALAUNCHER, MEGALAUNCHER ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm
	; end