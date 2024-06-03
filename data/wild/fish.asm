DEF TIME_GROUP EQU 0 ; use the nth TimeFishGroups entry

MACRO fishgroup
; chance, old rod, good rod, super rod
	db \1
	dw \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH, FishGroups
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super

	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	fishgroup 50 percent + 1, .Remoraid_Swarm_Old,   .Remoraid_Swarm_Good,   .Remoraid_Swarm_Super
	fishgroup 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	fishgroup 50 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	fishgroup 50 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super
	fishgroup 50 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super
	assert_table_length NUM_FISHGROUPS

MACRO fishtable_old
.\1_Old:
	dbbw  70 percent, 10, \2
	dbbw 100 percent, 10, \3
ENDM

MACRO fishtable_good
.\1_Good:
	dbbw  50 percent, 20, \2
	dbbw  85 percent, 20, \3
	dbbw 100 percent, 20, \4
ENDM

MACRO fishtable_super
.\1_Super:
	dbbw  45 percent, 30, \2
	dbbw  75 percent, 30, \3
	dbbw  95 percent, 30, \4
	dbbw 100 percent, 30, \5
ENDM

	fishtable_old   Shore, MAGIKARP, POLIWAG
	fishtable_good  Shore, MAGIKARP, POLIWAG, TYMPOLE
	fishtable_super Shore, POLIWAG, TYMPOLE, POLIWHIRL, POLIWHIRL

	fishtable_old   Ocean, MAGIKARP, MAGIKARP
	fishtable_good  Ocean, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Ocean, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Lake, MAGIKARP, MAGIKARP
	fishtable_good  Lake, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Lake, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Pond, MAGIKARP, MAGIKARP
	fishtable_good  Pond, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Pond, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Dratini, MAGIKARP, MAGIKARP
	fishtable_good  Dratini, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Dratini, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Qwilfish_Swarm, MAGIKARP, MAGIKARP
	fishtable_good  Qwilfish_Swarm, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Qwilfish_Swarm, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Remoraid_Swarm, MAGIKARP, MAGIKARP
	fishtable_good  Remoraid_Swarm, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Remoraid_Swarm, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Gyarados, MAGIKARP, MAGIKARP
	fishtable_good  Gyarados, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Gyarados, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Dratini_2, MAGIKARP, MAGIKARP
	fishtable_good  Dratini_2, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Dratini_2, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   WhirlIslands, MAGIKARP, MAGIKARP
	fishtable_good  WhirlIslands, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super WhirlIslands, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Qwilfish_NoSwarm, MAGIKARP, MAGIKARP
	fishtable_good  Qwilfish_NoSwarm, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Qwilfish_NoSwarm, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Qwilfish, MAGIKARP, MAGIKARP
	fishtable_good  Qwilfish, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Qwilfish, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

	fishtable_old   Remoraid, MAGIKARP, MAGIKARP
	fishtable_good  Remoraid, MAGIKARP, MAGIKARP, MAGIKARP
	fishtable_super Remoraid, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP

TimeFishGroups:
	;     day             nite
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 0
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 1
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 2
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 3
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 4
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 5
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 6
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 7
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 8
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 9
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 10
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 11
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 12
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 13
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 14
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 15
	dbwbw 10, MAGIKARP,   10, MAGIKARP   ; 16
	dbwbw 10, MAGIKARP,   10, MAGIKARP   ; 17
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 18
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 19
	dbwbw 20, MAGIKARP,   20, MAGIKARP   ; 20
	dbwbw 40, MAGIKARP,   40, MAGIKARP   ; 21
