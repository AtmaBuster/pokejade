	db 0 ; species ID placeholder

	db  70,  20,  50,  40,  20,  50
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 190 ; catch rate
	db 58 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/marill/front.dimensions"
	db THICK_FAT, HUGE_POWER, SAP_SIPPER ; abilities
	db 0 ; unused
	db GROWTH_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm
	; end