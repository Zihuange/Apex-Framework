/*
Author:

	Quiksilver
	
Last modified:

	3/05/2016 A3 1.58 by Quiksilver
	
Description:

	Secure HQ supplies before destroying it.

Notes:

	Deprecated mission, needs overhaul with composition instead of solitary building
____________________________________*/

scriptName 'Side Mission - AA Launchers';

private [
	"_flatPos","_accepted","_position","_enemiesArray","_fuzzyPos","_x","_briefing","_unitsArray","_object",
	"_SMveh","_SMaa","_tower1","_tower2","_tower3","_flatPos1","_flatPos2",'_objectTypes','_objectType','_c4Messages','_c4Message',
	'_baseMarker','_almyraMarker','_sideObj','_houseType'
];

_c4Messages = [
	"武器已安全转移。摧毁指令已发出！ 15 秒后引爆，所有单位迅速撤离！",
	"发射器已确保，炸药已安放！ 15 秒后引爆，迅速撤离！",
	"武器已安全转移。摧毁指令已发出！ 15 秒后引爆，所有单位迅速撤离！"
];
_c4Message = selectRandom _c4Messages;


/*/-------------------- FIND POSITION FOR OBJECTIVE/*/

_flatPos = [0,0,0];
_accepted = false;
_baseMarker = markerPos 'QS_marker_base_marker';
_almyraMarker = markerPos 'QS_marker_Almyra_blacklist_area';
while {!_accepted} do {
	_flatPos = ['WORLD',-1,-1,'LAND',[10,0,0.2,(sizeOf 'Land_Dome_Small_F'),0,FALSE,objNull],TRUE,[],[],TRUE] call (missionNamespace getVariable 'QS_fnc_findRandomPos');
	if ((_flatPos distance2D _baseMarker) > 1700) then {
		if ((_flatPos distance2D _almyraMarker) > 2000) then {
			if (missionNamespace getVariable 'QS_module_fob_enabled') then {
				if ((_flatPos distance (markerPos 'QS_marker_module_fob')) < 4000) then {
					if ((_flatPos distance (markerPos 'QS_marker_module_fob')) > 500) then {
						_accepted = TRUE;
					};
				};
			} else {
				_accepted = TRUE;
			};
		};
	};
	if (_accepted) exitWith {};
};
_flatPos1 = _flatPos getPos [15,50];
_flatPos2 = _flatPos getPos [15,80];

/*/-------------------- SPAWN OBJECTIVE/*/

if (worldName isEqualTo 'Tanoa') then {
	_houseType = 'Land_Cargo_House_V4_F';
} else {
	_houseType = 'Land_Cargo_House_V2_F';
};
_objDir = random 360;/*/_sideObj/*/
missionNamespace setVariable [
	'QS_sideObj',
	(createVehicle [_houseType,[_flatPos select 0,_flatPos select 1,0],[],0,'NONE']),
	FALSE
];
missionNamespace setVariable [
	'QS_analytics_entities_created',
	((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
	FALSE
];
_sideObj = missionNamespace getVariable 'QS_sideObj';
_sideObj setVectorUp [0,0,1];
_sideObj setDir _objDir;
_objectTypes = ['Box_IND_WpsLaunch_F','Box_IND_WpsLaunch_F'];
_objectType = selectRandom _objectTypes;
_object = createVehicle [_objectType,[0,0,0],[],0,'NONE'];
missionNamespace setVariable [
	'QS_analytics_entities_created',
	((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
	FALSE
];
_object allowDamage FALSE;
_object setPosWorld [((getPosWorld _sideObj) select 0), ((getPosWorld _sideObj) select 1),(((getPosWorld _sideObj) select 2) + 1)];
_object enableRopeAttach FALSE;
_object setVariable ['QS_interaction_disabled',TRUE,TRUE];
_object enableSimulationGlobal TRUE;
for '_x' from 0 to 2 step 1 do {
	_object setVariable ['QS_secureable',TRUE,TRUE];
	_object setVariable ['QS_isExplosion',TRUE,TRUE];
};
_truck1 = createVehicle ['I_Truck_02_ammo_F',_flatPos1,[],0,'NONE'];
_truck2 = createVehicle ['I_Truck_02_ammo_F',_flatPos2,[],0,'NONE'];
missionNamespace setVariable [
	'QS_analytics_entities_created',
	((missionNamespace getVariable 'QS_analytics_entities_created') + 2),
	FALSE
];
{_x setDir (random 360);_x lock 3;} forEach [_truck1,_truck2];

/*/-------------------- SPAWN FORCE PROTECTION/*/

_enemiesArray = [_sideObj] call (missionNamespace getVariable 'QS_fnc_SMenemyIND');

/*/------------------- SPAWN BRIEFING/*/

_fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];
{
	_x setMarkerPos _fuzzyPos;
	_x setMarkerAlpha 1;
} count ['QS_marker_sideMarker','QS_marker_sideCircle'];
'QS_marker_sideMarker' setMarkerText (format ['%1搜索敌军单兵防空导弹',(toString [32,32,32])]);

[
	'QS_IA_TASK_SM_0',
	TRUE,
	[
		'阻止敌人武器转移，敌军运输卡车已经进入标记区域范围准备转移武器箱。 阻止敌人转移防空导弹并确认夺取武器箱！ 目标位于标记范围内某处。',
		'阻止敌军运输便携式防空导弹',
		'阻止敌军运输便携式防空导弹'
	],
	(markerPos 'QS_marker_sideMarker'),
	'CREATED',
	5,
	FALSE,
	TRUE,
	'download',
	TRUE
] call (missionNamespace getVariable 'BIS_fnc_setTask');

_briefing = parseText format ["<t align='center'><t size='2.2'>支线任务</t><br/><t size='1.5' color='#00B2EE'>搜索敌军单兵防空导弹</t><br/>____________________<br/>我方情报人员获悉敌军正在向前线运输一批防空导弹。<br/><br/>我们已经找到了运输中转地点的大致位置，在敌军转移之前迅速到达那里。找到并清点导弹数量，确认无遗漏后摧毁单兵防空导弹。</t>"];
//['hint',_briefing] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
['NewSideMission',['搜索敌军单兵防空导弹']] remoteExec ['QS_fnc_showNotification',-2,FALSE];
	
/*/-------------------- [ CORE LOOPS ] ------------------------ [ CORE LOOPS ]/*/

missionNamespace setVariable ['QS_sideMissionUp',TRUE,TRUE];
missionNamespace setVariable ['QS_smSuccess',FALSE,TRUE];

for '_x' from 0 to 1 step 0 do {

	/*/--------------------------------------------- IF PACKAGE DESTROYED [FAIL]/*/

	if (!alive _sideObj) exitWith {
		missionNamespace setVariable ['QS_sideMissionUp',FALSE,TRUE];
		['sideChat',[WEST,'HQ'],'目标被提前破坏，任务失败！'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
		[0,_flatPos] spawn (missionNamespace getVariable 'QS_fnc_smDebrief');
		{
			_x setMarkerPos [-5000,-5000,0];
			_x setMarkerAlpha 0;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];
		missionNamespace setVariable [
			'QS_analytics_entities_deleted',
			((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
			FALSE
		];
		deleteVehicle _object;
		sleep 120;
		{
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			deleteVehicle _x;
		} forEach [_sideObj,_truck1,_truck2];
		{
			if (_x isEqualType objNull) then {
				0 = QS_garbageCollector pushBack [_x,'NOW_DISCREET',0];
			};
		} count _enemiesArray;
	};
	
	/*/--------------------------------------------- IF PACKAGE DESTROYED [FAIL]/*/
	
	if (missionNamespace getVariable 'QS_smSuccess') exitWith {
		['sideChat',[WEST,'HQ'],_c4Message] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
		uiSleep 14;											
		'Bo_Mk82' createVehicle (getPos _object);
		missionNamespace setVariable [
			'QS_analytics_entities_created',
			((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
			FALSE
		];
		uiSleep 0.1;
		missionNamespace setVariable [
			'QS_analytics_entities_deleted',
			((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
			FALSE
		];
		deleteVehicle _object;
		missionNamespace setVariable ['QS_sideMissionUp',FALSE,TRUE];
		[1,_flatPos] spawn (missionNamespace getVariable 'QS_fnc_smDebrief');
		{
			_x setMarkerPos [-5000,-5000,0];
			_x setMarkerAlpha 0;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];
		sleep 120;
		{
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			deleteVehicle _x;
		} forEach [_sideObj,_truck1,_truck2];
		{
			if (_x isEqualType objNull) then {
				0 = QS_garbageCollector pushBack [_x,'NOW_DISCREET',0];
			};
		} count _enemiesArray;
	};
	sleep 2;
};