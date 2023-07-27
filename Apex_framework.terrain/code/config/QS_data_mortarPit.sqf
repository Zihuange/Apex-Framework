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
		["I_G_Mortar_01_F",[-1.45361,2.0835,-0.0753462],0,[],false,TRUE,false,{
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
					"O_soldierU_A_F","O_soldierU_AAR_F","O_soldierU_AR_F","O_soldierU_medic_F","O_engineer_U_F","O_soldierU_exp_F","O_SoldierU_GL_F",
					"O_Urban_HeavyGunner_F","O_soldierU_M_F","O_soldierU_AT_F","O_soldierU_F","O_soldierU_LAT_F","O_Urban_Sharpshooter_F",
					"O_SoldierU_SL_F","O_soldierU_TL_F","O_G_engineer_F","O_G_medic_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_Soldier_exp_F","O_G_Soldier_F","O_G_Soldier_F",
					"O_G_Soldier_GL_F","O_G_Soldier_LAT_F","O_G_Soldier_lite_F","O_G_Soldier_M_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F",
					"O_G_Sharpshooter_F","O_G_Soldier_AR_F"
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
		["I_G_Mortar_01_F",[2.96875,-1.1333,-0.0753462],0,[],false,TRUE,false,{
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
					"O_soldierU_A_F","O_soldierU_AAR_F","O_soldierU_AR_F","O_soldierU_medic_F","O_engineer_U_F","O_soldierU_exp_F","O_SoldierU_GL_F",
					"O_Urban_HeavyGunner_F","O_soldierU_M_F","O_soldierU_AT_F","O_soldierU_F","O_soldierU_LAT_F","O_Urban_Sharpshooter_F",
					"O_SoldierU_SL_F","O_soldierU_TL_F","O_G_engineer_F","O_G_medic_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_Soldier_exp_F","O_G_Soldier_F","O_G_Soldier_F",
					"O_G_Soldier_GL_F","O_G_Soldier_LAT_F","O_G_Soldier_lite_F","O_G_Soldier_M_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F",
					"O_G_Sharpshooter_F","O_G_Soldier_AR_F"
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
		["I_G_Mortar_01_F",[-1.67529,-3.41846,-0.0753462],0,[],false,TRUE,false,{
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
					"O_soldierU_A_F","O_soldierU_AAR_F","O_soldierU_AR_F","O_soldierU_medic_F","O_engineer_U_F","O_soldierU_exp_F","O_SoldierU_GL_F",
					"O_Urban_HeavyGunner_F","O_soldierU_M_F","O_soldierU_AT_F","O_soldierU_F","O_soldierU_LAT_F","O_Urban_Sharpshooter_F",
					"O_SoldierU_SL_F","O_soldierU_TL_F","O_G_engineer_F","O_G_medic_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_Soldier_exp_F","O_G_Soldier_F","O_G_Soldier_F",
					"O_G_Soldier_GL_F","O_G_Soldier_LAT_F","O_G_Soldier_lite_F","O_G_Soldier_M_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F",
					"O_G_Sharpshooter_F","O_G_Soldier_AR_F"
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
	["SPE_M1_81",[2.94039,0.451424,0.0370002],0,[],false,true,false,{
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
				"SPE_US_Autorifleman", 
				"SPE_US_AHMGunner", 
				"SPE_US_Mortar_AGunner", 
				"SPE_US_Assist_SquadLead", 
				"SPE_US_Assist_Autorifleman", 
				"SPE_US_Medic", 
				"SPE_US_AT_Soldier", 
				"SPE_US_Engineer", 
				"SPE_US_HMG_AmmoBearer", 
				"SPE_US_Mortar_AmmoBearer", 
				"SPE_US_Rifleman_AmmoBearer", 
				"SPE_US_Grenadier", 
				"SPE_US_HMGunner", 
				"SPE_US_Rifleman", 
				"SPE_US_Mortar_Gunner", 
				"SPE_US_Sniper", 
				"SPE_US_SquadLead"
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
				if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg','SPE_8Rnd_81mmHE_M1_M43A1']) then {
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','SPE_8Rnd_81mmHE_M1_M43A1']) then {
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
	["SPE_M1_81",[-3.48161,0.608421,0.0370002],0,[],false,true,false,{
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
				"SPE_US_Autorifleman", 
				"SPE_US_AHMGunner", 
				"SPE_US_Mortar_AGunner", 
				"SPE_US_Assist_SquadLead", 
				"SPE_US_Assist_Autorifleman", 
				"SPE_US_Medic", 
				"SPE_US_AT_Soldier", 
				"SPE_US_Engineer", 
				"SPE_US_HMG_AmmoBearer", 
				"SPE_US_Mortar_AmmoBearer", 
				"SPE_US_Rifleman_AmmoBearer", 
				"SPE_US_Grenadier", 
				"SPE_US_HMGunner", 
				"SPE_US_Rifleman", 
				"SPE_US_Mortar_Gunner", 
				"SPE_US_Sniper", 
				"SPE_US_SquadLead"
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
				if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg','SPE_8Rnd_81mmHE_M1_M43A1']) then {
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','SPE_8Rnd_81mmHE_M1_M43A1']) then {
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
	["SPE_M1_81",[0.500389,-4.75258,0.0370002],0,[],false,true,false,{
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
				"SPE_US_Autorifleman", 
				"SPE_US_AHMGunner", 
				"SPE_US_Mortar_AGunner", 
				"SPE_US_Assist_SquadLead", 
				"SPE_US_Assist_Autorifleman", 
				"SPE_US_Medic", 
				"SPE_US_AT_Soldier", 
				"SPE_US_Engineer", 
				"SPE_US_HMG_AmmoBearer", 
				"SPE_US_Mortar_AmmoBearer", 
				"SPE_US_Rifleman_AmmoBearer", 
				"SPE_US_Grenadier", 
				"SPE_US_HMGunner", 
				"SPE_US_Rifleman", 
				"SPE_US_Mortar_Gunner", 
				"SPE_US_Sniper", 
				"SPE_US_SquadLead"
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
				if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg','SPE_8Rnd_81mmHE_M1_M43A1']) then {
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','SPE_8Rnd_81mmHE_M1_M43A1']) then {
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
	["Land_SPE_Sandbag_Nest",[1.81161,1.46364,0],289.416,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Nest",[-3.17424,-0.0544281,0],170.741,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Nest",[3.19685,-0.217514,0],170.741,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Nest",[-2.50676,2.11061,0],41.198,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Nest",[1.35847,-3.20384,0],41.198,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Nest",[-0.69426,-3.68773,0],289.416,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Nest",[3.86433,1.94753,0],41.198,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Nest",[-4.55949,1.62673,0],289.416,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Nest",[0.690994,-5.36888,0],170.741,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[0.05439,7.71942,0.758],2.173,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[6.35724,4.9846,0.758276],50.2209,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[4.14633,7.20098,0.758276],22.3974,[],false,true,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[-8.62323,-0.857689,0.758276],270.299,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[8.69721,1.93784,0.758276],72.7721,[],false,true,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[9.14532,-1.65359,0.758276],91.267,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[-8.47114,-4.20677,0.758276],251.917,[],false,true,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[-6.02899,-7.40652,0.758276],228.829,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[-8.97217,3.57938,0.758276],256.361,[],false,true,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[8.62193,-5.58728,0.758276],115.767,[],false,true,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[6.50372,-8.00173,0.758276],136.879,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[0.2005,-10.3499,0.758276],182.117,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[-3.76945,-9.87921,0.758276],212.098,[],false,true,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[-3.29249,10.1895,0.757999],90.994,[],false,true,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[3.51137,-10.2916,0.758276],160.709,[],false,true,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[-10.4316,7.11466,0.758277],242.861,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m45_sandbags",[-11.0792,10.8509,0.758],288.552,[],false,true,true,{}]
]