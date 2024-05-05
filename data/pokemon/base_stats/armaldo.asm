	db 0 ; species ID placeholder

	db  75, 125, 100,  45,  70,  80
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, BUG ; type
	db 45 ; catch rate
	db 199 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db BATTLE_ARMOR, BATTLE_ARMOR, SWIFT_SWIM ; abilities
	db 0 ; unused
	db GROWTH_ERRATIC ; growth rate
	db 70 ; base happiness
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm
	; end