	db 0 ; species ID placeholder

	db  95,  65, 110,  65,  60, 130
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 45 ; catch rate
	db 197 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/umbreon/front.dimensions"
	db SYNCHRONIZE, SYNCHRONIZE, INNER_FOCUS ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 35 ; base happiness
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm
	; end