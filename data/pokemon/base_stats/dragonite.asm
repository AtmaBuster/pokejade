	db 0 ; species ID placeholder

	db  91, 134,  95,  80, 100, 100
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp
	dw NO_ITEM, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	db NO_ABILITY, NO_ABILITY, NO_ABILITY, NO_ABILITY ; abilities
	db GROWTH_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm
	; end