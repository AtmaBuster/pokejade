; MapGroupRoofs values; Roofs indexes
	const_def
	const ROOF_OBSIDIAN  ; 0
	const ROOF_VIOLET    ; 1
	const ROOF_AZALEA    ; 2
	const ROOF_OLIVINE   ; 3
	const ROOF_GOLDENROD ; 4
DEF NUM_ROOFS EQU const_value

MapGroupRoofs:
; entries correspond to MAPGROUP_* constants
; values are indexes for Roofs (see below)
	table_width 1, MapGroupRoofs
	db -1             ;  0
	db -1             ;  1
	db -1             ;  2
	db ROOF_OBSIDIAN  ;  3 (Obsidian)
	db ROOF_OBSIDIAN  ;  4 (Shale)
	db ROOF_OBSIDIAN  ;  5 (City03)
	db ROOF_OBSIDIAN  ;  6 (City04)
	db ROOF_OBSIDIAN  ;  7 (Town07)
	db ROOF_OBSIDIAN  ;  8 (Town06)
	db ROOF_OBSIDIAN  ;  9 (City05)
	db ROOF_OBSIDIAN  ; 10 (Town09)
	db ROOF_OBSIDIAN  ; 11 (City10)
	db ROOF_OBSIDIAN  ; 12 (City11)
	db ROOF_OBSIDIAN  ; 13 (City12)
	db ROOF_OBSIDIAN  ; 14 (Town12)
	db ROOF_OBSIDIAN  ; 15 (City13)
	assert_table_length NUM_MAP_GROUPS + 1

Roofs:
; entries correspond to ROOF_* constants
	table_width ROOF_LENGTH * LEN_2BPP_TILE, Roofs
INCBIN "gfx/tilesets/roofs/new_bark.2bpp"
INCBIN "gfx/tilesets/roofs/violet.2bpp"
INCBIN "gfx/tilesets/roofs/azalea.2bpp"
INCBIN "gfx/tilesets/roofs/olivine.2bpp"
INCBIN "gfx/tilesets/roofs/goldenrod.2bpp"
	assert_table_length NUM_ROOFS
