	db 0 ; species ID placeholder

	db 100, 100, 125,  50, 110,  50
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 30 ; catch rate
	db 211 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db CHLOROPHYLL, LEAF_GUARD, REGENERATOR ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm
	; end