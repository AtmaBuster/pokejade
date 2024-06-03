TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2, TreeMons
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	assert_table_length NUM_TREEMON_SETS
	dw TreeMonSet_City ; unused

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
TreeMonSet_Town:
TreeMonSet_Route:
TreeMonSet_Kanto:
TreeMonSet_Lake:
TreeMonSet_Forest:
TreeMonSet_Rock:
; common
	dbbw 100, 10, MAGIKARP
	db -1
; rare
	dbbw 100, 10, MAGIKARP
	db -1
