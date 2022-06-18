/*
File: fn_secureIntelUAV.sqf
Author:

	Quiksilver
	
Last Modified:

	11/02/2016 A3 1.54 by Quiksilver
	
Description:

	Secure Intel from a crashed UAV
	
To do:

	Don't spawn the UAV until players are < 100m, to hide from magic map
___________________________________________________________*/

scriptName 'Side Mission - Secure Intel UAV';
if (worldName in ['Enoch']) exitWith {};
private [
	'_inset','_max','_safePos','_testPos','_uav','_dummyObj','_index','_timeEnd','_uavOnGround','_diverTypes','_diverType','_unit','_enemiesArray',
	'_fuzzyPos','_briefing','_enemiesCheckDelay','_foundPos','_checkPos','_QS_fnc_radPos','_signalPulseCheckDelay','_val','_safePosATL','_endTimeBroadcastDelay',
	'_text','_uavTypes','_arrayToSend'
];
_diverTypes = ['B_diver_F','B_diver_exp_F','B_diver_TL_F','I_diver_F','I_diver_exp_F','I_diver_TL_F'];
_inset = 2000;
_max = worldSize - (_inset * 2);
_safePos = [];
_index = 0;

_QS_fnc_radPos = {
	private['_pos','_exit','_posX','_posY'];
	params ['_center','_radius','_angle','_isWater'];
	_center = _this select 0;
	_radius = _this select 1;
	_angle = _this select 2;
	_isWater = _this select 3;
	_exit = FALSE;
	for '_x' from 0 to 1 step 0 do {
		_posX = (_radius * (sin _angle));
		_posY = (_radius * (cos _angle));
		_pos = [_posX + (_center select 0),_posY + (_center select 1),0];
		if (_isWater) then {
			if (surfaceIsWater [_pos select 0,_pos select 1]) then {_exit = true} else {_radius = _radius - 1};
		} else {
			if (!surfaceIsWater [_pos select 0,_pos select 1]) then {_exit = true} else {_radius = _radius - 1};
		};
		if (_radius isEqualTo 0) then {_pos = _center;_exit = true};
		if (_exit) exitWith {};
	};
	_pos;
};
for '_x' from 0 to 1 step 0 do {
	_testPos = [_inset + (random _max),_inset + (random _max),0];
	if (surfaceIsWater _testPos) then {
		if (((ASLToATL _testPos) select 2) < 75) then {
			if (((ASLToATL _testPos) select 2) > 13) then {
				if (((missionNamespace getVariable 'QS_uavMission_usedPositions') findIf {((_testPos distance2D _x) < 300)}) isEqualTo -1) then {
					if (missionNamespace getVariable 'QS_module_fob_enabled') then {
						if ((_testPos distance (markerPos 'QS_marker_module_fob')) > 1000) then {
							_safePos = _testPos isFlatEmpty [5,0,1,5,2,FALSE,objNull];
						};
					} else {
						_safePos = _testPos isFlatEmpty [5,0,1,5,2,FALSE,objNull];
					};
				};
			};
		};
	};
	if (!(_safePos isEqualTo [])) exitWith {};
	sleep 0.1;
};
missionNamespace setVariable [
	'QS_uavMission_usedPositions',
	((missionNamespace getVariable 'QS_uavMission_usedPositions') + [_safePos]),
	FALSE
];
_safePosATL = [(_safePos select 0),(_safePos select 1),(getTerrainHeightASL _safePos)];
_uavTypes = ['B_UAV_02_CAS_F','B_UAV_05_F','B_UAV_02_CAS_F'];
_uav = createVehicle [(selectRandom _uavTypes),[0,0,0],[],0,'NONE'];
missionNamespace setVariable [
	'QS_analytics_entities_created',
	((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
	FALSE
];
_uav setVariable ['QS_uav_protected',TRUE,TRUE];
_uav setVariable ['QS_hidden',TRUE,TRUE];
_uav setDamage 0.75;
_uav allowDamage FALSE;
_uav enableRopeAttach FALSE;
_uav enableVehicleCargo FALSE;
_uav setFuel 0;
_uav setVehicleAmmo 0;
(allUnits select 0) action ['LandGearUp',_uav];
_uav setPosASL _safePos;
for '_x' from 0 to 2 step 1 do {
	_uav setVariable ['QS_secureable',TRUE,TRUE];
};
_enemiesArray = [_safePos] call (missionNamespace getVariable 'QS_fnc_smEnemyDivers');
_uavOnGround = FALSE;
//_timeEnd = time + 1800;
_timeEnd = serverTime + 1800;
_enemiesCheckDelay = time + 30;
_signalPulseCheckDelay = time + 20;
_endTimeBroadcastDelay = time + 30;
_foundPos = FALSE;
_fuzzyPos = [((_safePos select 0) - 300) + (random 600),((_safePos select 1) - 300) + (random 600),0];
{
	_x setMarkerPosLocal _fuzzyPos;
	_x setMarkerAlpha 1;
} count ['QS_marker_sideMarker','QS_marker_sideCircle'];	
'QS_marker_sideMarker' setMarkerText (format ['%1获取情报(UAV)',(toString [32,32,32])]);

[
	'QS_IA_TASK_SM_0',
	TRUE,
	[
		(format ['敌方的无人机在 %1 附近水域坠毁。 这是一个获取敌军无人机系统运作数据的绝佳机会，潜入水下获取无人机的情报。 这项任务在水下进行，确保你携带了呼吸器、潜水护目镜和水下战斗步枪SDAR！ 我们不知道无人机残骸的准确位置，但GPS能够探测到UAV残骸的信号。 这项任务时间有限！',worldName]),
		'获取情报(UAV)',
		'获取情报(UAV)'
	],
	(markerPos 'QS_marker_sideMarker'),
	'CREATED',
	5,
	FALSE,
	TRUE,
	'download',
	TRUE
] call (missionNamespace getVariable 'BIS_fnc_setTask');
['QS_IA_TASK_SM_0',TRUE,_timeEnd] call (missionNamespace getVariable 'QS_fnc_taskSetTimer');

_briefing = parseText format ["<t align='center'><t size='2.2'>支线任务</t><br/><t size='1.5' color='#00B2EE'>获取情报(UAV)</t><br/>____________________<br/>一架敌军UAV坠毁在了 %1 的海岸。<br/><br/>情报显示敌军已经赶到坠毁地点寻找UAV并且试图摧毁情报。 迅速前往目标区域，在敌军之前找到UAV并回收情报！<br/>任务时限在30分钟左右<br/></t>",worldName];
['hint',_briefing] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
['NewSideMission',['获取情报(UAV)']] remoteExec ['QS_fnc_showNotification',-2,FALSE];

private _patrolRoute = [];

for '_x' from 0 to 1 step 0 do {
	if (_uav getVariable 'QS_secured') exitWith {
		{
			_x setMarkerPosLocal [-5000,-5000,0];
			_x setMarkerAlpha 0;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];
		[1,_safePos] spawn (missionNamespace getVariable 'QS_fnc_smDebrief');
		_uav setDamage 1;
		sleep 300;
		{
			if (_x isEqualType objNull) then {
				0 = (missionNamespace getVariable 'QS_garbageCollector') pushBack [_x,'NOW_DISCREET',0];
			};
		} count _enemiesArray;
		if (!isNull _uav) then {
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			deleteVehicle _uav;
		};
	};
	if ((serverTime > _timeEnd) || {(!alive _uav)}) exitWith {
		{
			_x setMarkerPosLocal [-5000,-5000,0];
			_x setMarkerAlpha 0;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];
		[0,_safePos] spawn (missionNamespace getVariable 'QS_fnc_smDebrief');
		_uav setDamage [1,FALSE];
		sleep 180;
		{
			if (_x isEqualType objNull) then {
				0 = (missionNamespace getVariable 'QS_garbageCollector') pushBack [_x,'NOW_DISCREET',0];
			};
		} count _enemiesArray;
		if (!isNull _uav) then {
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			deleteVehicle _uav;
		};
	};
	if (time > _signalPulseCheckDelay) then {
		_arrayToSend = [];
		{
			if ((_x distance _safePosATL) < 500) then {
				0 = _arrayToSend pushBack (owner _x);
			};
		} count allPlayers;
		if (!(_arrayToSend isEqualTo [])) then {
			[0,_safePosATL,300] remoteExec ['QS_fnc_signalStrength',_arrayToSend,FALSE];
		};
		_signalPulseCheckDelay = time + 15;
	};
	if (!(_uavOnGround)) then {
		if (isTouchingGround _uav) then {
			_uavOnGround = TRUE;
			_grp = createGroup [WEST,TRUE];
			for '_x' from 0 to 1 step 1 do {
				_diverType = selectRandom _diverTypes;
				_unit = _grp createUnit [_diverType,(getPosWorld _uav),[],0,'NONE'];
				missionNamespace setVariable [
					'QS_analytics_entities_created',
					((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
					FALSE
				];
				0 = _enemiesArray pushBack _unit;
				_unit swimInDepth (getTerrainHeightASL _safePos);
				_unit enableStamina FALSE;
				{
					if (_x in ['HandGrenade','MiniGrenade']) then {
						_unit removeMagazine _x;
					};
				} forEach (magazines _unit);
			};
			_grp setFormDir (random 360);
			[(units _grp),1] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
		};
	};
	if (time > _enemiesCheckDelay) then {
		if (({((_x isKindOf 'Man') && (alive _x))} count _enemiesArray) < 10) then {
			_foundPos = FALSE;
			for '_x' from 0 to 1 step 0 do {
				_checkPos = _safePos getPos [(150 + (random 400)),(random 360)];
				if (surfaceIsWater _checkPos) then {
					if (([_checkPos,150,[EAST,CIVILIAN],allPlayers,0] call (missionNamespace getVariable 'QS_fnc_serverDetector')) isEqualTo []) then {
						_foundPos = TRUE;
					};
				};
				if (_foundPos) exitWith {};
			};
			_grp = createGroup [WEST,TRUE];
			for '_x' from 0 to 1 step 1 do {
				_diverType = selectRandom _diverTypes;
				_unit = _grp createUnit [_diverType,_checkPos,[],0,'FORM'];
				missionNamespace setVariable [
					'QS_analytics_entities_created',
					((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
					FALSE
				];
				_unit enableStamina FALSE;
				0 = _enemiesArray pushBack _unit;
				_unit swimInDepth (getTerrainHeightASL _safePos);
				{
					if (_x in ['HandGrenade','MiniGrenade']) then {
						_unit removeMagazine _x;
					};
				} forEach (magazines _unit);
			};
			[(units _grp),1] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');	
			for '_x' from 0 to 2 step 1 do {
				_relPos = [_safePos,(100 + (random 200)),(random 360),TRUE] call _QS_fnc_radPos;
				_patrolRoute pushBack [_relPos select 0,_relPos select 1,(getTerrainHeightASL (getPosWorld ((units _grp) select 0)))];
			};
			_patrolRoute pushBack [((getPosWorld _unit) select 0),((getPosWorld _unit) select 1),(getTerrainHeightASL (getPosWorld ((units _grp) select 0)))];
			_grp setVariable ['QS_AI_GRP_TASK',['PATROL',_patrolRoute,diag_tickTime,-1],(call (missionNamespace getVariable 'QS_fnc_AIOwners'))];
			_grp setVariable ['QS_AI_GRP_PATROLINDEX',0,(call (missionNamespace getVariable 'QS_fnc_AIOwners'))];
			_grp setVariable ['QS_AI_GRP_CONFIG',['GENERAL','DIVER',(count (units _grp))],(call (missionNamespace getVariable 'QS_fnc_AIOwners'))];
			_grp setVariable ['QS_AI_GRP_DATA',[],(call (missionNamespace getVariable 'QS_fnc_AIOwners'))];
			_grp setVariable ['QS_AI_GRP',TRUE,(call (missionNamespace getVariable 'QS_fnc_AIOwners'))];
		};
		_enemiesCheckDelay = time + 30;
	};
	sleep 3;
};