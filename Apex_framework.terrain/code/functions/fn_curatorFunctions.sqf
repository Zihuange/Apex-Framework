/*
File: fn_curatorFunctions.sqf
Author:

	Quiksilver
	
Last Modified:

	7/07/2018 A3 1.82 by Quiksilver
	
Description:

	Custom Curator Functions
	
Keys:

	NUM_0 = 82
	NUM_1 = 79
	NUM_2 = 80
	NUM_3 = 81
	NUM_4 = 75
	NUM_5 = 76
	NUM_6 = 77
	NUM_7 = 71
	NUM_8 = 72
	NUM_9 = 73

	https://community.bistudio.com/wiki/curatorSelected
______________________________________________________*/

_key = _this # 0;
if (isNull (findDisplay 312)) exitWith {};
if (!(_key in [82,79,80,81,75,76,77,71,72,73])) exitWith {};
if (diag_tickTime < (player getVariable ['QS_curator_executingFunction',-1])) exitWith {};
player setVariable ['QS_curator_executingFunction',(diag_tickTime + 2),FALSE];
scopeName 'main';
if (_key isEqualTo 82) exitWith {
	playSound ['ClickSoft',FALSE];
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'无功能',[],-1,TRUE,'Curator',FALSE];
};
if (_key isEqualTo 79) exitWith {
	//comment 'Garrison selected units into buildings';
	playSound ['ClickSoft',FALSE];
	private ['_selectedUnits','_countUnits','_radius'];
	_selectedUnits = [];
	if ((curatorSelected # 0) isEqualTo []) then {breakTo 'main';};
	{
		if (_x isKindOf 'Man') then {
			if (!isPlayer _x) then {
				if (alive _x) then {
					0 = _selectedUnits pushBack _x;
				};
			};
		};
	} count (curatorSelected # 0);
	if (_selectedUnits isEqualTo []) then {breakTo 'main';};
	_countUnits = count _selectedUnits;
	_radius = 50;
	if (_countUnits > 8) then {_radius = 100;};
	if (_countUnits > 16) then {_radius = 200;};
	if (_countUnits > 24) then {_radius = 300;};
	[(getPosATL (_selectedUnits # 0)),_radius,_selectedUnits,['House','Building']] spawn (missionNamespace getVariable 'QS_fnc_garrisonUnits');
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'单位驻防',[],-1,TRUE,'Curator',FALSE];
};
if (_key isEqualTo 80) exitWith {
	//comment 'Group patrol';
	playSound ['ClickSoft',FALSE];
	private ['_selectedGroups','_countGroups','_radius'];
	_selectedGroups = [];
	if ((curatorSelected # 1) isEqualTo []) then {breakTo 'main';};
	{
		if (((units _x) findIf {(alive _x)}) isNotEqualTo -1) then {
			if (!(isPlayer (leader _x))) then {
				0 = _selectedGroups pushBack _x;
			};
		};
	} count (curatorSelected # 1);
	if (_selectedGroups isEqualTo []) then {breakTo 'main';};
	{
		[_x,(getPosATL ((units _x) # 0)),100] call (missionNamespace getVariable 'QS_fnc_taskPatrol');
	} forEach _selectedGroups;
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'单位巡逻',[],-1,TRUE,'Curator',FALSE];
};
if (_key isEqualTo 81) exitWith {
	//comment 'Search building';
	playSound ['ClickSoft',FALSE];
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'单位搜索建筑物',[],-1,TRUE,'Curator',FALSE];
	private ['_buildings','_building','_selectedGroup','_waypoint','_grp'];
	if ((curatorSelected # 1) isEqualTo []) then {breakTo 'main';};
	{
		_grp = _x;
		if (((units _grp) findIf {(alive _x)}) isNotEqualTo -1) then {
			if (!(isPlayer (leader _grp))) then {
				if ((count (waypoints _grp)) > 1) then {
					if ((count (waypoints _grp)) isEqualTo 2) then {
						_waypoint = (waypoints _grp) # 1;
						_buildings = nearestObjects [(waypointPosition _waypoint),['House'],25,TRUE];
						if (_buildings isEqualTo []) then {breakTo 'main';};
						_building = _buildings # 0;
						deleteWaypoint _waypoint;
						0 = [_grp,[_building,(count (_building buildingPos -1))],180,FALSE] spawn (missionNamespace getVariable 'QS_fnc_searchNearbyBuilding');
					};
				} else {
					0 = [_grp,[objNull,0],180,FALSE] spawn (missionNamespace getVariable 'QS_fnc_searchNearbyBuilding');
				};
			};
		};
	} count (curatorSelected # 1);
};
if (_key isEqualTo 75) exitWith {
	//comment 'Stalker squad';
	playSound ['ClickSoft',FALSE];
	private ['_prey','_building','_selectedGroups','_selectedGroup','_waypoint','_grp','_wpPosition','_nearestUnit','_nearestUnits'];
	_selectedGroups = [];
	if ((curatorSelected # 1) isEqualTo []) then {breakTo 'main';};
	{
		_grp = _x;
		if (local _grp) then {
			if (((units _grp) findIf {(alive _x)}) isNotEqualTo -1) then {
				if (!(isPlayer (leader _grp))) then {
					if ((waypoints _grp) isNotEqualTo []) then {
						if ((waypointPosition [_grp,(currentWaypoint _grp)]) isNotEqualTo [0,0,0]) then {
							_wpPosition = waypointPosition [_grp,(currentWaypoint _grp)];
							_nearestUnits = _wpPosition nearEntities [['CAManBase','LandVehicle'],25];
							if (_nearestUnits isNotEqualTo []) then {
								_nearestUnit = _nearestUnits # 0;
								if (!isNull _nearestUnit) then {
									if (alive _nearestUnit) then {
										if (((lifeState _nearestUnit) in ['HEALTHY','INJURED']) || {(_nearestUnit isKindOf 'LandVehicle')}) then {
											[
												_grp,
												_nearestUnit,
												{FALSE},
												10,
												'RED',
												'AWARE',
												'FULL',
												'AUTO',
												0,
												FALSE
											] spawn (missionNamespace getVariable 'QS_fnc_stalk');
											0 = (missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'向目标突击',[],-1,TRUE,'Curator',FALSE];
										};
									};
								};
							} else {
								(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,10,-1,'突击命令无效 - 路点15米范围内无目标',[],-1,TRUE,'Curator',FALSE];
							};
						} else {
							(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,10,-1,'突击命令无效 - 无效路点',[],-1,TRUE,'Curator',FALSE];
						};
					} else {
						(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'突击命令无效 - 未放置路点',[],-1,TRUE,'Curator',FALSE];
					};
				} else {
					(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'突击命令无效 - 小队长为玩家',[],-1,TRUE,'Curator',FALSE];
				};
			};
		} else {
			(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'突击命令无效 - 该小组非宙斯放置',[],-1,TRUE,'Curator',FALSE];
		};
	} count (curatorSelected # 1);
};
if (_key isEqualTo 76) exitWith {
	playSound ['ClickSoft',FALSE];
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'无功能',[],-1,TRUE,'Curator',FALSE];
};
if (_key isEqualTo 77) exitWith {
	playSound ['ClickSoft',FALSE];
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'火力压制',[],-1,TRUE,'Curator',FALSE];
	private _selectedUnits = [];
	private _unit = objNull;
	private _target = objNull;
	if ((curatorSelected # 0) isEqualTo []) then {breakTo 'main';};
	private _selected = objNull;
	{
		_selected = _x;
		if (_selected isKindOf 'Man') then {
			if (!isPlayer _selected) then {
				if (alive _selected) then {
					_selectedUnits pushBack _x;
				};
			};
		} else {
			if (_selected in vehicles) then {
				if ((crew _selected) isNotEqualTo []) then {
					{
						_selectedUnits pushBack _x;
					} forEach (crew _selected);
				};
			};
		};
	} forEach (curatorSelected # 0);
	if (_selectedUnits isEqualTo []) then {breakTo 'main';};
	private _remoteUnits = _selectedUnits select {(!local _x)};
	private _localUnits = _selectedUnits select {(local _x)};
	private _inHouse = [FALSE,objNull];
	if (_localUnits isNotEqualTo []) then {
		if ((count _localUnits) > 24) then { _localUnits = _localUnits select [0,24]; };
		{
			_unit = _x;
			if (!(_unit getUnitTrait 'medic')) then {
				_target = [_unit,1000,TRUE] call (missionNamespace getVariable 'QS_fnc_AIGetAttackTarget');
				if (alive _target) then {
					_inHouse = [_target,getPosWorld _target] call (missionNamespace getVariable 'QS_fnc_inHouse');
					if (_inHouse # 0) then {
						_target = _inHouse # 1;
					};
					[_unit,_target,selectRandomWeighted [1,0.5,2,0.5],TRUE,TRUE,FALSE,-1] call (missionNamespace getVariable 'QS_fnc_AIDoSuppressiveFire');
				};
			};
		} forEach _localUnits;
	};
	if (_remoteUnits isNotEqualTo []) then {
		if ((count _remoteUnits) > 24) then { _remoteUnits = _remoteUnits select [0,24]; };
		[30,_remoteUnits] remoteExec ['QS_fnc_remoteExec',(_remoteUnits # 0),FALSE];
	};
};
if (_key isEqualTo 71) exitWith {
	private _selectedUnits = [];
	if ((curatorSelected # 0) isEqualTo []) then {breakTo 'main';};
	{
		if (_x isKindOf 'Man') then {
			if (isNull (objectParent _x)) then {
				if (alive _x) then {
					if (isNull (attachedTo _x)) then {
						if ((lifeState _x) isEqualTo 'INCAPACITATED') then {
							0 = _selectedUnits pushBack _x;
						};
					};
				};
			};
		};
	} count (curatorSelected # 0);
	if (_selectedUnits isEqualTo []) then {breakTo 'main';};
	private _unit = _selectedUnits # 0;
	if ((lifeState _unit) isEqualTo 'INCAPACITATED') then {
		if (local _unit) then {
			_unit setUnconscious FALSE;
			_unit setCaptive FALSE;
		} else {
			[68,_unit,FALSE,FALSE] remoteExec ['QS_fnc_remoteExec',_unit,FALSE];
		};
	};
	/*/
	missionNamespace setVariable [
		'QS_curator_revivePoints',
		((missionNamespace getVariable 'QS_curator_revivePoints') - 1),
		TRUE
	];
	/*/
	//systemChat format ['Curator revives remaining: %1',(missionNamespace getVariable 'QS_curator_revivePoints')];
	_module = getAssignedCuratorLogic player;
	/*/[28,_module,((curatorPoints _module) - 0.05)] remoteExec ['QS_fnc_remoteExec',2,FALSE];/*/
	private _text = '';
	if ((random 1) > 0.333) then {
		_text = format ['%1 感受到了党组织的召唤，他苏醒了！',((name _unit) + ([' [AI]',''] select (isPlayer _unit)))];
	} else {
		if ((random 1) > 0.5) then {
			_text = format ['马克思对 %1 笑了笑，他醒了！',((name _unit) + ([' [AI]',''] select (isPlayer _unit)))];
		} else {
			_text = format ['%1 被神秘的东方力量救醒了！',((name _unit) + ([' [AI]',''] select (isPlayer _unit)))];
		};
	};
	if (_text isNotEqualTo '') then {
		['systemChat',_text] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
	};
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'治疗选择的单位',[],-1,TRUE,'Curator',FALSE];
};
if (_key isEqualTo 72) exitWith {
	//comment 'Toggle player view directions';
	playSound ['ClickSoft',FALSE];
	if (isNil {missionNamespace getVariable 'QS_curator_playerViewDirections'}) then {
		(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'玩家视野 - 显示',[],-1,TRUE,'Curator',FALSE];
		missionNamespace setVariable [
			'QS_curator_playerViewDirections',
			(
				addMissionEventHandler [
					'Draw3D',
					{
						{
							private _p0 = eyePos _x;
							_v1 = getCameraViewDirection _x;
							private _p1 = _p0 vectorAdd (_v1 vectorMultiply (currentZeroing (vehicle _x)));
							_p1 = ASLToAGL _p1;
							_p0 = ASLToAGL _p0;
							_arr = [_p0,_p1,[1,1,1,1]];
							for '_i' from 0 to 2 step 1 do {
								drawLine3D _arr;
							};
						} count allPlayers;
						if (isNull (findDisplay 312)) then {
							if (!isNil {missionNamespace getVariable 'QS_curator_playerViewDirections'}) then {
								removeMissionEventHandler ['Draw3D',(missionNamespace getVariable 'QS_curator_playerViewDirections')];
								missionNamespace setVariable ['QS_curator_playerViewDirections',nil,FALSE];
							};
						};
					}
				]
			),
			FALSE
		];
	} else {
		(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,'玩家视野 - OFF',[],-1,TRUE,'Curator',FALSE];
		removeMissionEventHandler ['Draw3D',(missionNamespace getVariable 'QS_curator_playerViewDirections')];
		missionNamespace setVariable ['QS_curator_playerViewDirections',nil,FALSE];
	};	
};
if (_key isEqualTo 73) exitWith {
	playSound ['ClickSoft',FALSE];
	//comment 'Revive selected players';
	private _selectedUnits = [];
	if ((curatorSelected # 0) isEqualTo []) then {breakTo 'main';};
	{
		if (_x isKindOf 'Man') then {
			if (alive _x) then {
				if (!(isPlayer _x)) then {
					if (isNull (objectParent _x)) then {
						if (isNull (attachedTo _x)) then {
							if ((lifeState _x) in ['HEALTHY','INJURED']) then {
								_selectedUnits pushBack _x;
							};
						};
					};
				};
			};
		};
	} forEach (curatorSelected # 0);
	if (_selectedUnits isEqualTo []) then {breakTo 'main';};
	private _unit = _selectedUnits # 0;
	if ((lifeState _unit) in ['HEALTHY','INJURED']) then {
		if (local _unit) then {
			{
				_unit setVariable _x;
			} forEach [
				['QS_RD_draggable',TRUE,TRUE],
				['QS_RD_loadable',TRUE,TRUE]
			];
			_unit setUnconscious TRUE;
			_unit setCaptive TRUE;
			(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,3,-1,'设定单位昏迷',[],-1,TRUE,'Curator',FALSE];
		} else {
			50 cutText ['只能将宙斯生成的单位设置为昏迷状态','PLAIN DOWN',0.333];
		};
	} else {
		50 cutText ['无法将此单位设置为昏迷','PLAIN DOWN',0.333];
	};
};