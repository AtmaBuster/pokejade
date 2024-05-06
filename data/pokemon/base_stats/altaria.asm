	db 0 ; species ID placeholder

	db  75,  70,  90,  80,  70, 105
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 188 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/altaria/front.dimensions"
	db NATURAL_CURE, NATURAL_CURE, CLOUD_NINE ; abilities
	db 0 ; unused
	db GROWTH_ERRATIC ; growth rate
	db 70 ; base happiness
	dn EGG_FLYING, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm
	; end