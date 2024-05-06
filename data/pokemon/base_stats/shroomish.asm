	db 0 ; species ID placeholder

	db  60,  40,  60,  35,  40,  60
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 255 ; catch rate
	db 65 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/shroomish/front.dimensions"
	db EFFECT_SPORE, POISON_HEAL, QUICK_FEET ; abilities
	db 0 ; unused
	db GROWTH_FLUCTUATING ; growth rate
	db 70 ; base happiness
	dn EGG_FAIRY, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm
	; end