/*/
File: roles.sqf
Author:

	Quiksilver
	
Last Modified:

	4/11/2022 A3 2.10 by Quiksilver
	
Description:

	Roles
	
Notes:

	To understand this file, please see documentation in mission file: 
	
		"documentation\role selection system.txt"
_______________________________________________________/*/

_tropical = worldName in ['Tanoa'];
QS_roles_data = [
	[
		[
			'rifleman',
			EAST,
			(playableSlotsNumber EAST),
			(playableSlotsNumber EAST),
			-1,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'autorifleman',
			EAST,
			2,
			6,
			5,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'machine_gunner',
			EAST,
			1,
			3,
			8,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'marksman',
			EAST,
			1,
			4,
			10,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'rifleman_lat',
			EAST,
			2,
			6,
			10,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'rifleman_hat',
			EAST,
			2,
			4,
			8,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'medic',
			EAST,
			2,
			8,
			4,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'engineer',
			EAST,
			2,
			8,
			5,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/ ----- Crewman has no special abilities in official version
		[
			'crewman',
			EAST,
			3,
			6,
			12,
			0,
			0,
			0,
			{FALSE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'mortar_gunner',
			EAST,
			1,
			2,
			20,
			1,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'sniper',
			EAST,
			1,
			2,
			20,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'jtac',
			EAST,
			1,
			2,
			10,
			1,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'uav',
			EAST,
			1,		// Do not change this, only 1 UAV Operator slot configured
			1,		// Do not change this, only 1 UAV Operator slot configured
			-1,		// Do not change this, only 1 UAV Operator slot configured
			0,		// Do not change this, only 1 UAV Operator slot configured
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'pilot_heli',
			EAST,
			2,
			5,
			6,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'pilot_plane',
			EAST,
			2,		// Do not change this, only 1 CAS pilot slot configured
			2,		// Do not change this, only 1 CAS pilot slot configured
			-1,		// Do not change this, only 1 CAS pilot slot configured
			0,		// Do not change this, only 1 CAS pilot slot configured
			0,
			0,
			{TRUE},
			{((((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE])) && ((missionNamespace getVariable ['QS_missionConfig_CAS',2]) isNotEqualTo 0))},
			{}
		],
		[
			'commander',
			EAST,
			0,		// Do not change this, only 1 Commander slot configured
			0,		// Do not change this, only 1 Commander slot configured
			-1,		// Do not change this, only 1 Commander slot configured
			1,		// Do not change this, only 1 Commander slot configured
			0,
			0,
			{((missionNamespace getVariable ['QS_missionConfig_Commander',0]) isNotEqualTo 0)},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		//------------------------------------------------ Whitelisted roles
		[
			'medic_WL',
			EAST,
			0,
			0,
			-1,
			2,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'machine_gunner_WL',
			EAST,
			0,
			0,
			-1,
			2,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'sniper_WL',
			EAST,
			0,
			0,
			-1,
			2,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'pilot_heli_WL',
			EAST,
			0,			// minimum 1 slot
			0,			// maximum 2 slots
			-1,			// per N players an extra role will open, up to the maximum
			2,			// 2 whitelisted slots (should == maximum slots)
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',EAST]) isEqualTo EAST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		]
	],
	[
		[
			'b_rifleman',
			WEST,
			2,
			2,
			-1,
			0,	
			0,
			0,
			{((missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]) && (((missionNamespace getVariable ['QS_missionConfig_playableBLUFOR',0]) isEqualTo 2) || {(((missionNamespace getVariable ['QS_missionConfig_playableBLUFOR',0]) isEqualTo 1) && ((getPlayerUID player) in (['BLUFOR'] call (missionNamespace getVariable 'QS_fnc_whitelist'))))}))},
			{((player getVariable ['QS_unit_side',EAST]) isEqualTo WEST) || ((missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]) && (((missionNamespace getVariable ['QS_missionConfig_playableBLUFOR',0]) isEqualTo 2) || {(((missionNamespace getVariable ['QS_missionConfig_playableBLUFOR',0]) isEqualTo 1) && ((getPlayerUID player) in (['BLUFOR'] call (missionNamespace getVariable 'QS_fnc_whitelist'))))}))},
			{}
		]
	],
	[],
	[]
];
QS_roles_UI_info = [
	['rifleman',localize 'STR_QS_Role_013','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['autorifleman',localize 'STR_QS_Role_014','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa'],
	['machine_gunner',localize 'STR_QS_Role_015','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa'],
	['marksman','精确射手','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa'],
	['rifleman_lat',localize 'STR_QS_Role_016','a3\ui_f\data\map\vehicleicons\iconManAT_ca.paa','a3\ui_f\data\map\vehicleicons\iconManAT_ca.paa'],
	['rifleman_hat',localize 'STR_QS_Role_017','a3\ui_f\data\map\vehicleicons\iconManAT_ca.paa','a3\ui_f\data\map\vehicleicons\iconManAT_ca.paa'],
	['engineer',localize 'STR_QS_Role_018','a3\ui_f\data\map\vehicleicons\iconManEngineer_ca.paa','a3\ui_f\data\map\vehicleicons\iconManEngineer_ca.paa'],
	['medic',localize 'STR_QS_Role_019','a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa'],
	['sniper',localize 'STR_QS_Role_020','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa'],
	['crewman',localize 'STR_QS_Role_021','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['jtac',localize 'STR_QS_Role_022','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa'],
	['mortar_gunner',localize 'STR_QS_Role_023','A3\Static_f\Mortar_01\data\UI\map_Mortar_01_CA.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['uav',localize 'STR_QS_Role_024','A3\Drones_F\Air_F_Gamma\UAV_02\Data\UI\Map_UAV_02_CA.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['pilot_heli',localize 'STR_QS_Role_025','A3\Air_F_Beta\Heli_Transport_01\Data\UI\Map_Heli_Transport_01_base_CA.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['pilot_plane',localize 'STR_QS_Role_026','A3\Air_F_Jets\Plane_Fighter_01\Data\UI\Fighter01_icon_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['commander',localize 'STR_QS_Role_027','a3\ui_f\data\gui\cfg\ranks\general_gs.paa','a3\ui_f\data\map\vehicleicons\iconManCommander_ca.paa'],
	['b_rifleman',localize 'STR_QS_Role_013','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['b_autorifleman',localize 'STR_QS_Role_014','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa'],
	['medic_WL',localize 'STR_QS_Role_019','a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa'],
	['machine_gunner_WL',localize 'STR_QS_Role_015','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa'],
	['sniper_WL',localize 'STR_QS_Role_020','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa'],
	['pilot_heli_WL',localize 'STR_QS_Role_025','A3\Air_F_Beta\Heli_Transport_01\Data\UI\Map_Heli_Transport_01_base_CA.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa']
];
QS_roles_defaultLoadouts = [
	['',([[['arifle_Katiba_F','','','optic_Arco_blk_F',['30Rnd_65x39_caseless_green',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_blk',[['30Rnd_65x39_caseless_green',10,30],['SmokeShell',2,1],['HandGrenade',2,1]]],['B_AssaultPack_ocamo',[]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_Katiba_F','','','optic_Arco_blk_F_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['30rnd_65x39_caseless_khaki_mag_tracer',10,30]]],['B_AssaultPack_tna_F',[]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['rifleman',([[['arifle_Katiba_F','','','optic_Arco_blk_F',['30Rnd_65x39_caseless_green',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_blk',[['30Rnd_65x39_caseless_green',10,30],['SmokeShell',2,1],['HandGrenade',2,1]]],['B_AssaultPack_ocamo',[]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],	[['arifle_Katiba_F','','','optic_Arco_blk_F_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['30rnd_65x39_caseless_khaki_mag_tracer',10,30]]],['B_AssaultPack_tna_F',[]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['autorifleman',([[['LMG_Zafir_F','','','optic_Arco_blk_F',['150Rnd_762x54_Box',150],[],'bipod_01_F_snd'],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_blk',[['SmokeShell',2,1],['HandGrenade',2,1],['150Rnd_762x54_Box',3,100]]],['B_AssaultPack_ocamo',[['150Rnd_762x54_Box',3,100]]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['LMG_Zafir_F','','','optic_Arco_blk_F_khk_F',['150Rnd_762x54_Box',150],[],'bipod_01_F_khk'],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['150Rnd_762x54_Box',4,100]]],['B_AssaultPack_tna_F',[]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['machine_gunner',([[['MMG_01_hex_F','','','optic_Arco_blk_F',['150Rnd_93x64_Mag',150],[],'bipod_01_F_snd'],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_blk',[['SmokeShell',2,1],['HandGrenade',2,1],['150Rnd_93x64_Mag',1,130]]],['B_AssaultPack_ocamo',[['150Rnd_93x64_Mag',2,130]]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['MMG_01_tan_F','','','optic_Arco_blk_F',['150Rnd_93x64_Mag',150],[],'bipod_01_F_blk'],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['150Rnd_93x64_Mag',1,130]]],['B_AssaultPack_tna_F',[['150Rnd_93x64_Mag',2,130]]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['marksman',([[['srifle_DMR_01_F','','','optic_DMS',['10Rnd_762x54_Mag',10],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_blk',[['10Rnd_762x54_Mag',10,10],['SmokeShell',2,1],['HandGrenade',2,1]]],['B_AssaultPack_ocamo',[]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['srifle_DMR_07_ghex_F','','','optic_DMS',['20Rnd_650x39_Cased_Mag_F',20],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['20Rnd_650x39_Cased_Mag_F',10,20]]],['B_AssaultPack_tna_F',[]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['rifleman_lat',([[['arifle_Katiba_F','','','optic_Arco_blk_F',['30Rnd_65x39_caseless_green',30],[],''],['launch_RPG32_F','','','',['RPG32_F',1],[],''],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_blk',[['30Rnd_65x39_caseless_green',10,30],['SmokeShell',2,1],['HandGrenade',2,1]]],['B_AssaultPack_ocamo',[['RPG32_F',2,1]]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_Katiba_F','','','optic_Arco_blk_F_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],['launch_RPG32_F','','','',['RPG32_F',1],[],''],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['30rnd_65x39_caseless_khaki_mag_tracer',10,30]]],['B_AssaultPack_tna_F',[['RPG32_F',2,1]]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['rifleman_hat',([[['arifle_Katiba_F','','','optic_Arco_blk_F',['30Rnd_65x39_caseless_green',30],[],''],['launch_O_Titan_short_F','','','',['Titan_AT',1],[],''],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_blk',[['30Rnd_65x39_caseless_green',10,30],['SmokeShell',2,1],['HandGrenade',2,1]]],['B_Kitbag_cbr',[['Titan_AT',2,1]]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_Katiba_F','','','optic_Arco_blk_F_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],['launch_B_Titan_short_tna_F','','','',['Titan_AT',1],[],''],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['30rnd_65x39_caseless_khaki_mag_tracer',10,30]]],['B_Kitbag_rgr',[['Titan_AT',2,1]]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['engineer',([[['arifle_Katiba_C_F','','','optic_Arco_blk_F',['30Rnd_65x39_caseless_green',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrierGL_blk',[['SmokeShell',2,1],['HandGrenade',2,1],['30Rnd_65x39_caseless_green',10,30]]],['B_AssaultPack_ocamo',[['ToolKit',1],['MineDetector',1]]],'H_HelmetSpecB','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_Katiba_C_F','','','optic_Arco_blk_F_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrierGL_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['30rnd_65x39_caseless_khaki_mag_tracer',10,30]]],['B_AssaultPack_tna_F',[['ToolKit',1],['MineDetector',1]]],'H_HelmetO_ghex_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['medic',([[['arifle_Katiba_F','','','optic_Holosight',['30Rnd_65x39_caseless_green',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrierSpec_blk',[['FirstAidKit',5],['30Rnd_65x39_caseless_green',6,30]]],['B_AssaultPack_ocamo',[['Medikit',1],['FirstAidKit',10]]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_Katiba_F','','','optic_Holosight_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrierSpec_tna_F',[['FirstAidKit',5],['30rnd_65x39_caseless_khaki_mag_tracer',6,30]]],['B_AssaultPack_tna_F',[['Medikit',1],['FirstAidKit',10]]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['sniper',([[['srifle_GM6_camo_F','','','optic_LRPS',['5Rnd_127x108_Mag',5],[],''],[],['hgun_Rook40_F','muzzle_snds_L','','',['16Rnd_9x21_Mag',16],[],''],['U_O_FullGhillie_ard',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_Chestrig_rgr',[['MiniGrenade',3,1],['5Rnd_127x108_Mag',8,7]]],[],'','G_Bandanna_tan',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['srifle_GM6_ghex_F','','','optic_LRPS_tna_F',['5Rnd_127x108_Mag',5],[],''],[],['hgun_P07_khk_F','muzzle_snds_L','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_FullGhillie_tna_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_Chestrig_rgr',[['MiniGrenade',3,1],['5Rnd_127x108_Mag',8,7]]],[],'','G_Bandanna_oli',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['crewman',([[['SMG_03C_khaki','','','',['50Rnd_570x28_SMG_03',50],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['16Rnd_9x21_Mag',2,16],['50Rnd_570x28_SMG_03',2,50]]],[],[],'H_HelmetCrew_B','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['SMG_03C_black','','','',['50Rnd_570x28_SMG_03',50],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['50Rnd_570x28_SMG_03',2,50],['16Rnd_9x21_Mag',1,16]]],[],[],'H_HelmetCrew_B','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['jtac',([[['arifle_Katiba_GL_F','muzzle_snds_H_snd_F','acc_pointer_IR','optic_Arco_blk_F',['30Rnd_65x39_caseless_green',30],['1Rnd_SmokeRed_Grenade_shell',1],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16],['Laserbatteries',2,1]]],['V_PlateCarrier1_blk',[['SmokeShell',2,1],['HandGrenade',2,1],['30Rnd_65x39_caseless_green',9,30]]],['b_radiobag_01_mtp_f',[['1Rnd_SmokeRed_Grenade_shell',25,1],['1Rnd_HE_Grenade_shell',15,1]]],'H_Watchcap_khk','G_Lowprofile',['Laserdesignator','','','',['Laserbatteries',2],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_MX_GL_khk_F','muzzle_snds_H_khk_F','acc_pointer_IR','optic_Arco_blk_F_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],['1Rnd_HE_Grenade_shell',1],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16],['Laserbatteries',1,1]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['16Rnd_9x21_Mag',1,16],['30rnd_65x39_caseless_khaki_mag_tracer',9,30]]],['b_radiobag_01_tropic_f',[['1Rnd_SmokeRed_Grenade_shell',25,1],['1Rnd_HE_Grenade_shell',14,1]]],'H_Watchcap_camo','G_Lowprofile',['Laserdesignator_01_khk_F','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['mortar_gunner',([[['arifle_Katiba_C_F','','','optic_Arco_blk_F',['30Rnd_65x39_caseless_green',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrierGL_blk',[['SmokeShell',2,1],['HandGrenade',2,1],['30Rnd_65x39_caseless_green',10,30]]],['O_Mortar_01_weapon_F',[]],'H_HelmetSpecB','G_Balaclava_oli',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_Katiba_C_F','','','optic_Arco_blk_F_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrierGL_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['30rnd_65x39_caseless_khaki_mag_tracer',10,30]]],['B_Mortar_01_Weapon_grn_F',[]],'H_HelmetO_ghex_F','G_Balaclava_oli_Goggles_tna_F',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['uav',([[['arifle_Katiba_F','','','optic_Arco_blk_F',['30Rnd_65x39_caseless_green',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16],['Laserbatteries',1,1]]],['V_PlateCarrier1_blk',[['30Rnd_65x39_caseless_green',10,30],['SmokeShell',2,1],['HandGrenade',2,1],['Laserbatteries',1,1]]],['O_UAV_01_backpack_F',[]],'H_HelmetSpecO_blk','G_Lowprofile',['Laserdesignator','','','',['Laserbatteries',1],[],''],['ItemMap','O_UavTerminal','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_Katiba_F','','','optic_Arco_blk_F_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['30rnd_65x39_caseless_khaki_mag_tracer',10,30],['Laserbatteries',2,1]]],['O_UAV_01_backpack_F',[]],'H_HelmetSpecO_blk_tna_F','G_Lowprofile',['Laserdesignator_01_khk_F','','','',['Laserbatteries',1],[],''],['ItemMap','O_UavTerminal','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['pilot_heli',([[['SMG_03C_khaki','','','',['50Rnd_570x28_SMG_03',50],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_PilotCoveralls',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_TacVest_blk',[['50Rnd_570x28_SMG_03',4,50],['DemoCharge_Remote_Mag',1,1]]],[],'H_PilotHelmetHeli_O','',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['SMG_03C_black','','','',['50Rnd_570x28_SMG_03',50],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_PilotCoveralls',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_TacVest_blk',[['DemoCharge_Remote_Mag',1,1],['50Rnd_570x28_SMG_03',3,50]]],[],'H_PilotHelmetHeli_O','',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['pilot_plane',([[[],[],['hgun_Rook40_F','muzzle_snds_L','','',['16Rnd_9x21_Mag',16],[],''],['U_O_PilotCoveralls',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16],['SmokeShellBlue',2,1]]],[],[],'H_PilotHelmetFighter_O','G_Balaclava_oli',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','']],		[[],[],['hgun_P07_khk_F','muzzle_snds_L','','',['16Rnd_9x21_Mag',16],[],''],['U_O_PilotCoveralls',[['FirstAidKit',2],['SmokeShellBlue',2,1],['16Rnd_9x21_Mag',3,16]]],[],[],'H_PilotHelmetFighter_O','G_Balaclava_oli',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','']]] select _tropical)],
	['commander',([[[],[],['hgun_Pistol_heavy_02_F','','','optic_Yorris',['6Rnd_45ACP_Cylinder',6],[],''],['U_O_OfficerUniform_ocamo',[['FirstAidKit',1],['6Rnd_45ACP_Cylinder',4,6]]],[],[],'H_MilCap_oucamo','G_Aviator',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[[],[],['hgun_Pistol_heavy_02_F','','','optic_Yorris',['6Rnd_45ACP_Cylinder',6],[],''],['U_O_T_Soldier_F',[['FirstAidKit',1],['6Rnd_45ACP_Cylinder',4,6]]],[],[],'H_MilCap_tna_F','G_Aviator',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['b_rifleman',([[['arifle_MX_F','','','',['30Rnd_65x39_caseless_mag_Tracer',30],[],''],[],['hgun_P07_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_B_CombatUniform_mcam',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16]]],['V_PlateCarrierH_CTRG',[['30Rnd_65x39_caseless_mag_Tracer',11,30],['MiniGrenade',5,1],['SmokeShell',2,1]]],[],'H_HelmetB_camo','G_Bandanna_blk',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles']],		[['arifle_AKM_F','','','',['30Rnd_762x39_Mag_Tracer_Green_F',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16]]],['V_HarnessO_ghex_F',[['MiniGrenade',5,1],['SmokeShell',2,1],['30Rnd_762x39_Mag_Tracer_Green_F',12,30]]],[],'H_HelmetSpecO_blk','G_Bandanna_oli',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']]] select _tropical)],
	['b_autorifleman',([[['LMG_Mk200_F','','','',['200Rnd_65x39_cased_Box_Tracer',200],[],'bipod_02_F_blk'],[],['hgun_P07_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_B_CombatUniform_mcam',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16]]],['V_PlateCarrierH_CTRG',[['MiniGrenade',5,1],['SmokeShell',2,1],['200Rnd_65x39_cased_Box_Tracer',2,200]]],['H_HelmetB_camo',[['200Rnd_65x39_cased_Box_Tracer',4,200]]],'H_HelmetSpecO_blk','G_Bandanna_oli',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles']],		[['LMG_03_F','','','',['200Rnd_556x45_Box_Tracer_F',200],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16]]],['V_HarnessO_ghex_F',[['MiniGrenade',5,1],['SmokeShell',2,1],['200Rnd_556x45_Box_Tracer_F',3,200]]],['B_FieldPack_ghex_F',[['200Rnd_556x45_Box_Tracer_F',5,200]]],'H_HelmetSpecO_blk','G_Bandanna_oli',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']]] select _tropical)],
	['medic_WL',([[['arifle_Katiba_F','','','optic_Holosight',['30Rnd_65x39_caseless_green',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrierSpec_blk',[['FirstAidKit',5],['30Rnd_65x39_caseless_green',6,30]]],['B_AssaultPack_ocamo',[['Medikit',1],['FirstAidKit',10]]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_Katiba_F','','','optic_Holosight_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrierSpec_tna_F',[['FirstAidKit',5],['30rnd_65x39_caseless_khaki_mag_tracer',6,30]]],['B_AssaultPack_tna_F',[['Medikit',1],['FirstAidKit',10]]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['machine_gunner_WL',([[['MMG_01_hex_F','','','optic_Arco_blk_F',['150Rnd_93x64_Mag',150],[],'bipod_01_F_snd'],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_blk',[['SmokeShell',2,1],['HandGrenade',2,1],['150Rnd_93x64_Mag',1,130]]],['B_AssaultPack_ocamo',[['150Rnd_93x64_Mag',2,130]]],'H_HelmetSpecO_blk','G_Balaclava_oli',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['MMG_01_tan_F','','','optic_Arco_blk_F',['150Rnd_93x64_Mag',150],[],'bipod_01_F_blk'],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['150Rnd_93x64_Mag',1,130]]],['B_AssaultPack_tna_F',[['150Rnd_93x64_Mag',2,130]]],'H_HelmetSpecO_blk_tna_F','G_Balaclava_oli_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['sniper_WL',([[['srifle_GM6_camo_F','','','optic_LRPS',['5Rnd_127x108_Mag',5],[],''],[],['hgun_Rook40_F','muzzle_snds_L','','',['16Rnd_9x21_Mag',16],[],''],['U_O_FullGhillie_ard',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_Chestrig_rgr',[['MiniGrenade',3,1],['5Rnd_127x108_Mag',8,7]]],[],'','G_Bandanna_tan',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['srifle_GM6_ghex_F','','','optic_LRPS_tna_F',['5Rnd_127x108_Mag',5],[],''],[],['hgun_P07_khk_F','muzzle_snds_L','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_FullGhillie_tna_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_Chestrig_rgr',[['MiniGrenade',3,1],['5Rnd_127x108_Mag',8,7]]],[],'','G_Bandanna_oli',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)],
	['pilot_heli_WL',([[['SMG_03C_khaki','','','',['50Rnd_570x28_SMG_03',50],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_PilotCoveralls',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_TacVest_blk',[['50Rnd_570x28_SMG_03',4,50],['DemoCharge_Remote_Mag',1,1]]],[],'H_PilotHelmetHeli_O','',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['SMG_03C_black','','','',['50Rnd_570x28_SMG_03',50],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_PilotCoveralls',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_TacVest_blk',[['DemoCharge_Remote_Mag',1,1],['50Rnd_570x28_SMG_03',3,50]]],[],'H_PilotHelmetHeli_O','',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','O_NVGoggles_ghex_F']]] select _tropical)]
];
QS_fnc_roleDescription = {
	params ['_role'];
	_tropical = worldName in ['Tanoa'];
	private _description = 'Undefined';
	if (_role in ['rifleman']) then {
		_description = format ['作为一名步枪兵，你是一名前线士兵，而且是这只部队的脊梁与支柱。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['autorifleman','autorifleman_WL']) then {
		_description = format ['一名自动步枪兵的职责是在班组和敌人交火以及移动时提供迅速的压制火力。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['machine_gunner','machine_gunner_WL']) then {
		_description = format ['机枪手的职责是在远距离进行火力压制。不同于他的兄弟自动步枪兵，机枪手可能在班组稍微后方的位置，并且机动性不如后者。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['marksman']) then {
		_description = format ['作为一名精确射手，你的职责是跟随自己的小队，提供中距离上的精确火力。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['rifleman_lat','rifleman_lat_WL']) then {
		_description = format ['作为一名步枪手（轻型反坦克步兵），你的职责是反制敌方步兵、防御工事、非装甲和轻型装甲车辆。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['rifleman_hat','rifleman_hat_WL']) then {
		_description = format ['作为一名重型反坦克兵，你的任务是对抗敌军重型装甲载具。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['engineer','engineer_WL']) then {
		_description = format ['工程兵是载具单位的好帮手，他们可以在前线进行紧急维修。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['medic','medic_WL']) then {
		_description = format ['作战救生员最主要的职责便是治疗友军伤兵，尤其是重伤昏迷的人，他们应该出现在前线战场而不是后方的山脊上。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['sniper','sniper_WL']) then {
		_description = format ['需要拥有Marksman DLC<br/><br/>狙击手的主要职责是侦察，但是当形势需要的时候，狙击手也能够通过精准的狙杀沉重打击敌军士气。这个兵种需要丰富的经验与耐心。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['crewman']) then {
		_description = format ['Tanks DLC Required.<br/><br/>A Crewman is able to operate the Driver and Gunner positions of armored vehicles (Tanks, IFVs and APCs).<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['jtac','jtac_WL']) then {
		_description = format ['JTAC是活跃在前沿的优秀侦察兵和引导员，这些精锐士兵能够沉着冷静地同固定翼单位、直升机单位以及UAV操作员沟通，协调引导后方火力支援打击敌军。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['mortar_gunner']) then {
		_description = format ['迫击炮手为班组提供非直瞄火力支援，同时他们也能熟练地处理地雷、路边炸弹。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['uav']) then {
		_description = format ['UAV操作员是高技术兵种，集侦察、打击于一体的角色。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['pilot_heli','pilot_heli_WL']) then {
		_description = format ['直升机驾驶员提供空中载具运输，将友军投送到战场前沿加入战斗。同时他们也承担着高风险的近距离空中支援任务。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['pilot_plane']) then {
		_description = format ['需要拥有Jets DLC<br/><br/>固定翼飞行员需要保证战场的制空权，保护我军的作战单位，同时要为地面单位提供近距离空中支援。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['commander']) then {
		_description = format ['运筹帷幄，决胜千里之外是指挥官们最好的写照！<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['b_rifleman']) then {
		_description = format ['NATO体验角色，此兵种只有最基础的武器。禁止大量杀伤CSAT玩家，同时禁止围尸打援，酌情放过治疗或拖拽伤兵的CSAT玩家。<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['b_autorifleman']) then {
		_description = format ['NATO体验角色，请遵循NATO玩家行动总体原则！此兵种拥有更多样的武器<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	(parseText _description);
};