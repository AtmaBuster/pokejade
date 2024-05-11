MACRO mon_prob
; percent, index
	db \1, \2 * 3
ENDM

GrassMonProbTable:
	table_width 2, GrassMonProbTable
	mon_prob 30,  0 ; 30% chance
	mon_prob 60,  1 ; 30% chance
	mon_prob 80,  2 ; 20% chance
	mon_prob 90,  3 ; 10% chance
	mon_prob 95,  4 ;  5% chance
	mon_prob 99,  5 ;  4% chance
	mon_prob 100, 6 ;  1% chance
	assert_table_length NUM_GRASSMON

GrassMonLureProbTable:
	table_width 2, GrassMonLureProbTable
	mon_prob 20,  0 ; 20% chance
	mon_prob 40,  1 ; 20% chance
	mon_prob 60,  2 ; 20% chance
	mon_prob 75,  3 ; 15% chance
	mon_prob 85,  4 ; 10% chance
	mon_prob 95,  5 ; 10% chance
	mon_prob 100, 6 ;  5% chance
	assert_table_length NUM_GRASSMON

WaterMonProbTable:
	table_width 2, WaterMonProbTable
	mon_prob 60,  0 ; 60% chance
	mon_prob 90,  1 ; 30% chance
	mon_prob 100, 2 ; 10% chance
	assert_table_length NUM_WATERMON

WaterMonLureProbTable:
	table_width 2, WaterMonLureProbTable
	mon_prob 40,  0 ; 40% chance
	mon_prob 80,  1 ; 40% chance
	mon_prob 100, 2 ; 20% chance
	assert_table_length NUM_WATERMON
