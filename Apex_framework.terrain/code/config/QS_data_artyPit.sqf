/*/
File: QS_data_artyPit.sqf
Author:

	Quiksilver
	
Last modified:

	29/03/2018 A3 1.82 by Quiksilver
	
Description:

	Mortar pit
	
To Do:

	Altis/Desert/Sand variant
__________________________________________________________________________/*/

[
	["Land_SPE_Sandbag_Long_Thick",[-0.421311,-1.25451,0],261,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Long_Thick",[3.86325,-0.617511,0],80,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Long_Thick",[-0.147816,-4.13314,0],353,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Long_Thick",[-4.65901,-1.78685,0],261,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[-3.711,5.98859,0.75],263.161,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[-7.12695,2.11959,0.75],354.161,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[6.38778,4.50589,0.75],357.917,[],false,false,true,{}], 
	["Land_SPE_Sandbag_Long_Thick",[0.261,-8.43741,0],352.593,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[2.69881,8.42482,0.75],83.161,[],false,false,true,{}], 
	["SPE_AmmoCrate_VehicleAmmo_US",[-1.80033,-8.7569,0.029542],359.057,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[9.9597,4.16057,0.75],25,[],false,false,true,{}], 
	["SPE_AmmoCrate_VehicleAmmo_US",[10.693,-3.0655,0.029542],359.999,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m45_sandbags",[-12.1613,-0.572741,0.75],282,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m45_sandbags",[13.155,1.79559,0.75],42,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[-12.8961,-4.76403,0.75],280,[],false,false,true,{}], 
	["SPE_AmmoCrate_VehicleAmmo_US",[9.76579,-10.3804,0.0545406],233.689,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[13.7801,-3.81163,0.75],91,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[-1.82389,14.3444,0.75],349.161,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[-6.42916,13.4743,0.75],348,[],false,false,true,{}], 
	["SPE_AmmoCrate_VehicleAmmo_US",[-4.26156,-14.6397,0.0397882],215.424,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[-12.9251,-8.43693,0.75],269.262,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[3.14742,15.2206,0.75],351,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[13.6942,-8.16484,0.75],90.6629,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[-12.5276,-12.3193,0.75],258,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[0.396279,-18.115,0.75],175,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[5.09782,-17.4967,0.75],172.753,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m_sandbags",[-3.69358,-18.0175,0.75],184.418,[],false,false,true,{}], 
	["Land_SPE_Dugout_3m_sandbags",[8.111,-17.0064,0.75],161,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m45_sandbags",[12.9067,-13.9012,0.75],105,[],false,false,true,{}], 
	["Land_SPE_Dugout_6m45_sandbags",[-9.63135,-17.1307,0.75],196,[],false,false,true,{}],
	["SPE_M4A1_T34_Calliope",[5.13019,-4.94521,-0.00683117],353.718,[],true,true,false,{
		_arty = _this # 0;
		(missionNamespace getVariable 'QS_sideMission_enemyArray') pushBack _arty;
		_arty setVariable ['QS_hidden',TRUE,TRUE];
		_arty addEventHandler [
			'HandleDamage',
			{
				params ['_vehicle','','_damage','','','_hitPartIndex','',''];
				_vehicle setHit ['hit_main_turret_point',0];
				_vehicle setHit ['hit_main_gun_point',0];
				_oldDamage = if (_hitPartIndex isEqualTo -1) then {(damage _vehicle)} else {(_vehicle getHitIndex _hitPartIndex)};
				_damage = _oldDamage + (_damage - _oldDamage) * 0.35;
				_damage;
			}
		];
		_arty enableDynamicSimulation FALSE;
		_arty setVariable ['QS_dynSim_ignore',TRUE,TRUE];
		_arty addEventHandler ['GetOut',{(_this # 2) setDamage [1,TRUE];}];
		_arty addEventHandler ['Deleted',{
			deleteVehicleCrew (_this # 0);
		}];
		_group1 = createVehicleCrew _arty;
		_group1 deleteGroupWhenEmpty TRUE;
		_group1 enableDynamicSimulation FALSE;
		_arty setVehicleReceiveRemoteTargets TRUE;
		_group1 setVariable ['QS_dynSim_ignore',TRUE,FALSE];
		_arty deleteVehicleCrew (driver _arty);
		_group1 selectLeader (gunner _arty);
		[(units _group1),1] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
		_group1 setBehaviour 'COMBAT';
		_group1 setCombatMode 'RED';
		_group1 allowFleeing 0;
		missionNamespace setVariable ['QS_AI_supportProviders_ARTY',((missionNamespace getVariable 'QS_AI_supportProviders_ARTY') + [gunner _arty]),QS_system_AI_owners];
		_group1 setVariable ['QS_AI_GRP',TRUE,FALSE];
		_group1 setVariable ['QS_AI_GRP_CONFIG',['SUPPORT','ARTILLERY',_arty],FALSE];
		_group1 setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],FALSE];
		_group1 setVariable ['QS_AI_GRP_TASK',['SUPPORT','ARTILLERY',serverTime,-1],FALSE];
		_arty lock 2;
		_group1 addVehicle _arty;
		(gunner _arty) addEventHandler [
			'FiredMan',
			{
				if (!isNull (_this # 6)) then {
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg','magazine_shipcannon_120mm_he_shells_x32','magazine_shipcannon_120mm_he_guided_shells_x2','magazine_shipcannon_120mm_he_lg_shells_x2','magazine_missiles_cruise_01_x18','SPE_60Rnd_M8']) then {
						if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells']) then {
							(_this # 6) addEventHandler ['Explode',{(_this + [0]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						} else {
							(_this # 6) addEventHandler ['Explode',{(_this + [1]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						};
					};
				};
				if (isNil {missionNamespace getVariable 'QS_enemy_artyFireMessage'}) then {
					missionNamespace setVariable ['QS_enemy_artyFireMessage',diag_tickTime,FALSE];
				};
				if ((missionNamespace getVariable 'QS_enemy_artyFireMessage') > (diag_tickTime - 300)) exitWith {};
				missionNamespace setVariable ['QS_enemy_artyFireMessage',diag_tickTime,FALSE];
				_firingMessages = [
					localize 'STR_QS_Chat_001',
					localize 'STR_QS_Chat_002',
					localize 'STR_QS_Chat_003',
					localize 'STR_QS_Chat_004',
					localize 'STR_QS_Chat_005',
					localize 'STR_QS_Chat_006'
				];
				['sideChat',[WEST,'HQ'],(selectRandom _firingMessages)] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
			}
		];
		{
			(missionNamespace getVariable 'QS_sideMission_enemyArray') pushBack _x;
		} forEach (units _group1);
		{
			_x setVariable ['QS_dynSim_ignore',TRUE,FALSE];
			_x enableSimulation TRUE;
			_x enableDynamicSimulation FALSE;
		} forEach (crew _arty);
		_arty;
	}], 
	["SPE_M4A1_T34_Calliope",[-5.65482,-6.16814,-0.00683117],353.718,[],true,true,false,{
		_arty = _this # 0;
		(missionNamespace getVariable 'QS_sideMission_enemyArray') pushBack _arty;
		_arty setVariable ['QS_hidden',TRUE,TRUE];
		_arty addEventHandler [
			'HandleDamage',
			{
				params ['_vehicle','','_damage','','','_hitPartIndex','',''];
				_oldDamage = if (_hitPartIndex isEqualTo -1) then {(damage _vehicle)} else {(_vehicle getHitIndex _hitPartIndex)};
				_damage = _oldDamage + (_damage - _oldDamage) * 0.5;
				_damage;
			}
		];
		_arty enableDynamicSimulation FALSE;
		_arty setVariable ['QS_dynSim_ignore',TRUE,FALSE];
		_arty addEventHandler ['GetOut',{(_this # 2) setDamage [1,TRUE];}];
		_arty addEventHandler ['Deleted',{
			deleteVehicleCrew (_this # 0);
		}];
		_group1 = createVehicleCrew _arty;
		_group1 deleteGroupWhenEmpty TRUE;
		_group1 enableDynamicSimulation FALSE;
		_group1 setVariable ['QS_dynSim_ignore',TRUE,FALSE];
		_arty deleteVehicleCrew (driver _arty);
		_group1 selectLeader (gunner _arty);
		[(units _group1),1] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
		_group1 setBehaviour 'COMBAT';
		_group1 setCombatMode 'RED';
		_group1 allowFleeing 0;
		missionNamespace setVariable ['QS_AI_supportProviders_ARTY',((missionNamespace getVariable 'QS_AI_supportProviders_ARTY') + [gunner _arty]),QS_system_AI_owners];
		_group1 setVariable ['QS_AI_GRP',TRUE,FALSE];
		_group1 setVariable ['QS_AI_GRP_CONFIG',['SUPPORT','ARTILLERY',_arty],FALSE];
		_group1 setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],FALSE];
		_group1 setVariable ['QS_AI_GRP_TASK',['SUPPORT','ARTILLERY',serverTime,-1],FALSE];
		_arty lock 2;
		_group1 addVehicle _arty;
		(gunner _arty) addEventHandler [
			'FiredMan',
			{
				if (!isNull (_this # 6)) then {
					if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells','12rnd_230mm_rockets','32rnd_155mm_mo_shells','4rnd_155mm_mo_guided','2rnd_155mm_mo_lg','magazine_shipcannon_120mm_he_shells_x32','magazine_shipcannon_120mm_he_guided_shells_x2','magazine_shipcannon_120mm_he_lg_shells_x2','magazine_missiles_cruise_01_x18','SPE_60Rnd_M8']) then {
						if ((toLowerANSI (_this # 5)) in ['8rnd_82mm_mo_shells']) then {
							(_this # 6) addEventHandler ['Explode',{(_this + [0]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						} else {
							(_this # 6) addEventHandler ['Explode',{(_this + [1]) spawn (missionNamespace getVariable 'QS_fnc_craterEffect')}];
						};
					};
				};
				if (isNil {missionNamespace getVariable 'QS_enemy_artyFireMessage'}) then {
					missionNamespace setVariable ['QS_enemy_artyFireMessage',diag_tickTime,FALSE];
				};
				if ((missionNamespace getVariable 'QS_enemy_artyFireMessage') > (diag_tickTime - 300)) exitWith {};
				missionNamespace setVariable ['QS_enemy_artyFireMessage',diag_tickTime,FALSE];
				_firingMessages = [
					localize 'STR_QS_Chat_001',
					localize 'STR_QS_Chat_002',
					localize 'STR_QS_Chat_003',
					localize 'STR_QS_Chat_004',
					localize 'STR_QS_Chat_005',
					localize 'STR_QS_Chat_006'
				];
				['sideChat',[WEST,'HQ'],(selectRandom _firingMessages)] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
			}
		];
		{
			(missionNamespace getVariable 'QS_sideMission_enemyArray') pushBack _x;
		} forEach (units _group1);
		{
			_x setVariable ['QS_dynSim_ignore',TRUE,FALSE];
			_x enableSimulation TRUE;
			_x enableDynamicSimulation FALSE;
		} forEach (crew _arty);
		_arty;
	}]
]