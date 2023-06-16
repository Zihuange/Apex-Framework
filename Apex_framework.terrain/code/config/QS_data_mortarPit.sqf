/*/
File: QS_data_mortarPit.sqf
Author:

	Quiksilver
	
Last modified:

	20/04/2018 A3 1.82 by Quiksilver
	
Description:

	Mortar pit
__________________________________________________________________________/*/

if (worldName in ['Tanoa','Lingor3']) exitWith {
	[
		["Land_BagFence_01_round_green_F",[0.84375,-0.822754,-0.0026021],93.7561,[],false,false,TRUE,{}], 
		["Land_BagFence_01_round_green_F",[-0.249023,1.80664,-0.0026021],285.207,[],false,false,TRUE,{}], 
		["Land_BagFence_01_round_green_F",[-2.33203,0.675293,-0.0026021],14.8742,[],false,false,TRUE,{}], 
		["Land_BagFence_01_round_green_F",[-1.79004,-1.65137,-0.0026021],190.105,[],false,false,TRUE,{}], 
		["vn_o_nva_65_static_mortar_type63",[-1.45361,2.0835,-0.0753462],0,[],false,TRUE,false,{
			_mortar = _this # 0;
			_grp = createVehicleCrew _mortar;
			{
				missionNamespace setVariable ['QS_HC_AO_enemyArray',((missionNamespace getVariable 'QS_HC_AO_enemyArray') + [_x]),FALSE];
			} forEach [
				_mortar,
				(effectiveCommander _mortar)
			];
			if (worldName in ['Tanoa','Lingor3']) then {
				(effectiveCommander _mortar) setUnitLoadout (selectRandom [
					"I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F",
					"I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"
				]);
			} else {
				(effectiveCommander _mortar) setUnitLoadout (selectRandom [
					"vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_14", "vn_o_men_vc_12", "vn_o_men_vc_10", "vn_o_men_vc_09", "vn_o_men_vc_07", 
					"vn_o_men_vc_13", "vn_o_men_vc_11", "vn_o_men_vc_06", "vn_o_men_vc_04", "vn_o_men_vc_05", "vn_o_men_vc_02", "vn_o_men_vc_03"
				]);
			};
			_mortar lock 3;
			_mortar enableDynamicSimulation FALSE;
			_mortar setVariable ['QS_dynSim_ignore',TRUE,FALSE];
			_mortar enableWeaponDisassembly FALSE;
			_mortar setVariable ['QS_hidden',TRUE,TRUE];
			_mortar addEventHandler [
				'Killed',
				{
					_mortar = _this # 0;
					if (!isNull (gunner _mortar)) then {
						(gunner _mortar) setDamage 1;
					};
				}
			];
			_mortar addEventHandler [
				'GetOut',
				{
					_mortar = _this # 0;
					_mortar setDamage [1,FALSE];
				}
			];
			(gunner _mortar) addEventHandler [
				'Killed',
				{
					params ['_killed','_killer'];
					(vehicle _killed) setDamage 1;
				}
			];
			(gunner _mortar) call (missionNamespace getVariable 'QS_fnc_unitSetup');
			(gunner _mortar) addEventHandler [
				'FiredMan',
				{
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg']) then {
						if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells']) then {
							(_this # 6) addEventHandler ['Explode',{(_this + [0]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						} else {
							(_this # 6) addEventHandler ['Explode',{(_this + [1]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						};
					};
					if (isNil {missionNamespace getVariable 'QS_enemy_mortarFireMessage'}) then {
						missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
					};
					if ((missionNamespace getVariable 'QS_enemy_mortarFireMessage') > (diag_tickTime - 300)) exitWith {};
					missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
					['sideChat',[WEST,'HQ'],localize 'STR_QS_Chat_007'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
				}
			];
			(gunner _mortar) addEventHandler [
				'GetOutMan',
				{
					(_this # 0) removeAllEventHandlers 'FiredMan';
				}
			];
			(gunner _mortar) addEventHandler [
				'HandleRating',
				{
					params ['_unit','_rating'];
					if ((rating _unit) < 0) then {
						_unit addRating (0 - (rating _unit));
					};
				}
			];
			missionNamespace setVariable ['QS_AI_supportProviders_MTR',((missionNamespace getVariable 'QS_AI_supportProviders_MTR') + [gunner _mortar]),QS_system_AI_owners];
			_grp deleteGroupWhenEmpty TRUE;
			_grp enableDynamicSimulation FALSE;
			_grp setVariable ['QS_dynSim_ignore',TRUE,FALSE];
			_grp addVehicle _mortar;
			_grp setVariable ['QS_AI_GRP',TRUE,FALSE];
			_grp setVariable ['QS_AI_GRP_CONFIG',['SUPPORT','MORTAR',_mortar],FALSE];
			_grp setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],FALSE];
			_grp setVariable ['QS_AI_GRP_TASK',['SUPPORT','MORTAR',serverTime,-1],FALSE];	
			_mortar;
		}], 
		["Land_BagFence_01_round_green_F",[2.76563,0.580566,-0.0026021],190.105,[],false,false,TRUE,{}], 
		["vn_o_nva_65_static_mortar_type63",[2.96875,-1.1333,-0.0753462],0,[],false,TRUE,false,{
			_mortar = _this # 0;
			_grp = createVehicleCrew _mortar;
			{
				missionNamespace setVariable [
					'QS_HC_AO_enemyArray',
					((missionNamespace getVariable 'QS_HC_AO_enemyArray') + [_x]),
					FALSE
				];
			} forEach [
				_mortar,
				(effectiveCommander _mortar)
			];
			if (worldName in ['Tanoa','Lingor3']) then {
				(effectiveCommander _mortar) setUnitLoadout (selectRandom [
					"I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F",
					"I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"
				]);
			} else {
				(effectiveCommander _mortar) setUnitLoadout (selectRandom [
					"vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_14", "vn_o_men_vc_12", "vn_o_men_vc_10", "vn_o_men_vc_09", "vn_o_men_vc_07", 
					"vn_o_men_vc_13", "vn_o_men_vc_11", "vn_o_men_vc_06", "vn_o_men_vc_04", "vn_o_men_vc_05", "vn_o_men_vc_02", "vn_o_men_vc_03"
				]);
			};
			_mortar lock 3;
			_mortar enableDynamicSimulation FALSE;
			_mortar setVariable ['QS_dynSim_ignore',TRUE,FALSE];
			_mortar enableWeaponDisassembly FALSE;
			_mortar setVariable ['QS_hidden',TRUE,TRUE];
			_mortar addEventHandler [
				'Killed',
				{
					_mortar = _this # 0;
					if (!isNull (gunner _mortar)) then {
						(gunner _mortar) setDamage 1;
					};
				}
			];
			_mortar addEventHandler [
				'GetOut',
				{
					_mortar = _this # 0;
					_mortar setDamage [1,FALSE];
				}
			];
			(gunner _mortar) addEventHandler [
				'Killed',
				{
					params ['_killed','_killer'];
					(vehicle _killed) setDamage 1;
				}
			];
			(gunner _mortar) call (missionNamespace getVariable 'QS_fnc_unitSetup');
			(gunner _mortar) addEventHandler [
				'FiredMan',
				{
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg']) then {
						if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells']) then {
							(_this # 6) addEventHandler ['Explode',{(_this + [0]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						} else {
							(_this # 6) addEventHandler ['Explode',{(_this + [1]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						};
					};
					if (isNil {missionNamespace getVariable 'QS_enemy_mortarFireMessage'}) then {
						missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
					};
					if ((missionNamespace getVariable 'QS_enemy_mortarFireMessage') > (diag_tickTime - 300)) exitWith {};
					missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
					['sideChat',[WEST,'HQ'],localize 'STR_QS_Chat_007'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
				}
			];
			(gunner _mortar) addEventHandler [
				'HandleRating',
				{
					params ['_unit','_rating'];
					if ((rating _unit) < 0) then {
						_unit addRating (0 - (rating _unit));
					};
				}
			];
			missionNamespace setVariable ['QS_AI_supportProviders_MTR',((missionNamespace getVariable 'QS_AI_supportProviders_MTR') + [gunner _mortar]),QS_system_AI_owners];
			_grp deleteGroupWhenEmpty TRUE;
			_grp enableDynamicSimulation FALSE;
			_grp setVariable ['QS_dynSim_ignore',TRUE,FALSE];
			_grp addVehicle _mortar;
			_grp setVariable ['QS_AI_GRP',TRUE,FALSE];
			_grp setVariable ['QS_AI_GRP_CONFIG',['SUPPORT','MORTAR',_mortar],FALSE];
			_grp setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],FALSE];
			_grp setVariable ['QS_AI_GRP_TASK',['SUPPORT','MORTAR',serverTime,-1],FALSE];
			_mortar;
		}], 
		["Land_BagFence_01_round_green_F",[2.02832,-2.75488,-0.0026021],14.8742,[],false,false,TRUE,{}], 
		["vn_o_nva_65_static_mortar_type63",[-1.67529,-3.41846,-0.0753462],0,[],false,TRUE,false,{
			_mortar = _this # 0;
			_grp = createVehicleCrew _mortar;
			{
				missionNamespace setVariable [
					'QS_HC_AO_enemyArray',
					((missionNamespace getVariable 'QS_HC_AO_enemyArray') + [_x]),
					FALSE
				];
			} forEach [
				_mortar,
				(effectiveCommander _mortar)
			];
			if (worldName in ['Tanoa','Lingor3']) then {
				(effectiveCommander _mortar) setUnitLoadout (selectRandom [
					"I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F",
					"I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"
				]);
			} else {
				(effectiveCommander _mortar) setUnitLoadout (selectRandom [
					"vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_14", "vn_o_men_vc_12", "vn_o_men_vc_10", "vn_o_men_vc_09", "vn_o_men_vc_07", 
					"vn_o_men_vc_13", "vn_o_men_vc_11", "vn_o_men_vc_06", "vn_o_men_vc_04", "vn_o_men_vc_05", "vn_o_men_vc_02", "vn_o_men_vc_03"
				]);
			};
			_mortar lock 3;
			_mortar enableDynamicSimulation FALSE;
			_mortar setVariable ['QS_dynSim_ignore',TRUE,FALSE];
			_mortar enableWeaponDisassembly FALSE;
			_mortar setVariable ['QS_hidden',TRUE,TRUE];
			_mortar addEventHandler [
				'Killed',
				{
					_mortar = _this # 0;
					if (!isNull (gunner _mortar)) then {
						(gunner _mortar) setDamage 1;
					};
				}
			];
			_mortar addEventHandler [
				'GetOut',
				{
					_mortar = _this # 0;
					_mortar setDamage [1,FALSE];
				}
			];
			(gunner _mortar) addEventHandler [
				'Killed',
				{
					params ['_killed','_killer'];
					(vehicle _killed) setDamage 1;
				}
			];
			(gunner _mortar) call (missionNamespace getVariable 'QS_fnc_unitSetup');
			(gunner _mortar) addEventHandler [
				'FiredMan',
				{
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg']) then {
						if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells']) then {
							(_this # 6) addEventHandler ['Explode',{(_this + [0]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						} else {
							(_this # 6) addEventHandler ['Explode',{(_this + [1]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						};
					};
					if (isNil {missionNamespace getVariable 'QS_enemy_mortarFireMessage'}) then {
						missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
					};
					if ((missionNamespace getVariable 'QS_enemy_mortarFireMessage') > (diag_tickTime - 300)) exitWith {};
					missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
					['sideChat',[WEST,'HQ'],localize 'STR_QS_Chat_007'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
				}
			];
			(gunner _mortar) addEventHandler [
				'HandleRating',
				{
					params ['_unit','_rating'];
					if ((rating _unit) < 0) then {
						_unit addRating (0 - (rating _unit));
					};
				}
			];
			missionNamespace setVariable ['QS_AI_supportProviders_MTR',((missionNamespace getVariable 'QS_AI_supportProviders_MTR') + [gunner _mortar]),QS_system_AI_owners];
			_grp deleteGroupWhenEmpty TRUE;
			_grp enableDynamicSimulation FALSE;
			_grp setVariable ['QS_dynSim_ignore',TRUE,FALSE];
			_grp addVehicle _mortar;
			_grp setVariable ['QS_AI_GRP',TRUE,FALSE];
			_grp setVariable ['QS_AI_GRP_CONFIG',['SUPPORT','MORTAR',_mortar],FALSE];
			_grp setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],FALSE];
			_grp setVariable ['QS_AI_GRP_TASK',['SUPPORT','MORTAR',serverTime,-1],FALSE];
			_mortar;
		}], 
		["Land_BagFence_01_round_green_F",[-0.445313,-3.85547,-0.0026021],285.207,[],false,false,TRUE,{}], 
		["Land_BagFence_01_round_green_F",[-1.59424,4.01123,-0.0026021],190.105,[],false,false,TRUE,{}], 
		["Land_BagFence_01_round_green_F",[-3.5166,2.60791,-0.0026021],93.7561,[],false,false,TRUE,{}], 
		["Land_BagFence_01_round_green_F",[4.11084,-1.62354,-0.0026021],285.207,[],false,false,TRUE,{}], 
		["Land_BagFence_01_round_green_F",[-3.7124,-3.05469,-0.0026021],93.7561,[],false,false,TRUE,{}], 
		["Land_BagFence_01_round_green_F",[-2.52783,-4.98682,-0.0026021],14.8742,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[4.88965,-4.34033,0],315.506,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[0.389648,7.02051,0],182.663,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[0.224609,-7.30664,0],341.417,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[-4.62158,5.82764,0],154.725,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_big_4_green_F",[7.14893,-2.6626,0],295.284,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_big_4_green_F",[2.18213,7.67627,0],204.466,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_big_4_green_F",[2.93066,-7.61279,0],332.658,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[-8.00098,1.81592,0],106.998,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[-4.29248,-7.03857,0],17.6912,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[-7.85596,-3.39355,0],65.8922,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[8.31641,-2.51416,0],95.9111,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_big_4_green_F",[-5.2002,7.14795,0],154.693,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_big_4_green_F",[-3.50244,-8.61816,0],16.6592,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[2.23389,9.08545,0],28.0912,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_big_4_green_F",[-9.31348,1.82959,0],107.606,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_3_green_F",[7.21094,-6.1792,0],128.997,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[3.97314,-8.66846,0],150.552,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_big_4_green_F",[-8.57959,-4.69824,0],65.5002,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_3_green_F",[6.43311,7.3374,0],13.3802,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_big_4_green_F",[7.54834,6.43604,0],342.142,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_3_green_F",[0.347168,-10.0596,0],175.616,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[-5.42236,8.50928,0],334.226,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_3_green_F",[-1.42822,10.0142,0],346.88,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[-3.82617,-9.47314,0],195.276,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_3_green_F",[-8.87109,6.28613,0],312.677,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[-10.7017,2.71973,0],287.641,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_3_green_F",[-7.67773,-8.07568,0],210.771,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_5_green_F",[-9.93604,-5.08887,0],244.746,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_line_3_green_F",[-11.2925,-1.20898,0],262.422,[],false,false,TRUE,{}], 
		["Land_HBarrier_01_big_4_green_F",[12.085,4.28906,0],71.8171,[],false,false,TRUE,{}]
	]
};
[
	["vn_o_nva_65_static_mortar_type63",[2.18286,-0.728516,0.0368891],360,[],false,true,false,{
		_mortar = _this # 0;
		_grp = createVehicleCrew _mortar;
		{
			missionNamespace setVariable [
				'QS_HC_AO_enemyArray',
				((missionNamespace getVariable 'QS_HC_AO_enemyArray') + [_x]),
				FALSE
			];
		} forEach [
			_mortar,
			(effectiveCommander _mortar)
		];
		if (worldName in ['Tanoa','Lingor3']) then {
			(effectiveCommander _mortar) setUnitLoadout (selectRandom [
				"I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F",
				"I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"
			]);
		} else {
			(effectiveCommander _mortar) setUnitLoadout (selectRandom [
				"vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_14", "vn_o_men_vc_12", "vn_o_men_vc_10", "vn_o_men_vc_09", "vn_o_men_vc_07", 
				"vn_o_men_vc_13", "vn_o_men_vc_11", "vn_o_men_vc_06", "vn_o_men_vc_04", "vn_o_men_vc_05", "vn_o_men_vc_02", "vn_o_men_vc_03"
			]);
		};
		_mortar lock 3;
		_mortar enableDynamicSimulation FALSE;
		_mortar setVariable ['QS_dynSim_ignore',TRUE,FALSE];
		_mortar enableWeaponDisassembly FALSE;
		_mortar setVariable ['QS_hidden',TRUE,TRUE];
		_mortar addEventHandler [
			'Killed',
			{
				_mortar = _this # 0;
				if (!isNull (gunner _mortar)) then {
					(gunner _mortar) setDamage 1;
				};
			}
		];
		_mortar addEventHandler [
			'GetOut',
			{
				_mortar = _this # 0;
				_mortar setDamage [1,FALSE];
			}
		];
		(gunner _mortar) addEventHandler [
			'Killed',
			{
				params ['_killed','_killer'];
				(vehicle _killed) setDamage 1;
			}
		];
		(gunner _mortar) call (missionNamespace getVariable 'QS_fnc_unitSetup');
		(gunner _mortar) addEventHandler [
			'FiredMan',
			{
				if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg']) then {
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells']) then {
						(_this # 6) addEventHandler ['Explode',{(_this + [0]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
					} else {
						(_this # 6) addEventHandler ['Explode',{(_this + [1]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
					};
				};
				if (isNil {missionNamespace getVariable 'QS_enemy_mortarFireMessage'}) then {
					missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
				};
				if ((missionNamespace getVariable 'QS_enemy_mortarFireMessage') > (diag_tickTime - 300)) exitWith {};
				missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
				['sideChat',[WEST,'HQ'],localize 'STR_QS_Chat_007'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
			}
		];
		(gunner _mortar) addEventHandler [
			'HandleRating',
			{
				params ['_unit','_rating'];
				if ((rating _unit) < 0) then {
					_unit addRating (0 - (rating _unit));
				};
			}
		];
		missionNamespace setVariable ['QS_AI_supportProviders_MTR',((missionNamespace getVariable 'QS_AI_supportProviders_MTR') + [gunner _mortar]),QS_system_AI_owners];
		_grp deleteGroupWhenEmpty TRUE;
		_grp enableDynamicSimulation FALSE;
		_grp setVariable ['QS_dynSim_ignore',TRUE,FALSE];
		_grp addVehicle _mortar;
		_grp setVariable ['QS_AI_GRP',TRUE,FALSE];
		_grp setVariable ['QS_AI_GRP_CONFIG',['SUPPORT','MORTAR',_mortar],FALSE];
		_grp setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],FALSE];
		_grp setVariable ['QS_AI_GRP_TASK',['SUPPORT','MORTAR',serverTime,-1],FALSE];
		_mortar;
	}], 
	["vn_o_nva_65_static_mortar_type63",[-1.76733,1.68164,0.0368843],360,[],false,true,false,{
		_mortar = _this # 0;
		_grp = createVehicleCrew _mortar;
		{
			missionNamespace setVariable [
				'QS_HC_AO_enemyArray',
				((missionNamespace getVariable 'QS_HC_AO_enemyArray') + [_x]),
				FALSE
			];
		} forEach [
			_mortar,
			(effectiveCommander _mortar)
		];
		if (worldName in ['Tanoa','Lingor3']) then {
			(effectiveCommander _mortar) setUnitLoadout (selectRandom [
				"I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F",
				"I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"
			]);
		} else {
			(effectiveCommander _mortar) setUnitLoadout (selectRandom [
				"vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_14", "vn_o_men_vc_12", "vn_o_men_vc_10", "vn_o_men_vc_09", "vn_o_men_vc_07", 
				"vn_o_men_vc_13", "vn_o_men_vc_11", "vn_o_men_vc_06", "vn_o_men_vc_04", "vn_o_men_vc_05", "vn_o_men_vc_02", "vn_o_men_vc_03"
			]);
		};
		_mortar lock 3;
		_mortar enableDynamicSimulation FALSE;
		_mortar setVariable ['QS_dynSim_ignore',TRUE,FALSE];
		_mortar enableWeaponDisassembly FALSE;
		_mortar setVariable ['QS_hidden',TRUE,TRUE];
		_mortar addEventHandler [
			'Killed',
			{
				_mortar = _this # 0;
				if (!isNull (gunner _mortar)) then {
					(gunner _mortar) setDamage 1;
				};
			}
		];
		_mortar addEventHandler [
			'GetOut',
			{
				_mortar = _this # 0;
				_mortar setDamage [1,FALSE];
			}
		];
		(gunner _mortar) addEventHandler [
			'Killed',
			{
				params ['_killed','_killer'];
				(vehicle _killed) setDamage 1;
			}
		];
		(gunner _mortar) call (missionNamespace getVariable 'QS_fnc_unitSetup');
		(gunner _mortar) addEventHandler [
			'FiredMan',
			{
				if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg']) then {
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells']) then {
						(_this # 6) addEventHandler ['Explode',{(_this + [0]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
					} else {
						(_this # 6) addEventHandler ['Explode',{(_this + [1]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
					};
				};
				if (isNil {missionNamespace getVariable 'QS_enemy_mortarFireMessage'}) then {
					missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
				};
				if ((missionNamespace getVariable 'QS_enemy_mortarFireMessage') > (diag_tickTime - 300)) exitWith {};
				missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
				['sideChat',[WEST,'HQ'],localize 'STR_QS_Chat_007'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
			}
		];
		(gunner _mortar) addEventHandler [
			'HandleRating',
			{
				params ['_unit','_rating'];
				if ((rating _unit) < 0) then {
					_unit addRating (0 - (rating _unit));
				};
			}
		];
		missionNamespace setVariable ['QS_AI_supportProviders_MTR',((missionNamespace getVariable 'QS_AI_supportProviders_MTR') + [gunner _mortar]),QS_system_AI_owners];
		_grp deleteGroupWhenEmpty TRUE;
		_grp enableDynamicSimulation FALSE;
		_grp setVariable ['QS_dynSim_ignore',TRUE,FALSE];
		_grp addVehicle _mortar;
		_grp setVariable ['QS_AI_GRP',TRUE,FALSE];
		_grp setVariable ['QS_AI_GRP_CONFIG',['SUPPORT','MORTAR',_mortar],FALSE];
		_grp setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],FALSE];
		_grp setVariable ['QS_AI_GRP_TASK',['SUPPORT','MORTAR',serverTime,-1],FALSE];
		_mortar;
	}], 
	["vn_o_nva_65_static_mortar_type63",[-1.59766,-2.84863,0.0368848],360,[],false,true,false,{
		_mortar = _this # 0;
		_grp = createVehicleCrew _mortar;
		{
			missionNamespace setVariable [
				'QS_HC_AO_enemyArray',
				((missionNamespace getVariable 'QS_HC_AO_enemyArray') + [_x]),
				FALSE
			];
		} forEach [
			_mortar,
			(effectiveCommander _mortar)
		];
		if (worldName in ['Tanoa','Lingor3']) then {
			(effectiveCommander _mortar) setUnitLoadout (selectRandom [
				"I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F",
				"I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"
			]);
		} else {
			(effectiveCommander _mortar) setUnitLoadout (selectRandom [
				"vn_o_men_vc_01", "vn_o_men_vc_08", "vn_o_men_vc_14", "vn_o_men_vc_12", "vn_o_men_vc_10", "vn_o_men_vc_09", "vn_o_men_vc_07", 
				"vn_o_men_vc_13", "vn_o_men_vc_11", "vn_o_men_vc_06", "vn_o_men_vc_04", "vn_o_men_vc_05", "vn_o_men_vc_02", "vn_o_men_vc_03"
			]);
		};
		_mortar lock 3;
		_mortar enableDynamicSimulation FALSE;
		_mortar setVariable ['QS_dynSim_ignore',TRUE,FALSE];
		_mortar enableWeaponDisassembly FALSE;
		_mortar setVariable ['QS_hidden',TRUE,TRUE];
		_mortar addEventHandler [
			'Killed',
			{
				_mortar = _this # 0;
				if (!isNull (gunner _mortar)) then {
					(gunner _mortar) setDamage 1;
				};
			}
		];
		_mortar addEventHandler [
			'GetOut',
			{
				_mortar = _this # 0;
				_mortar setDamage [1,FALSE];
			}
		];
		(gunner _mortar) addEventHandler [
			'Killed',
			{
				params ['_killed','_killer'];
				(vehicle _killed) setDamage 1;
			}
		];
		(gunner _mortar) call (missionNamespace getVariable 'QS_fnc_unitSetup');
		(gunner _mortar) addEventHandler [
			'FiredMan',
			{
				if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg']) then {
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells']) then {
						(_this # 6) addEventHandler ['Explode',{(_this + [0]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
					} else {
						(_this # 6) addEventHandler ['Explode',{(_this + [1]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
					};
				};
				if (isNil {missionNamespace getVariable 'QS_enemy_mortarFireMessage'}) then {
					missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
				};
				if ((missionNamespace getVariable 'QS_enemy_mortarFireMessage') > (diag_tickTime - 300)) exitWith {};
				missionNamespace setVariable ['QS_enemy_mortarFireMessage',diag_tickTime,FALSE];
				['sideChat',[WEST,'HQ'],localize 'STR_QS_Chat_007'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
			}
		];
		(gunner _mortar) addEventHandler [
			'HandleRating',
			{
				params ['_unit','_rating'];
				if ((rating _unit) < 0) then {
					_unit addRating (0 - (rating _unit));
				};
			}
		];
		missionNamespace setVariable ['QS_AI_supportProviders_MTR',((missionNamespace getVariable 'QS_AI_supportProviders_MTR') + [gunner _mortar]),QS_system_AI_owners];
		_grp deleteGroupWhenEmpty TRUE;
		_grp enableDynamicSimulation FALSE;
		_grp setVariable ['QS_dynSim_ignore',TRUE,FALSE];
		_grp addVehicle _mortar;
		_grp setVariable ['QS_AI_GRP',TRUE,FALSE];
		_grp setVariable ['QS_AI_GRP_CONFIG',['SUPPORT','MORTAR',_mortar],FALSE];
		_grp setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],FALSE];
		_grp setVariable ['QS_AI_GRP_TASK',['SUPPORT','MORTAR',serverTime,-1],FALSE];
		_mortar;
	}], 
	["Land_vn_bagfence_01_round_green_f",[2.19263,1.06201,0],179.65,[],false,false,true,{}], 
	["Land_vn_bagfence_01_round_green_f",[2.10278,-1.60791,0],0,[],false,false,true,{}], 
	["Land_vn_bagfence_01_round_green_f",[-0.687256,2.93213,0],231.282,[],false,false,true,{}], 
	["Land_vn_bagfence_01_round_green_f",[-2.82739,1.32178,0],50.9324,[],false,false,true,{}], 
	["Land_vn_bagfence_01_round_green_f",[-0.537354,-3.20801,0],301.007,[],false,false,true,{}], 
	["Land_vn_bagfence_01_round_green_f",[-2.77734,-1.74805,0],121.357,[],false,false,true,{}], 
	["Land_vn_bagfence_01_round_green_f",[3.55249,-0.328125,0],270.265,[],false,false,true,{}], 
	["Land_vn_bagfence_01_round_green_f",[-2.58691,3.25244,0],141.547,[],false,false,true,{}], 
	["Land_vn_bagfence_01_round_green_f",[-2.43726,-3.63818,0],31.6216,[],false,false,true,{}], 
	["Land_vn_b_trench_05_02",[-6.27808,5.77246,1.10404],321.891,[],false,false,true,{}], 
	["Land_vn_camonet_east",[0.465332,8.52783,1],0,[],false,false,true,{}], 
	["Land_vn_camonet_east",[-8.64014,-0.197754,1],270.568,[],false,false,true,{}], 
	["Land_vn_b_trench_05_02",[6.52148,6.021,1.10404],38.125,[],false,false,true,{}], 
	["Land_vn_camonet_east",[0.145264,-8.96924,1],180.087,[],false,false,true,{}], 
	["Land_vn_b_trench_05_02",[0.0722656,-9.05273,1.10404],181.246,[],false,false,true,{}], 
	["Land_vn_camonet_east",[9.24756,0.0170898,1],90.9594,[],false,false,true,{}], 
	["Land_vn_b_trench_05_02",[-6.18726,-6.90625,1.10404],218.125,[],false,false,true,{}], 
	["Land_vn_b_trench_05_02",[-9.29688,-0.518066,1.10404],270.259,[],false,false,true,{}], 
	["Land_vn_b_trench_05_02",[6.50366,-6.85986,1.10404],141.891,[],false,false,true,{}], 
	["Land_vn_b_trench_05_02",[9.56299,-0.198242,1.10404],90.2589,[],false,false,true,{}], 
	["Land_vn_b_trench_revetment_05_01",[0.258057,10.8628,0.704113],1.246,[],false,false,true,{}]
]