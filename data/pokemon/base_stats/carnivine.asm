	db 0 ; species ID placeholder

	db  74, 100,  72,  46,  90,  72
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 200 ; catch rate
	db 164 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db LEVITATE, LEVITATE, LEVITATE ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm
	; end