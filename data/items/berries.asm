MACRO berry_data
	dw \1  ; item
	db \2  ; hours per growth stage
	db \3  ; max yield
	dw \4 ; pointer to gfx
ENDM

BerryData:
	table_width BERRY_DATA_LENGTH, BerryData
	berry_data CHERI_BERRY,   3,  5, CheriBerryGFX
	berry_data CHESTO_BERRY,  3,  5, OranBerryGFX
	berry_data PECHA_BERRY,   3,  5, PechaBerryGFX
	berry_data RAWST_BERRY,   3,  5, OranBerryGFX
	berry_data ASPEAR_BERRY,  3,  5, OranBerryGFX
	berry_data LEPPA_BERRY,   4,  5, OranBerryGFX
	berry_data ORAN_BERRY,    4,  7, OranBerryGFX
	berry_data PERSIM_BERRY,  3,  5, OranBerryGFX
	berry_data LUM_BERRY,    12,  8, OranBerryGFX
	berry_data SITRUS_BERRY,  8,  7, OranBerryGFX
	berry_data RED_APRICORN,  1,  3, OranBerryGFX
	berry_data BLU_APRICORN,  1,  3, OranBerryGFX
	berry_data YLW_APRICORN,  1,  3, OranBerryGFX
	berry_data GRN_APRICORN,  1,  3, OranBerryGFX
	berry_data WHT_APRICORN,  1,  3, OranBerryGFX
	berry_data BLK_APRICORN,  1,  3, OranBerryGFX
	berry_data PNK_APRICORN,  1,  3, OranBerryGFX
	assert_table_length NUM_BERRY_ITEMS
	dw -1
