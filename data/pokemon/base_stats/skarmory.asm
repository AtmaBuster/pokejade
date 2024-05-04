	db 0 ; species ID placeholder

	db  65,  80, 140,  70,  40,  70
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, FLYING ; type
	db 25 ; catch rate
	db 168 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/skarmory/front.dimensions"
	db NO_ABILITY, NO_ABILITY, NO_ABILITY, NO_ABILITY ; abilities
	db GROWTH_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm
	; end