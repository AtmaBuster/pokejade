	db 0 ; species ID placeholder

	db  60,  45,  70,  95,  45,  90
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 200 ; catch rate
	db 120 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db RUN_AWAY, PICKUP, VOLT_ABSORB ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 100 ; base happiness
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm
	; end