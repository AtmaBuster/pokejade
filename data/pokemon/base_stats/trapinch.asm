	db 0 ; species ID placeholder

	db  45, 100,  45,  10,  45,  45
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 73 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/trapinch/front.dimensions"
	db HYPER_CUTTER, ARENA_TRAP, SHEER_FORCE ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_BUG, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm
	; end