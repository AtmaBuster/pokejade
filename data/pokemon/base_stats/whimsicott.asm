	db 0 ; species ID placeholder

	db  60,  67,  85, 116,  77,  75
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FAIRY ; type
	db 75 ; catch rate
	db 168 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db PRANKSTER, INFILTRATOR, CHLOROPHYLL ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_PLANT, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm
	; end