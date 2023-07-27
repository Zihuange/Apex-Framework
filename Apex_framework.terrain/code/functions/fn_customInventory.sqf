/*/
File: fn_customInventory.sqf
Author:

	Quiksilver (thanks soulkobk for lists of items: https://github.com/soulkobk/ArmA_Scripts/blob/master/randomCrateLoadOut/randomCrateLoadOut.sqf)

Last Modified:

	14/06/2018 A3 1.82 by Quiksilver
	
Description:

	Custom Inventory
_____________________________________________________________/*/

params ['_entity','_type','_preset'];
if (!isNil {_entity getVariable 'QS_vehicle_customInventory'}) exitWith {};



_entity setVariable ['QS_vehicle_customInventory',TRUE,FALSE];
_whitelistedBackpacks = [];
_allItems = [
	"SPE_M1918A2_BAR_Bipod",
	"SPE_ACC_M1_Bayo",
	"SPE_ACC_GL_M1",
	"SPE_ACC_M1905_Bayo",
	"SPE_ACC_M3_Suppressor_45acp",
	"SPE_ACC_GL_M7",
	"SPE_ACC_GL_M8",
	"SPE_ACC_K98_Bayo",
	"SPE_ACC_GW_SB_Empty",
	"SPE_M1918A2_BAR_Handle"
];
_allWeapons = [
	"SPE_Flammenwerfer41",
	"SPE_G43",
	"SPE_K98",
	"SPE_K98_Late",
	"SPE_M1_Garand",
	"SPE_M1_Carbine",
	"SPE_M1903A3_Springfield",
	"SPE_M2_Flamethrower",
	"SPE_STG44",
	"SPE_FM_24_M29",
	"SPE_M1918A2_BAR",
	"SPE_M1919A4",
	"SPE_M1919A6",
	"SPE_MG34",
	"SPE_MG42",
	"SPE_K98ZF39",
	"SPE_M1903A4_Springfield",
	"SPE_Fusil_Mle_208_12",
	"SPE_Fusil_Mle_208_12_Sawedoff",
	"SPE_M1A1_Thompson",
	"SPE_M3_GreaseGun",
	"SPE_MP40",
	"SPE_Sten_Mk2",
	"SPE_Sten_Mk2_Suppressed",
	"SPE_M1A1_Bazooka",
	"SPE_M1911",
	"SPE_P08",
	"SPE_PzFaust_30m",
	"SPE_PzFaust_60m",
	"SPE_Faustpatrone"
];
_allMagazines = [
	"SPE_81mm_FA_Mle_1932_Illu",
	"SPE_8Rnd_81mm_FA_Mle_1932_Illu",
	"SPE_NB39",
	"SPE_NBK39b",
	"SPE_Shg24x7",
	"SPE_US_AN_M14",
	"SPE_US_M18",
	"SPE_Handrauchzeichen_Violet",
	"SPE_Handrauchzeichen_Red",
	"SPE_Handrauchzeichen_Yellow",
	"SPE_US_M15",
	"SPE_US_M18_Violet",
	"SPE_US_M18_Red",
	"SPE_US_M18_Green",
	"SPE_US_M18_Yellow",
	"SPE_Rauchsichtzeichen_Orange",
	"SPE_US_Mk_1",
	"SPE_Shg24_Frag",
	"SPE_US_Mk_2",
	"SPE_US_Mk_2_Yellow",
	"SPE_Shg24",
	"SPE_M39",
	"SPE_US_Mk_3",
	"SPE_100Rnd_762x63",
	"SPE_100Rnd_762x63_M1",
	"SPE_100Rnd_762x63_M2_AP",
	"SPE_20Rnd_762x63",
	"SPE_20Rnd_762x63_M1",
	"SPE_20Rnd_762x63_M2_AP",
	"SPE_5Rnd_762x63",
	"SPE_5Rnd_762x63_M1",
	"SPE_5Rnd_762x63_t",
	"SPE_5Rnd_762x63_M2_AP",
	"SPE_50Rnd_762x63",
	"SPE_50Rnd_762x63_M1",
	"SPE_50Rnd_762x63_M2_AP",
	"SPE_8Rnd_762x63",
	"SPE_8Rnd_762x63_M1",
	"SPE_8Rnd_762x63_t",
	"SPE_8Rnd_762x63_M2_AP",
	"SPE_15Rnd_762x33",
	"SPE_15Rnd_762x33_t",
	"SPE_20Rnd_Thompson_45ACP",
	"SPE_20Rnd_Thompson_45ACP_t",
	"SPE_30Rnd_M3_GreaseGun_45ACP",
	"SPE_30Rnd_M3_GreaseGun_45ACP_t",
	"SPE_30Rnd_Thompson_45ACP",
	"SPE_30Rnd_Thompson_45ACP_t",
	"SPE_7Rnd_45ACP_1911",
	"SPE_2Rnd_12x65_Pellets",
	"SPE_2Rnd_12x65_No4_Buck",
	"SPE_2Rnd_12x65_Slug",
	"SPE_25Rnd_75x54",
	"SPE_25Rnd_75x54_35P_AP",
	"SPE_30Rnd_792x33",
	"SPE_30rnd_792x33_t",
	"SPE_10Rnd_792x57",
	"SPE_10Rnd_792x57_SMK",
	"SPE_10Rnd_792x57_sS",
	"SPE_10Rnd_792x57_T2",
	"SPE_10Rnd_792x57_T",
	"SPE_100Rnd_792x57",
	"SPE_100Rnd_792x57_SMK",
	"SPE_100Rnd_792x57_sS",
	"SPE_5Rnd_792x57",
	"SPE_5Rnd_792x57_t",
	"SPE_5Rnd_792x57_SMK",
	"SPE_5Rnd_792x57_sS",
	"SPE_50Rnd_792x57",
	"SPE_50Rnd_792x57_SMK",
	"SPE_50Rnd_792x57_sS",
	"SPE_32Rnd_9x19",
	"SPE_32rnd_9x19_t",
	"SPE_32Rnd_9x19_Sten",
	"SPE_8Rnd_9x19_P08",
	"SPE_8Rnd_81mm_FA_Mle_1932_Smoke",
	"SPE_81mm_FA_Mle_1932_Smoke",
	"SPE_1Rnd_81mm_FA_Mle_1932_HE",
	"SPE_Flammenwerfer41_Mag",
	"SPE_1Rnd_G_FLGR",
	"SPE_1Rnd_81mmHE_M1_M43A1",
	"SPE_8rnd_81mm_M1_M57_SmokeShell",
	"SPE_81mm_M1_M57_SmokeShell",
	"SPE_1Rnd_81mmWP_M1_M57",
	"SPE_1Rnd_G_M9A1",
	"SPE_1Rnd_G_NBGR_42",
	"SPE_1Rnd_G_PZGR_30",
	"SPE_1Rnd_G_PZGR_40",
	"SPE_1Rnd_G_SPRGR_30",
	"SPE_M2_Flamethrower_Mag",
	"SPE_1Rnd_60mm_M6",
	"SPE_1Rnd_Faustpatrone",
	"SPE_1Rnd_G_M2_AN_M14",
	"SPE_1Rnd_G_Mk2",
	"SPE_1Rnd_G_M17A1",
	"SPE_1Rnd_G_M19A1",
	"SPE_1Rnd_G_M21A1",
	"SPE_1Rnd_G_M51A1",
	"SPE_1Rnd_G_M2_ANM8",
	"SPE_1Rnd_G_M2_M18_Violet",
	"SPE_1Rnd_G_M2_M18_Red",
	"SPE_1Rnd_G_M2_M18_Green",
	"SPE_1Rnd_G_M2_M18_Yellow",
	"SPE_1Rnd_PzFaust_30m",
	"SPE_1Rnd_PzFaust_60m"
];
if (_type isEqualTo 0) then {
	//comment 'Randomize';
	_entityType = toLowerANSI (typeOf _entity);
	private _weaponType = '';
	private _magazineType = '';
	private _backpackType = '';
	private _weaponsToAdd = [];
	private _weaponTypesToAdd = [];
	private _magazinesToAdd = [];
	private _magazineTypesToAdd = [];
	private _backpacksToAdd = [];
	private _backpackTypesToAdd = [];
	private _weaponTypeUnique = '';
	private _magazineTypeUnique = '';
	private _backpackTypeUnique = '';
	private _cfgEntity = configfile >> 'cfgvehicles' >> _entityType;
	private _cfgTransportMaxBackpacks = getNumber (_cfgEntity >> 'transportMaxBackpacks');
	private _cfgTransportMaxMagazines = getNumber (_cfgEntity >> 'transportMaxMagazines');
	private _cfgTransportMaxWeapons = getNumber (_cfgEntity >> 'transportMaxWeapons');
	_maxBackpacks = round (_cfgTransportMaxBackpacks * 0.1);
	_maxMagazines = round (_cfgTransportMaxMagazines * 0.75);
	_maxWeapons = round (_cfgTransportMaxWeapons * 0.25);
	_qtyBackpacks = round (_maxBackpacks / 2);
	_qtyMagazines = round (_maxMagazines / 2); 
	_qtyWeapons = round (_maxWeapons / 2);
		//comment 'Magazines';
		_magazineTypesToAdd = [];
		_magazinesToAdd = [];
		for '_x' from 0 to (_qtyMagazines - 1) step 1 do {
			_magazineType = selectRandom _allMagazines;
			_magazineTypesToAdd pushBackUnique (toLowerANSI _magazineType);
			_magazinesToAdd pushBack (toLowerANSI _magazineType);
		};
		{
			_magazineTypeUnique = _x;
			_entity addMagazineCargoGlobal [_magazineTypeUnique,({_x isEqualTo _magazineTypeUnique} count _magazinesToAdd)];
		} forEach _magazineTypesToAdd;
		//comment 'Items';
		for '_x' from 0 to 5 step 1 do {
			_entity addItemCargoGlobal [(selectRandom _allItems),1];
		};
		//comment 'Weapons';
		_weaponTypesToAdd = [];
		_weaponsToAdd = [];
		for '_x' from 0 to (_qtyWeapons - 1) step 1 do {
			_weaponType = selectRandom _allWeapons;
			_weaponTypesToAdd pushBackUnique (toLowerANSI _weaponType);
			_weaponsToAdd pushBack (toLowerANSI _weaponType);
		};		
		{
			_weaponTypeUnique = _x;
			_entity addWeaponCargoGlobal [_weaponTypeUnique,({_x isEqualTo _weaponTypeUnique} count _weaponsToAdd)];
		} forEach _weaponTypesToAdd;
};
if (_type isEqualTo 1) then {
	//comment 'Preset';
	_entityType = toLowerANSI (typeOf _entity);
	private _weaponType = '';
	private _magazineType = '';
	private _backpackType = '';
	private _weaponsToAdd = [];
	private _weaponTypesToAdd = [];
	private _magazinesToAdd = [];
	private _magazineTypesToAdd = [];
	private _backpacksToAdd = [];
	private _backpackTypesToAdd = [];
	private _weaponTypeUnique = '';
	private _magazineTypeUnique = '';
	private _backpackTypeUnique = '';
	private _cfgEntity = configfile >> 'cfgvehicles' >> _entityType;
	private _cfgTransportMaxBackpacks = getNumber (_cfgEntity >> 'transportMaxBackpacks');
	private _cfgTransportMaxMagazines = getNumber (_cfgEntity >> 'transportMaxMagazines');
	private _cfgTransportMaxWeapons = getNumber (_cfgEntity >> 'transportMaxWeapons');
	//comment 'Fill to 50 percent';
	_maxBackpacks = round (_cfgTransportMaxBackpacks * 0.1);
	_maxMagazines = round (_cfgTransportMaxMagazines * 0.25);
	_maxWeapons = round (_cfgTransportMaxWeapons * 0.15);
	_qtyBackpacks = round (_maxBackpacks / 2);
	_qtyMagazines = round (_maxMagazines / 2); 
	_qtyWeapons = round (_maxWeapons / 2);

	//comment 'Default items';
	if ((_entityType in [
		"b_slingload_01_ammo_f","b_slingload_01_cargo_f","b_slingload_01_fuel_f","b_slingload_01_medevac_f","b_slingload_01_repair_f",
		"i_supplycrate_f","o_supplycrate_f","c_t_supplycrate_f","c_supplycrate_f","ig_supplycrate_f","b_supplycrate_f",
		"b_cargonet_01_ammo_f","i_cargonet_01_ammo_f","o_cargonet_01_ammo_f",'i_e_cargonet_01_ammo_f',
		"SPE_Mine_Ammo_Box_Ger", 
		"SPE_Mine_AmmoBox_US", 
		"SPE_US_2x_Open_Ammocrate_alt_Rifle_Ball", 
		"SPE_US_2x_Open_Ammocrate_Rifle_Ball", 
		"SPE_US_Open_Ammocrate_Rifle_Ball", 
		"SPE_US_Open_Ammocrate_Grenades_Frag", 
		"SPE_US_Ammocrate_Rifle_Ball", 
		"SPE_US_Ammocrate_Grenades_Frag", 
		"SPE_Ammocrate_Grenades_Frag_GER", 
		"SPE_BasicAmmunitionBox_GER", 
		"SPE_BasicAmmunitionBox_US", 
		"SPE_Weaponcrate_K98_GER", 
		"SPE_Weaponcrate_MG34_GER", 
		"SPE_Weaponcrate_MP40_GER", 
		"SPE_BasicWeaponsBox_GER", 
		"SPE_BasicWeaponsBox_US", 
		"SPE_Hay_WeaponCache_FFI", 
		"SPE_4Rnd_Panzerfaust30", 
		"SPE_4Rnd_Panzerfaust60", 
		"SPE_AmmoCrate_Mortar_SMOKE_GER", 
		"SPE_AmmoCrate_Mortar_FLARE_GER", 
		"SPE_AmmoCrate_Mortar_GER", 
		"SPE_AmmoCrate_Mortar_SMOKE_US", 
		"SPE_AmmoCrate_Mortar_WP_US", 
		"SPE_AmmoCrate_Mortar_US"
	]) || (_entity isKindOf 'LandVehicle')) then {
		if (_entityType in ["b_cargonet_01_ammo_f","i_cargonet_01_ammo_f","o_cargonet_01_ammo_f"]) then {
			_cfgEntity = configfile >> 'cfgvehicles' >> 'b_supplycrate_f';
			_cfgTransportMaxBackpacks = round ((getNumber (_cfgEntity >> 'transportMaxBackpacks')) * 0.1);
			_cfgTransportMaxMagazines = round ((getNumber (_cfgEntity >> 'transportMaxMagazines')) * 1);
			_cfgTransportMaxWeapons = round ((getNumber (_cfgEntity >> 'transportMaxWeapons')) * 0.5);
		};
		clearItemCargoGlobal _entity;
		clearWeaponCargoGlobal _entity;
		clearMagazineCargoGlobal _entity;
		clearBackpackCargoGlobal _entity;
		//comment 'Items';
		{
			_entity addItemCargoGlobal _x;
		} forEach [
			[QS_core_classNames_itemFirstAidKit,(round (10 + (random 5)))],
			['SPE_Handrauchzeichen_Violet',(round (5 + (random 5)))],
			['SPE_Handrauchzeichen_Yellow',(round (2 + (random 2)))],
			//[(['NVGoggles','NVGoggles_tna_F'] select (worldName isEqualTo 'Tanoa')),2],
			[QS_core_classNames_itemMedikit,1],
			[QS_core_classNames_itemToolKit,1],
			[QS_core_classNames_itemRadio,2]
		];
		//comment 'Magazines';
		for '_x' from 0 to (_maxMagazines - 1) step 1 do {
			_magazineType = selectRandomWeighted [
				'SPE_5Rnd_792x57',0.6,
				'SPE_32Rnd_9x19',0.25,
				'SPE_30Rnd_792x33',0.25,
				'SPE_50Rnd_792x57',0.2,
				'SPE_1Rnd_60mm_M6',0.1
			];
			_magazineTypesToAdd pushBackUnique (toLowerANSI _magazineType);
			_magazinesToAdd pushBack (toLowerANSI _magazineType);
		};
		{
			_magazineTypeUnique = _x;
			_entity addMagazineCargoGlobal [_magazineTypeUnique,({_x isEqualTo _magazineTypeUnique} count _magazinesToAdd)];
		} forEach _magazineTypesToAdd;
		//comment 'Weapons';
		for '_x' from 0 to (_maxWeapons - 1) step 1 do {
			_weaponType = selectRandomWeighted [
				'SPE_K98',0.5,
				'SPE_MP40',0.4,
				'SPE_K98ZF39',0.2,
				'SPE_M1A1_Bazooka',0.2
			];
			_weaponTypesToAdd pushBackUnique (toLowerANSI _weaponType);
			_weaponsToAdd pushBack (toLowerANSI _weaponType);
		};
		{
			_weaponTypeUnique = _x;
			_entity addWeaponCargoGlobal [_weaponTypeUnique,({_x isEqualTo _weaponTypeUnique} count _weaponsToAdd)];
		} forEach _weaponTypesToAdd;		
		//comment 'Backpacks';
		for '_x' from 0 to (_maxBackpacks - 1) step 1 do {
			_backpackType = selectRandomWeighted [
				'B_SPE_GER_Tonister34_canvas',0.5,
				'B_SPE_US_Backpack',0.5
			];
			_backpackTypesToAdd pushBackUnique (toLowerANSI _backpackType);
			_backpacksToAdd pushBack (toLowerANSI _backpackType);
		};
		{
			_backpackTypeUnique = _x;
			_entity addBackpackCargoGlobal [_backpackTypeUnique,({_x isEqualTo _backpackTypeUnique} count _backpacksToAdd)];
		} forEach _backpackTypesToAdd;
		
		//comment 'Now randomized';
		//comment 'Magazines';
		_magazineTypesToAdd = [];
		_magazinesToAdd = [];
		for '_x' from 0 to (_qtyMagazines - 1) step 1 do {
			_magazineType = selectRandom _allMagazines;
			_magazineTypesToAdd pushBackUnique (toLowerANSI _magazineType);
			_magazinesToAdd pushBack (toLowerANSI _magazineType);
		};
		{
			_magazineTypeUnique = _x;
			_entity addMagazineCargoGlobal [_magazineTypeUnique,({_x isEqualTo _magazineTypeUnique} count _magazinesToAdd)];
		} forEach _magazineTypesToAdd;
		//comment 'Items';
		for '_x' from 0 to 5 step 1 do {
			_entity addItemCargoGlobal [(selectRandom _allItems),1];
		};
		//comment 'Weapons';
		_weaponTypesToAdd = [];
		_weaponsToAdd = [];
		for '_x' from 0 to (_qtyWeapons - 1) step 1 do {
			_weaponType = selectRandom _allWeapons;
			_weaponTypesToAdd pushBackUnique (toLowerANSI _weaponType);
			_weaponsToAdd pushBack (toLowerANSI _weaponType);
		};		
		{
			_weaponTypeUnique = _x;
			_entity addWeaponCargoGlobal [_weaponTypeUnique,({_x isEqualTo _weaponTypeUnique} count _weaponsToAdd)];
		} forEach _weaponTypesToAdd;		
	};
};