	db 0 ; species ID placeholder

	db  48,  61,  40,  50,  61,  40
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, GROUND ; type
	db 140 ; catch rate
	db 83 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/croagunk/front.dimensions"
	db ANTICIPATION, DRY_SKIN, POISON_TOUCH ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 100 ; base happiness
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm
	; end