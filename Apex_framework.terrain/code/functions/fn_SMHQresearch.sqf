/*
@file: HQresearch.sqf
Author:

	Quiksilver
	
Last modified:

	24/04/2014
	
Description:

	-

Notes:

	Deprecated mission, needs overhaul with composition instead of solitary building
____________________________________*/

scriptName 'Side Mission - Research';

private [
	"_flatPos","_accepted","_position","_enemiesArray","_fuzzyPos","_x","_briefing","_unitsArray","_object",
	"_dummy","_SMveh","_SMaa","_c4Message","_vehPos",'_vehType','_vehTypes','_dummyTypes','_dummyType','_objectTypes','_objectType',
	'_c4Messages','_c4Message','_researchTable','_veh'
];

_c4Messages = [
	"硬盘数据已获得，已经安放炸药！ 15 秒后引爆，迅速撤离。",
	"研究数据已获得，炸药已经安放! 15 秒后销毁,撤离。",
	"已经获得数据，销毁指令已确认! 15 秒后销毁,撤离。"
];
_c4Message = selectRandom _c4Messages;
if (worldName isEqualTo 'Tanoa') then {
	_vehTypes = ["I_C_Van_01_transport_F","I_C_Offroad_02_unarmed_F","B_T_MRAP_01_F","B_T_LSV_01_unarmed_F","I_MRAP_03_F"];
} else {
	_vehTypes = [
		"B_MRAP_01_F","B_Truck_01_covered_F","B_Truck_01_transport_F",
		"B_Heli_Light_01_F",//"O_Truck_02_transport_F","O_Truck_02_covered_F",
		"C_SUV_01_F","C_Van_01_transport_F"
	];
};
_vehType = selectRandom _vehTypes;
/*/-------------------- FIND POSITION FOR OBJECTIVE/*/

_flatPos = [0,0,0];
_accepted = false;
while {!_accepted} do {
	_flatPos = ['WORLD',-1,-1,'LAND',[5,0,0.2,(sizeOf 'Land_Research_HQ_F'),0,FALSE,objNull],TRUE,[],[],TRUE] call (missionNamespace getVariable 'QS_fnc_findRandomPos');
	if ((_flatPos distance2D (markerPos "QS_marker_base_marker")) > 1700) then {
		if ((_flatPos distance2D (markerPos "Almyra_blacklist_area")) > 2000) then {
			if (missionNamespace getVariable 'QS_module_fob_enabled') then {
				if ((_flatPos distance (markerPos 'QS_marker_module_fob')) < 4000) then {
					if ((_flatPos distance (markerPos 'QS_marker_module_fob')) > 1000) then {
						_accepted = TRUE;
					};
				};
			} else {
				_accepted = TRUE;
			};
		};
	};
};

_vehPos = [_flatPos,15,30,10,0,0.5,0] call (missionNamespace getVariable 'QS_fnc_findSafePos');
	
/*/-------------------- SPAWN OBJECTIVE BUILDING/*/

QS_sideObj = createVehicle ['Land_Research_HQ_F',[_flatPos select 0,_flatPos select 1,0],[],0,'NONE'];
missionNamespace setVariable [
	'QS_analytics_entities_created',
	((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
	FALSE
];
QS_sideObj setPosWorld [((getPosWorld QS_sideObj) select 0), ((getPosWorld QS_sideObj) select 1), ((getPosWorld QS_sideObj) select 2)];
QS_sideObj setVectorUp [0,0,1];
_veh = createVehicle [_vehType,_vehPos,[],0,'NONE'];
_veh lock 3;

/*/---------- SPAWN (okay, tp) TABLE, AND LAPTOP ON IT./*/

_researchTable = createVehicle ['Land_CampingTable_small_F',[0,0,0],[],0,'NONE'];
missionNamespace setVariable [
	'QS_analytics_entities_created',
	((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
	FALSE
];
_researchTable setPosWorld [((getPosWorld QS_sideObj) select 0), ((getPosWorld QS_sideObj) select 1), ((getPosWorld QS_sideObj) select 2)];
_dummyTypes = ['Box_East_AmmoOrd_F','Box_IND_AmmoOrd_F'];
_dummyType = selectRandom _dummyTypes;
_objectTypes = ['Land_Laptop_03_black_F','Land_Laptop_device_F'];
_objectType = selectRandom _objectTypes;
_object = createVehicle [_objectType,[0,0,0],[],0,'NONE'];
missionNamespace setVariable [
	'QS_analytics_entities_created',
	((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
	FALSE
];
_object enableSimulationGlobal TRUE;
_researchTable attachTo [QS_sideObj,[0,0,-2.875]];
_object attachTo [QS_sideObj,[0,0,-2.3]];
for '_x' from 0 to 2 step 1 do {
	_object setVariable ['QS_secureable',TRUE,TRUE];
	_object setVariable ['QS_isExplosion',TRUE,TRUE];
};
	
/*/-------------------- SPAWN FORCE PROTECTION/*/

_enemiesArray = [QS_sideObj] call (missionNamespace getVariable 'QS_fnc_smEnemyWest');

/*/-------------------- BRIEF/*/

_fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];
{
	_x setMarkerPos _fuzzyPos;
	_x setMarkerAlpha 1;
} count ['QS_marker_sideMarker','QS_marker_sideCircle'];
'QS_marker_sideMarker' setMarkerText (format ['%1夺取研究数据',(toString [32,32,32])]);

[
	'QS_IA_TASK_SM_0',
	TRUE,
	[
		'夺取研究数据！ 敌军正在进行武器试验研究，我们发现了他们其中一个研究地点的大概位置，立即出发夺取他们的研究数据！ 目标地点在作战区域内某个位置。',
		'夺取研究数据',
		'夺取研究数据'
    	],
	(markerPos 'QS_marker_sideMarker'),
	'CREATED',
	5,
	FALSE,
	TRUE,
	'download',
	TRUE
] call (missionNamespace getVariable 'BIS_fnc_setTask');

_briefing = parseText "<t align='center'><t size='2.2'>支线任务</t><br/><t size='1.5' color='#00B2EE'>夺取研究数据</t><br/>____________________<br/>敌军正在进行武器试验研究。<br/><br/>找到我们需要的数据，然后摧毁敌军的研究设施！</t>";
//['hint',_briefing] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
['NewSideMission',['夺取研究数据']] remoteExec ['QS_fnc_showNotification',-2,FALSE];
missionNamespace setVariable ['QS_sideMissionUp',TRUE,TRUE];
missionNamespace setVariable ['QS_smSuccess',FALSE,TRUE];
	
/*/-------------------- [ CORE LOOPS ] ------------------------ [ CORE LOOPS ]/*/

for '_x' from 0 to 1 step 0 do {

	if (!alive QS_sideObj) exitWith {
		
		/*/-------------------- DE-BRIEFING/*/

		['sideChat',[EAST,'HQ'],'目标被提前破坏，任务失败！'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
		[0,_flatPos] spawn (missionNamespace getVariable 'QS_fnc_smDebrief');
		{
			_x setMarkerPos [-5000,-5000,0];
			_x setMarkerAlpha 0;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];
		missionNamespace setVariable ['QS_sideMissionUp',FALSE,TRUE];
		
		/*/-------------------- DELETE/*/
		
		{
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			detach _x;
			deleteVehicle _x;
		} count [_object,_researchTable];
		sleep 120;
		{
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			deleteVehicle _x;
		} forEach [QS_sideObj,_veh];
		{
			if (_x isEqualType objNull) then {
				0 = QS_garbageCollector pushBack [_x,'NOW_DISCREET',0];
			};
		} count _enemiesArray;
	};
	
	if (missionNamespace getVariable 'QS_smSuccess') exitWith {
		
		['sideChat',[EAST,'HQ'],_c4Message] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
	
		/*/-------------------- BOOM!/*/
		
		_dummy = createVehicle [_dummyType,[0,0,0],[],0,'NONE'];
		missionNamespace setVariable [
			'QS_analytics_entities_created',
			((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
			FALSE
		];
		_dummy allowDamage FALSE;
		_dummy setPosWorld [((getPosWorld QS_sideObj) select 0), ((getPosWorld QS_sideObj) select 1), (((getPosWorld QS_sideObj) select 2) + 2)];
		uiSleep 0.1;
		missionNamespace setVariable [
			'QS_analytics_entities_deleted',
			((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
			FALSE
		];
		detach _object;
		deleteVehicle _object;
		uiSleep 14;											/*/ ghetto bomb timer/*/
		'Bo_Mk82' createVehicle (getPos _dummy); 				/*/default "Bo_Mk82"/*/
		missionNamespace setVariable [
			'QS_analytics_entities_created',
			((missionNamespace getVariable 'QS_analytics_entities_created') + 1),
			FALSE
		];
		{
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			detach _x;
			deleteVehicle _x;
		} count [_dummy,_researchTable];
		sleep 0.1;
	
		/*/-------------------- DE-BRIEFING/*/

		[1,_flatPos] spawn (missionNamespace getVariable 'QS_fnc_smDebrief');
		{
			_x setMarkerPos [-5000,-5000,0];
			_x setMarkerAlpha 0;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];
		missionNamespace setVariable ['QS_sideMissionUp',FALSE,TRUE];
	
		/*/--------------------- DELETE/*/
		sleep 120;
		{
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			deleteVehicle _x;
		} forEach [QS_sideObj,_veh];
		{
			if (_x isEqualType objNull) then {
				0 = QS_garbageCollector pushBack [_x,'NOW_DISCREET',0];
			};
		} count _enemiesArray;
	};
	sleep 2;
};