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
_tropical = worldName in ['Tanoa','Cam_Lao_Nam'];

QS_roles_data = [
	[
		[
			'o_autorifleman',
			EAST,
			2,
			2,
			-1,
			0,	
			0,
			0,
			{((missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]) && (((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isEqualTo 2) || {(((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isEqualTo 1) && ((getPlayerUID player) in (['OPFOR'] call (missionNamespace getVariable 'QS_fnc_whitelist'))))}))},
			{((player getVariable ['QS_unit_side',WEST]) isEqualTo EAST) || ((missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]) && (((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isEqualTo 2) || {(((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isEqualTo 1) && ((getPlayerUID player) in (['OPFOR'] call (missionNamespace getVariable 'QS_fnc_whitelist'))))}))},
			{}
		]
	],
	[
		[
			'rifleman',
			WEST,
			(playableSlotsNumber WEST),
			(playableSlotsNumber WEST),
			-1,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'autorifleman',
			WEST,
			3,
			10,
			8,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'machine_gunner',
			WEST,
			3,
			10,
			8,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'rifleman_lat',
			WEST,
			3,
			8,
			8,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'rifleman_hat',
			WEST,
			2,
			4,
			10,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'medic',
			WEST,
			3,
			10,
			5,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'engineer',
			WEST,
			3,
			10,
			8,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/ ----- Crewman has no special abilities in official version
		[
			'crewman',
			WEST,
			3,
			6,
			12,
			0,
			0,
			0,
			{FALSE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		/*/
		[
			'mortar_gunner',
			WEST,
			1,
			1,
			-1,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'sniper',
			WEST,
			3,
			3,
			-1,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'jtac',
			WEST,
			1,
			1,
			-1,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		/*/
		[
			'uav',
			WEST,
			1,		// Do not change this, only 1 UAV Operator slot configured
			1,		// Do not change this, only 1 UAV Operator slot configured
			-1,		// Do not change this, only 1 UAV Operator slot configured
			0,		// Do not change this, only 1 UAV Operator slot configured
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'pilot_heli',
			WEST,
			2,
			5,
			8,
			2,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'pilot_plane',
			WEST,
			1,		// Do not change this, only 1 CAS pilot slot configured
			1,		// Do not change this, only 1 CAS pilot slot configured
			-1,		// Do not change this, only 1 CAS pilot slot configured
			0,		// Do not change this, only 1 CAS pilot slot configured
			0,
			0,
			{TRUE},
			{((((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE])) && ((missionNamespace getVariable ['QS_missionConfig_CAS',2]) isNotEqualTo 0))},
			{}
		],
		//------------------------------------------------ Whitelisted roles
		[
			'medic_WL',
			WEST,
			1,
			1,
			-1,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'machine_gunner_WL',
			WEST,
			1,
			1,
			-1,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'sniper_WL',
			WEST,
			1,
			1,
			-1,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'pilot_heli_WL',
			WEST,
			2,			// minimum 1 slot
			2,			// maximum 2 slots
			-1,			// per N players an extra role will open, up to the maximum
			0,			// 2 whitelisted slots (should == maximum slots)
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'commander',
			WEST,
			1,		// Do not change this, only 1 Commander slot configured
			1,		// Do not change this, only 1 Commander slot configured
			-1,		// Do not change this, only 1 Commander slot configured
			0,		// Do not change this, only 1 Commander slot configured
			0,
			0,
			{((missionNamespace getVariable ['QS_missionConfig_Commander',0]) isNotEqualTo 0)},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
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
	['o_rifleman',localize 'STR_QS_Role_013','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['o_autorifleman',localize 'STR_QS_Role_014','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa'],
	['medic_WL',localize 'STR_QS_Role_019','a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa'],
	['machine_gunner_WL',localize 'STR_QS_Role_015','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa'],
	['sniper_WL',localize 'STR_QS_Role_020','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa'],
	['pilot_heli_WL',localize 'STR_QS_Role_025','A3\Air_F_Beta\Heli_Transport_01\Data\UI\Map_Heli_Transport_01_base_CA.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa']
];
QS_roles_defaultLoadouts = [
	['',[]],
	['rifleman',[["vn_m16","","","",["vn_m16_20_t_mag",18],[],""],[],[],["vn_b_uniform_macv_04_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",1,1],["vn_m18_red_mag",1,1],["vn_m16_20_t_mag",1,18]]],["vn_b_vest_usarmy_02",[["vn_m16_20_t_mag",2,18]]],["vn_b_pack_lw_01_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",4,1],["vn_mine_m18_mag",1,1]]],"vn_b_helmet_m1_07_01","",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]]],
	['machine_gunner',[["vn_m60","","","",["vn_m60_100_mag",100],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["vn_b_uniform_macv_05_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m1911_mag",1,7]]],["vn_b_vest_usarmy_06",[["vn_m60_100_mag",1,100]]],["vn_b_pack_lw_02_m60_pl",[["vn_b_item_firstaidkit",2],["vn_m60_100_mag",6,100],["vn_m61_grenade_mag",4,1],["vn_m18_yellow_mag",2,1],["vn_mine_m14_mag",2,1]]],"vn_b_helmet_m1_08_01","vn_b_aviator",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]]],
	['rifleman_lat',[["vn_m16","","","",["vn_m16_20_t_mag",18],[],""],["vn_m72","","","",["vn_m72_mag",1],[],""],[],["vn_b_uniform_macv_05_01",[["vn_b_item_firstaidkit",1],["vn_m67_grenade_mag",2,1],["vn_m16_20_t_mag",3,18]]],["vn_b_vest_usarmy_02",[]],["vn_b_pack_trp_03_02_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m67_grenade_mag",4,1],["vn_mine_m18_mag",2,1]]],"vn_b_bandana_01","vn_b_scarf_01_01",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]]],
	['engineer',[["vn_m1897","","","",["vn_m1897_buck_mag",6],[],""],[],[],["vn_b_uniform_macv_04_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",1,1],["vn_m34_grenade_mag",1,1],["vn_m1897_buck_mag",2,6]]],["vn_b_vest_usarmy_11",[["vn_m1897_buck_mag",1,6]]],["vn_b_pack_lw_04_eng_m1897_pl",[["vn_b_item_toolkit",1],["vn_b_item_firstaidkit",2],["vn_m1897_buck_mag",8,6],["vn_m1897_fl_mag",8,6],["vn_m61_grenade_mag",4,1],["vn_m18_yellow_mag",2,1],["vn_m72_mag",1,1],["vn_mine_m16_mag",2,1],["vn_mine_tripwire_m49_04_mag",4,1],["vn_mine_m112_remote_mag",2,1]]],"vn_b_helmet_m1_05_01","vn_b_scarf_01_03",["vn_m19_binocs_grn","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]]],
	['medic',[["vn_m16","","","",["vn_m16_20_t_mag",18],[],""],[],[],["vn_b_uniform_macv_03_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m18_red_mag",2,1],["vn_m16_20_t_mag",3,18]]],["vn_b_vest_usarmy_07",[]],["vn_b_pack_m5_01_medic_m16_pl",[["vn_b_item_medikit_01",1],["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1]]],"vn_b_helmet_m1_04_01","vn_g_spectacles_02",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]]],
	['sniper',[["vn_m40a1_sniper","","","vn_o_9x_m40a1",["vn_m40a1_t_mag",5],[],""],[],["vn_m10","","","",["vn_m10_mag",6],[],""],["vn_b_uniform_macv_02_01",[["vn_b_item_firstaidkit",1],["vn_m10_mag",1,6],["vn_m61_grenade_mag",2,1],["vn_m18_purple_mag",2,1],["vn_m40a1_t_mag",3,5]]],["vn_b_vest_usarmy_08",[]],["vn_b_pack_trp_02_02_m40a1_pl",[["vn_b_item_firstaidkit",2],["vn_o_anpvs2_m40a1",1],["vn_s_m14",1],["vn_m10_mag",4,6],["vn_m40a1_t_mag",18,5],["vn_m61_grenade_mag",4,1]]],"vn_b_headband_01","vn_b_aviator",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]]],
	['pilot_heli',[[],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["vn_b_uniform_k2b_02_02",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m18_red_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",1,1]]],["vn_b_vest_aircrew_04",[["vn_m18_purple_mag",1,1],["vn_m1911_mag",3,7]]],[],"vn_b_helmet_svh4_01_04","vn_b_aviator",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]]],
	['pilot_plane',[[],[],["vn_m10","","","",["vn_m10_mag",6],[],""],["vn_b_uniform_k2b_01_02",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",1,1],["vn_m18_red_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m10_mag",1,6],["vn_m16_20_mag",1,18]]],["vn_b_vest_aircrew_03",[["vn_m16_20_mag",2,18]]],["B_Parachute",[]],"vn_b_helmet_aph6_01_03","vn_b_acc_ms22001_02",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]]]
];
QS_fnc_roleDescription = compileFinal "
	params ['_role'];
	_tropical = worldName in ['Tanoa'];
	private _description = 'Undefined';
	if (_role in ['rifleman']) then {
		_description = format ['As a Rifleman, you are a front line soldier, and the backbone of the military.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['autorifleman','autorifleman_WL']) then {
		_description = format ['An Automatic Riflemans job is to provide cover fire for their squad during engagements and while their squad is moving.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['machine_gunner','machine_gunner_WL']) then {
		_description = format ['A Machine Gunners job is to provide suppressive fire at long ranges. Unlike their lighter Autorifleman cousins, Machine Gunners may operate as part of a smaller detachment of the squad, and move at a slower pace.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['rifleman_lat','rifleman_lat_WL']) then {
		_description = format ['As a Rifleman (Light Anti-Tank), your role is to provide fire support against infantry, fortifications, unarmored and light-armored vehicles.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['rifleman_hat','rifleman_hat_WL']) then {
		_description = format ['As a Rifleman (Heavy Anti-Tank), your role is to provide fire support against armored vehicles.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['engineer','engineer_WL']) then {
		_description = format ['An Engineer is a combat soldier with a range of tactical and technical skills.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['medic','medic_WL']) then {
		_description = format ['A Medic is responsible for providing First Aid and Medical services to friendly soldiers and non-combatants.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['sniper','sniper_WL']) then {
		_description = format ['Marksman DLC Required.<br/><br/>A Snipers main task is reconaissance. When the mission calls for it, snipers can also dismantle and dishearten the enemy with a few well-placed rifle shots. When there is no specific objective, a sniper will look for targets of opportunity.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['crewman']) then {
		_description = format ['Tanks DLC Required.<br/><br/>A Crewman is able to operate the Driver and Gunner positions of armored vehicles (Tanks, IFVs and APCs).<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['jtac','jtac_WL']) then {
		_description = format ['Working from a forward position, a Joint Terminal Attack Controller (JTAC) directs the action of combat aircraft engaged in close air support and other offensive air operations. This soldier will work closely with Pilots, UAV Operators and Squad Leaders.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['mortar_gunner']) then {
		_description = format ['Mortar Gunners provide indirect fire support to squads. These soldiers can also deactivate mines, explosives and IEDs.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['uav']) then {
		_description = format ['A UAV Operator controls autonomous vehicles for logistics, intel-gathering, support and combat tasks.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['pilot_heli','pilot_heli_WL']) then {
		_description = format ['Transport Pilots provide infantry transport to and from missions.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['pilot_plane']) then {
		_description = format ['Jets DLC Required.<br/><br/>A Fighter Pilot is responsible for providing Close Air Support to ground elements when requested, and flying Combat Air Patrols to protect transport pilots from enemy aircraft.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['commander']) then {
		_description = format ['Organize and deploy available resources (including players) to defeat the enemy. <br/><br/>Soldiers are required under military law to obey your orders.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['o_rifleman']) then {
		_description = format ['As a Rifleman, you are a front line soldier, and the backbone of the military.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role in ['o_autorifleman']) then {
		_description = format ['An Automatic Riflemans job is to provide cover fire for their squad during engagements and while their squad is moving.<br/><br/><img shadow=""0"" align=""center"" size=""18"" image=""media\images\roles\%1\%2.jpg""/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	(parseText _description);
";