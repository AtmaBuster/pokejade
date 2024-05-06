	db 0 ; species ID placeholder

	db  50,  85,  85,  50,  55,  55
	evs  0,   1,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, FAIRY ; type
	db 45 ; catch rate
	db 98 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/mawile/front.dimensions"
	db HYPER_CUTTER, INTIMIDATE, HUGE_POWER ; abilities
	db 0 ; unused
	db GROWTH_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm
	; end