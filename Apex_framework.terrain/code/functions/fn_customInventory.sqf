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
	'vn_b_item_compass_sog',
	'vn_b_item_compass',
	'vn_o_item_radio_m252',
	'vn_o_item_firstaidkit',
	'vn_b_item_firstaidkit',
	'vn_o_item_map',
	'vn_b_item_map',
	'vn_b_item_medikit_01',
	'vn_b_item_radio_urc10',
	'vn_b_item_toolkit',
	'vn_b_item_trapkit',
	'vn_b_item_watch',
	'vn_b_item_wiretap',
	'vn_b_sks',
	'vn_b_m1897',
	'vn_b_carbine',
	'vn_b_m14',
	'vn_b_m16',
	'vn_b_m4956',
	'vn_b_m38',
	'vn_b_type56',
	'vn_b_camo_m14',
	'vn_b_camo_m40a1',
	'vn_o_3x_m84',
	'vn_o_9x_m14',
	'vn_o_anpvs2_m14',
	'vn_o_4x_m16',
	'vn_o_9x_m16',
	'vn_o_anpvs2_m16',
	'vn_o_9x_m40',
	'vn_o_anpvs2_m40a1',
	'vn_o_4x_m4956',
	'vn_o_3x_m9130',
	'vn_s_m45',
	'vn_s_m14',
	'vn_s_m16',
	'vn_s_m1895',
	'vn_s_m1911',
	'vn_s_m3a1',
	'vn_s_mat49',
	'vn_s_mc10',
	'vn_s_mk22',
	'vn_s_m10',
	'vn_s_pm',
	'vn_s_sten'
];
_allWeapons = [
	'vn_izh54',
	'vn_izh54_shorty',
	'vn_izh54_p',
	'vn_k50m',
	'vn_m45',
	'vn_m45_camo',
	'vn_m45_sd',
	'vn_m45_fold',
	'vn_m1carbine',
	'vn_m1carbine_sniper',
	'vn_m1carbine_bayo',
	'vn_m1carbine_gl',
	'vn_m14',
	'vn_m14_bayo',
	'vn_m14_camo',
	'vn_m14_sd',
	'vn_m16',
	'vn_m16_bayo',
	'vn_m16_camo',
	'vn_m16_mrk',
	'vn_m16_mrk_sd',
	'vn_m16_nvg',
	'vn_m16_nvg_sd',
	'vn_m16_sd',
	'vn_m16_sniper',
	'vn_m16_sniper_sd',
	'vn_m16_xm148',
	'vn_m1897',
	'vn_m1897_bayo',
	'vn_m2carbine',
	'vn_m2carbine_sniper',
	'vn_m2carbine_bayo',
	'vn_m2carbine_gl',
	'vn_m3sd',
	'vn_m3carbine',
	'vn_m38',
	'vn_m38_bayo',
	'vn_m3a1',
	'vn_m4956',
	'vn_m4956_sniper',
	'vn_m4956_bayo',
	'vn_m4956_gl',
	'vn_m63a',
	'vn_m79',
	'vn_mat49',
	'vn_mat49_f',
	'vn_mat49_sd',
	'vn_mat49_vc',
	'vn_mc10',
	'vn_mc10_sd',
	'vn_mp40',
	'vn_pps43',
	'vn_pps52',
	'vn_ppsh41',
	'vn_rpd',
	'vn_rpd_shorty_01',
	'vn_rpd_shorty',
	'vn_sks',
	'vn_sks_gl',
	'vn_sks_sniper',
	'vn_sks_bayo',
	'vn_sten',
	'vn_sten_sd',
	'vn_type56',
	'vn_type56_bayo',
	'vn_xm177',
	'vn_xm177_camo',
	'vn_xm177_fg',
	'vn_xm177_mrk',
	'vn_xm177_nvg',
	'vn_xm177_short',
	'vn_xm177_sniper',
	'vn_xm177_stock',
	'vn_xm177_xm148',
	'vn_m21',
	'vn_m21_nvg',
	'vn_m21_nvg_sd',
	'vn_m21_sd',
	'vn_p38s',
	'vn_hd',
	'vn_hp',
	'vn_m1895',
	'vn_m1895_sd',
	'vn_m1911',
	'vn_mx991_m1911',
	'vn_m1911_sd',
	'vn_mx991_m1911_sd',
	'vn_m712',
	'vn_m79',
	'vn_mk22_sd',
	'vn_mk22',
	'vn_m10',
	'vn_m10_sd',
	'vn_pm',
	'vn_fkb1_pm',
	'vn_pm_sd',
	'vn_fkb1_pm_sd',
	'vn_tt33',
	'vn_welrod',
	'vn_izh54',
	'vn_izh54_shorty',
	'vn_izh54_p',
	'vn_k50m',
	'vn_m45',
	'vn_m45_camo',
	'vn_m45_sd',
	'vn_m45_fold',
	'vn_m3sd',
	'vn_m3a1',
	'vn_mat49',
	'vn_mat49_f',
	'vn_mat49_sd',
	'vn_mat49_vc',
	'vn_mc10',
	'vn_mc10_sd',
	'vn_mp40',
	'vn_pps43',
	'vn_pps52',
	'vn_ppsh41',
	'vn_sten',
	'vn_sten_sd'
];
_allMagazines = [
	'vn_m10_mag','vn_sa7_mag','vn_sa7b_mag','vn_rpg2_mag','vn_rpg7_mag','vn_dp28_mag','vn_hd_mag','vn_hp_mag','vn_izh54_mag','vn_izh54_so_mag','vn_ppsh41_35_mag','vn_ppsh41_35_t_mag','vn_ppsh41_71_mag','vn_ppsh41_71_t_mag',
	'vn_m45_mag','vn_m45_t_mag','vn_carbine_15_mag','vn_carbine_15_t_mag','vn_carbine_30_mag','vn_carbine_30_t_mag','vn_m127_mag','vn_m128_mag','vn_m129_mag','vn_m14_mag','vn_m14_t_mag','vn_m14_10_mag','vn_m14_10_t_mag','vn_m16_20_mag',
	'vn_m16_30_mag','vn_m16_40_mag','vn_m16_20_t_mag','vn_m16_30_t_mag','vn_m16_40_t_mag','vn_m38_mag','vn_m38_t_mag','vn_m1895_mag','vn_m1897_fl_mag','vn_m1897_buck_mag','vn_m1911_mag','vn_m3a1_mag','vn_m3a1_t_mag','vn_m40a1_mag',
	'vn_m40a1_t_mag','vn_m4956_10_mag','vn_m4956_10_t_mag','vn_m60_100_mag','vn_m63a_30_mag','vn_m63a_30_t_mag','vn_m712_mag','vn_m72_mag','vn_mat49_mag','vn_mat49_t_mag','vn_mat49_vc_mag','vn_mc10_mag','vn_mc10_t_mag','vn_mk22_mag',
	'vn_mp40_mag','vn_mp40_t_mag','vn_pk_100_mag','vn_pm_mag','vn_pps_mag','vn_pps_t_mag','vn_rpd_100_mag','vn_rpd_125_mag','vn_sks_mag','vn_sks_t_mag','vn_sten_mag','vn_sten_t_mag','vn_tt33_mag','vn_type56_mag','vn_type56_t_mag','vn_welrod_mag',
	'vn_v40_grenade_mag','vn_m61_grenade_mag','vn_m67_grenade_mag','vn_m7_grenade_mag','vn_m14_grenade_mag','vn_m14_early_grenade_mag','vn_m34_grenade_mag','vn_m18_purple_mag','vn_m18_red_mag','vn_m18_yellow_mag','vn_m18_green_mag','vn_m18_white_mag',
	'vn_rdg2_mag','vn_molotov_grenade_mag','vn_f1_grenade_mag','vn_rg42_grenade_mag','vn_rgd5_grenade_mag','vn_rgd33_grenade_mag','vn_rkg3_grenade_mag','vn_t67_grenade_mag','vn_chicom_grenade_mag',
	'vn_mine_m18_mag','vn_mine_m18_range_mag','vn_mine_m18_x3_mag','vn_mine_m18_x3_range_mag','vn_mine_punji_01_mag','vn_mine_punji_02_mag','vn_mine_punji_03_mag'
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
		"b_cargonet_01_ammo_f","i_cargonet_01_ammo_f","o_cargonet_01_ammo_f",'i_e_cargonet_01_ammo_f'
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
			['SmokeShell',(round (5 + (random 5)))],
			['SmokeShellBlue',(round (2 + (random 2)))],
			[(['NVGoggles','NVGoggles_tna_F'] select (worldName isEqualTo 'Tanoa')),2],
			[QS_core_classNames_itemMedikit,1],
			[QS_core_classNames_itemToolKit,1],
			[QS_core_classNames_itemRadio,2]
		];
		//comment 'Magazines';
		for '_x' from 0 to (_maxMagazines - 1) step 1 do {
			_magazineType = selectRandomWeighted [
				'vn_m16_20_t_mag',0.5,
				'vn_m14_10_t_mag',0.2,
				'vn_m60_100_mag',0.2,
				'vn_m72_mag',0.1
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
				'vn_m16',0.5,
				'vn_m14',0.4,
				'vn_m72',0.2
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
				'vn_b_pack_lw_01',0.25,
				'vn_b_pack_lw_02',0.25
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