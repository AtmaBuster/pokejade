MACRO growth_rate
; [1]/[2]*n**3 + [3]*n**2 + [4]*n - [5]
	dn \1, \2
	if \3 < 0
		db -\3 | $80 ; signed magnitude
	else
		db \3
	endc
	db \4, \5
ENDM

GrowthRates:
; entries correspond to GROWTH_* (see constants/pokemon_data_constants.asm)
	table_width 4, GrowthRates
	growth_rate 1, 1,   0,   0,   0 ; Medium Fast
	growth_rate 3, 4,  10,   0,  30 ; Slightly Fast
	growth_rate 3, 4,  20,   0,  70 ; Slightly Slow
	growth_rate 6, 5, -15, 100, 140 ; Medium Slow
	growth_rate 4, 5,   0,   0,   0 ; Fast
	growth_rate 5, 4,   0,   0,   0 ; Slow
	growth_rate 1, 1,   0,   0,   0 ; Erratic - dummy
	growth_rate 1, 1,   0,   0,   0 ; Fluctuating - dummy
	assert_table_length NUM_GROWTH_RATES

ErraticExperienceTable:
	dt 0 ; Lv 1
FOR LV, 2, 50
	dt ((LV * LV * LV) * (100 - LV)) / 50
ENDR
FOR LV, 50, 68
	dt ((LV * LV * LV) * (150 - LV)) / 100
ENDR
FOR LV, 68, 98
	dt ((LV * LV * LV) * ((1911 - 10 * LV) / 3)) / 500
ENDR
FOR LV, 98, 101
	dt ((LV * LV * LV) * (160 - LV)) / 100
ENDR

FluctiationExperienceTable:
	dt 0 ; Lv 1
FOR LV, 2, 15
	dt ((LV * LV * LV) * ((LV + 1) / 3 + 24)) / 50
ENDR
FOR LV, 15, 36
	dt ((LV * LV * LV) * (LV + 14)) / 50
ENDR
FOR LV, 36, 101
	dt ((LV * LV * LV) * (LV / 2 + 32)) / 50
ENDR
