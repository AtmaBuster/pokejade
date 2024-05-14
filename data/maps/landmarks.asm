MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	table_width 4, Landmarks
	landmark  -8, -16, SpecialMapName
	landmark  52, 108, ObsidianTownName
	landmark  60, 108, ObsidianMeadowName
	landmark  52,  96, RouteN01Name
	landmark  56,  84, ShaleCityName
	landmark  72,  84, RouteN02Name
	landmark  84,  88, City03Name
	landmark  96,  84, RouteN03Name
	landmark 112,  88, City04Name
	landmark 124,  88, RouteN04Name
	landmark 128,  72, City05WestName
	landmark 144,  72, City05EastName
	landmark 148,  96, RouteN05Name
	landmark 148, 116, Town06Name
	landmark 132, 124, RouteN06Name
	landmark 108, 124, Town07Name
	landmark 100, 120, RouteN07Name
	landmark  96, 108, RouteN08Name
	landmark  84, 104, RouteN09Name
	landmark 148,  48, RouteN10Name
	landmark 148,  28, Town08Name
	landmark 116,  60, RouteN11Name
	landmark 100,  60, Town09Name
	landmark  92,  52, RouteN12Name
	landmark  76,  44, RouteN13Name
	landmark  60,  40, City10Name
	landmark  40,  44, RouteN14Name
	landmark  16,  48, City11Name
	landmark  36,  72, RouteN15Name
	landmark  36,  92, Town12Name
	landmark  92,  28, City13Name

	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 130,  38, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 112,  72, DarkCaveName
	landmark 124,  88, Route46Name
	landmark 148,  68, SilverCaveName
	assert_table_length KANTO_LANDMARK
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  64, Route2Name
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  88,  52, Route4Name
	landmark 100,  52, CeruleanCityName
	landmark 100,  44, Route24Name
	landmark 108,  36, Route25Name
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 116,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  56, Route10Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  52, 120, Route21Name
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  28,  92, Route26Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark 140, 116, FastShipName
	assert_table_length NUM_LANDMARKS

ObsidianTownName:    db "OBSIDIAN<BSP>TOWN@"
ObsidianMeadowName:  db "OBSIDIAN<BSP>MEADOW@"
ShaleCityName:       db "SHALE CITY@"
City03Name:          db "CITY 03@"
City04Name:          db "CITY 04@"
City05WestName:      db "CITY 05<BSP>WEST@"
City05EastName:      db "CITY 05<BSP>EAST@"
Town06Name:          db "TOWN 06@"
Town07Name:          db "TOWN 07@"
Town08Name:          db "TOWN 08@"
Town09Name:          db "TOWN 09@"
City10Name:          db "CITY 10@"
City11Name:          db "CITY 11@"
Town12Name:          db "TOWN 12@"
City13Name:          db "CITY 13@"
RouteN01Name:        db "ROUTE N01@"
RouteN02Name:        db "ROUTE N02@"
RouteN03Name:        db "ROUTE N03@"
RouteN04Name:        db "ROUTE N04@"
RouteN05Name:        db "ROUTE N05@"
RouteN06Name:        db "ROUTE N06@"
RouteN07Name:        db "ROUTE N07@"
RouteN08Name:        db "ROUTE N08@"
RouteN09Name:        db "ROUTE N09@"
RouteN10Name:        db "ROUTE N10@"
RouteN11Name:        db "ROUTE N11@"
RouteN12Name:        db "ROUTE N12@"
RouteN13Name:        db "ROUTE N13@"
RouteN14Name:        db "ROUTE N14@"
RouteN15Name:        db "ROUTE N15@"

CianwoodCityName:    db "CIANWOOD<BSP>CITY@"
MahoganyTownName:    db "MAHOGANY<BSP>TOWN@"
BlackthornCityName:  db "BLACKTHORN<BSP>CITY@"
LakeOfRageName:      db "LAKE OF<BSP>RAGE@"
SilverCaveName:      db "SILVER CAVE@"
PowerPlantName:      db "POWER PLANT@"
WhirlIslandsName:    db "WHIRL<BSP>ISLANDS@"
MtMortarName:        db "MT.MORTAR@"
DragonsDenName:      db "DRAGON'S<BSP>DEN@"
IcePathName:         db "ICE PATH@"
PalletTownName:      db "PALLET TOWN@"
ViridianCityName:    db "VIRIDIAN<BSP>CITY@"
PewterCityName:      db "PEWTER CITY@"
CeruleanCityName:    db "CERULEAN<BSP>CITY@"
LavenderTownName:    db "LAVENDER<BSP>TOWN@"
VermilionCityName:   db "VERMILION<BSP>CITY@"
CeladonCityName:     db "CELADON<BSP>CITY@"
SaffronCityName:     db "SAFFRON<BSP>CITY@"
FuchsiaCityName:     db "FUCHSIA<BSP>CITY@"
CinnabarIslandName:  db "CINNABAR<BSP>ISLAND@"
IndigoPlateauName:   db "INDIGO<BSP>PLATEAU@"
VictoryRoadName:     db "VICTORY<BSP>ROAD@"
MtMoonName:          db "MT.MOON@"
RockTunnelName:      db "ROCK TUNNEL@"
LavRadioTowerName:   db "LAV<BSP>RADIO TOWER@"
SeafoamIslandsName:  db "SEAFOAM<BSP>ISLANDS@"
Route1Name:          db "ROUTE 1@"
Route2Name:          db "ROUTE 2@"
Route3Name:          db "ROUTE 3@"
Route4Name:          db "ROUTE 4@"
Route5Name:          db "ROUTE 5@"
Route6Name:          db "ROUTE 6@"
Route7Name:          db "ROUTE 7@"
Route8Name:          db "ROUTE 8@"
Route9Name:          db "ROUTE 9@"
Route10Name:         db "ROUTE 10@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "ROUTE 12@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 14@"
Route15Name:         db "ROUTE 15@"
Route16Name:         db "ROUTE 16@"
Route17Name:         db "ROUTE 17@"
Route18Name:         db "ROUTE 18@"
Route19Name:         db "ROUTE 19@"
Route20Name:         db "ROUTE 20@"
Route21Name:         db "ROUTE 21@"
Route22Name:         db "ROUTE 22@"
Route23Name:         db "ROUTE 23@"
Route24Name:         db "ROUTE 24@"
Route25Name:         db "ROUTE 25@"
Route26Name:         db "ROUTE 26@"
Route27Name:         db "ROUTE 27@"
Route28Name:         db "ROUTE 28@"
Route41Name:         db "ROUTE 41@"
Route42Name:         db "ROUTE 42@"
Route43Name:         db "ROUTE 43@"
Route44Name:         db "ROUTE 44@"
Route45Name:         db "ROUTE 45@"
Route46Name:         db "ROUTE 46@"
DarkCaveName:        db "DARK CAVE@"
FastShipName:        db "FAST SHIP@"
DiglettsCaveName:    db "DIGLETT'S<BSP>CAVE@"
TohjoFallsName:      db "TOHJO FALLS@"
UndergroundName:     db "UNDERGROUND@"
SpecialMapName:      db "SPECIAL@"
