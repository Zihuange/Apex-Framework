/*/
File: fn_vTowAttach.sqf
Author:

	Quiksilver
	
Last Modified:

	13/10/2018 A3 1.84 by Quiksilver
	
Description:

	Towing
_______________________________________________________/*/

params ['_vehicle','_towedVehicle','_isUAV'];
_ropeLength = ((((boundingBoxReal _vehicle) # 1) # 1) / 1.5) + 1 + (((boundingBoxReal _towedVehicle) # 1) # 1);
_vehicle setVariable ['QS_ropeAttached',TRUE,TRUE];
_towedVehicle setVariable ['QS_ropeAttached',TRUE,TRUE];
_displayName = getText (configFile >> 'CfgVehicles' >> (typeOf _towedVehicle) >> 'displayName');
_vehicle enableRopeAttach FALSE;
_vehicle enableVehicleCargo FALSE;
_towedVehicle enableRopeAttach FALSE;
_towedVehicle enableVehicleCargo FALSE;
_towedVehicle setVariable ['QS_transporter',[profileName,player,(getPlayerUID player)],TRUE];
_QS_action_ugv_stretcherModel = 'a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d';
if (_isUAV) then {
	if (((attachedObjects _vehicle) findIf {(((toLowerANSI ((getModelInfo _x) # 1)) isEqualTo _QS_action_ugv_stretcherModel) && (!(isObjectHidden _x)))}) isNotEqualTo -1) then {
		{
			if ((toLowerANSI ((getModelInfo _x) # 1)) isEqualTo _QS_action_ugv_stretcherModel) then {
				if (!(isObjectHidden _x)) then {
					[71,_x,TRUE] remoteExecCall ['QS_fnc_remoteExec',2,FALSE];
				};
			};
		} forEach (attachedObjects _vehicle);
		uiSleep 0.1;
	};
};
if (!(_towedVehicle isKindOf 'StaticWeapon')) then {
	if (local _towedVehicle) then {
		_towedVehicle lock 2;
	} else {
		['lock',_towedVehicle,2] remoteExec ['QS_fnc_remoteExecCmd',_towedVehicle,FALSE];
	};
};
private _defaultAttachPoint = [[0,-_ropeLength,0.75],0];
private _attachPointReturn = [TRUE,_vehicle,_towedVehicle,_defaultAttachPoint] call (missionNamespace getVariable 'QS_fnc_getCustomAttachPoint');
private _attachPoint = _attachPointReturn select [0,2];
_towedVehicle attachTo [_vehicle,(_attachPoint # 0)];
if ((_attachPoint # 1) isNotEqualTo 0) then {
	if (local _towedVehicle) then {
		_towedVehicle setDir (_attachPoint # 1);
	} else {
		['setDir',_towedVehicle,(_attachPoint # 1)] remoteExec ['QS_fnc_remoteExecCmd',_towedVehicle,FALSE];
	};
};
private _checkIntersections = FALSE;
private _isHauling = FALSE;
if ((_attachPoint isEqualTo _defaultAttachPoint) || {((count _attachPointReturn) > 2)}) then {
	_vehicle setVariable ['QS_vehicle_hauling',[FALSE,_towedVehicle],TRUE];
	50 cutText [format [localize 'STR_QS_Text_255',_displayName],'PLAIN DOWN',0.5];
	_checkIntersections = TRUE;
} else {
	_isHauling = TRUE;
	_vehicle setVariable ['QS_vehicle_hauling',[TRUE,_towedVehicle],TRUE];
	50 cutText [format [localize 'STR_QS_Text_256',_displayName],'PLAIN DOWN',0.5];
};
if (_towedVehicle isKindOf 'StaticWeapon') then {
	_towedVehicle enableWeaponDisassembly FALSE;
};
if (_isHauling && (_towedVehicle isKindOf 'StaticWeapon') && (!(_towedVehicle isKindOf 'Pod_Heli_Transport_04_crewed_base_F'))) exitWith {
	playSound3D [
		'A3\Sounds_F\sfx\ui\vehicles\vehicle_repair.wss',
		_towedVehicle,
		FALSE,
		(getPosASL _towedVehicle),
		2,
		1,
		25
	];
	[86,_towedVehicle] remoteExec ['QS_fnc_remoteExec',2,FALSE];
	50 cutText [format [localize 'STR_QS_Text_257',_displayName],'PLAIN DOWN',0.5];
};
if (_isUAV) then {
	_vehicle setVariable [
		'QS_action_towRelease1',
		(_vehicle addAction [localize 'STR_QS_Interact_010','[cameraOn] call QS_fnc_vTowRelease',[],21,FALSE,TRUE,'','[cameraOn] call QS_fnc_conditionTowDetach']),
		FALSE
	];
	_vehicle setUserActionText [(_vehicle getVariable 'QS_action_towRelease1'),((_vehicle actionParams (_vehicle getVariable 'QS_action_towRelease1')) # 0),(format ["<t size='3'>%1</t>",((_vehicle actionParams (_vehicle getVariable 'QS_action_towRelease1')) # 0)])];
} else {
	_vehicle setVariable [
		'QS_action_towRelease2',
		(player addAction [localize 'STR_QS_Interact_010','[(vehicle player)] call QS_fnc_vTowRelease',[],21,FALSE,TRUE,'','[(vehicle player)] call QS_fnc_conditionTowDetach']),
		FALSE
	];
	player setUserActionText [(_vehicle getVariable 'QS_action_towRelease2'),((player actionParams (_vehicle getVariable 'QS_action_towRelease2')) # 0),(format ["<t size='3'>%1</t>",((player actionParams (_vehicle getVariable 'QS_action_towRelease2')) # 0)])];
};
_getMass = getMass _vehicle;
_getCMass = getCenterOfMass _vehicle;
if (!(_isUAV)) then {
	if (!(_isHauling)) then {
		_vehicle setMass (_getMass + (getMass _towedVehicle));
		_vehicle setCenterOfMass [(_getCMass # 0),-1,((_getCMass # 2) * 0.95)];
	};
};
_isIntersectingSurfaces = {
	params ['_vehicle','_towedVehicle'];
	(((lineIntersectsSurfaces [(AGLToASL (_vehicle modelToWorld [2,0,0])),(AGLToASL (_vehicle modelToWorld [2,-10,0])),_vehicle,_towedVehicle,TRUE,1,'GEOM']) isNotEqualTo []) || ((lineIntersectsSurfaces [(AGLToASL (_vehicle modelToWorld [-2,0,0])),(AGLToASL (_vehicle modelToWorld [-2,-10,0])),_vehicle,_towedVehicle,TRUE,1,'GEOM']) isNotEqualTo []))
};
[26,_towedVehicle,FALSE] remoteExec ['QS_fnc_remoteExec',0,FALSE];
if (_isUAV) then {
	_vehicle setVariable [
		'QS_action_towLoadCargo1',
		(_vehicle addAction [localize 'STR_QS_Interact_037',(missionNamespace getVariable 'QS_fnc_clientInteractTowLoadCargo'),[],20,FALSE,TRUE,'','[cameraOn] call (missionNamespace getVariable "QS_fnc_conditionTowLoadCargo")',-1,FALSE]),
		FALSE
	];
	_vehicle setUserActionText [(_vehicle getVariable 'QS_action_towLoadCargo1'),((_vehicle actionParams (_vehicle getVariable 'QS_action_towLoadCargo1')) # 0),(format ["<t size='3'>%1</t>",((_vehicle actionParams (_vehicle getVariable 'QS_action_towLoadCargo1')) # 0)])];
} else {
	_vehicle setVariable [
		'QS_action_towLoadCargo2',
		(player addAction [localize 'STR_QS_Interact_037',(missionNamespace getVariable 'QS_fnc_clientInteractTowLoadCargo'),[],20,FALSE,TRUE,'','[(vehicle player)] call (missionNamespace getVariable "QS_fnc_conditionTowLoadCargo")',-1,FALSE]),
		FALSE
	];
	player setUserActionText [(_vehicle getVariable 'QS_action_towLoadCargo2'),((player actionParams (_vehicle getVariable 'QS_action_towLoadCargo2')) # 0),(format ["<t size='3'>%1</t>",((player actionParams (_vehicle getVariable 'QS_action_towLoadCargo2')) # 0)])];
};
waitUntil {
	uiSleep 0.075;
	(
		((!(_isUAV)) && (!((lifeState player) in ['HEALTHY','INJURED']))) ||
		((!(_isUAV)) && (!alive player)) ||
		((!(_isUAV)) && (player isNotEqualTo (driver _vehicle))) ||
		(!(_towedVehicle in (attachedObjects _vehicle))) ||
		(!isNil {_towedVehicle getVariable 'QS_loadCargoIn'}) ||
		(!(_vehicle getVariable 'QS_ropeAttached')) || 
		(!alive _vehicle) || 
		(!alive _towedVehicle) ||
		(!canMove _vehicle) ||
		((_checkIntersections) && ([_vehicle,_towedVehicle] call _isIntersectingSurfaces)) ||
		(((vectorUp _vehicle) # 2) < 0)
	)
};
_vehicle setVariable ['QS_vehicle_hauling',[],TRUE];
_vehicle allowDamage FALSE;
[26,_towedVehicle,TRUE] remoteExec ['QS_fnc_remoteExec',0,FALSE];
if (!(_isUAV)) then {
	if (!(_isHauling)) then {
		_vehicle setMass _getMass;
		_vehicle setCenterOfMass _getCMass;
	};
};
if (_isUAV) then {
	if (((attachedObjects _vehicle) findIf {(((toLowerANSI ((getModelInfo _x) # 1)) isEqualTo _QS_action_ugv_stretcherModel) && (isObjectHidden _x))}) isNotEqualTo -1) then {
		{
			if ((toLowerANSI ((getModelInfo _x) # 1)) isEqualTo _QS_action_ugv_stretcherModel) then {
				if (isObjectHidden _x) then {
					[71,_x,FALSE] remoteExec ['QS_fnc_remoteExec',2,FALSE];
				};
			};
		} forEach (attachedObjects _vehicle);
	};
	_vehicle removeAction (_vehicle getVariable 'QS_action_towRelease1');
	_vehicle removeAction (_vehicle getVariable 'QS_action_towLoadCargo1');
} else {
	player removeAction (_vehicle getVariable 'QS_action_towRelease2');
	player removeAction (_vehicle getVariable 'QS_action_towLoadCargo2');
};
_vehicle setVariable ['QS_ropeAttached',FALSE,TRUE];
_towedVehicle setVariable ['QS_ropeAttached',FALSE,TRUE];
_vehicle enableRopeAttach TRUE;
_vehicle enableVehicleCargo TRUE;
_towedVehicle enableRopeAttach TRUE;
_towedVehicle enableVehicleCargo TRUE;
if (_towedVehicle isKindOf 'StaticWeapon') then {
	_towedVehicle enableWeaponDisassembly FALSE;
};
_detachPos = [FALSE,_vehicle,_towedVehicle,[0,((-_ropeLength) - 1),0.75]] call (missionNamespace getVariable 'QS_fnc_getCustomAttachPoint');
if (isNil {_towedVehicle getVariable 'QS_loadCargoIn'}) then {
	_towedVehicle allowDamage FALSE;
	_posIsClear = TRUE;
	_line01 = lineIntersectsSurfaces [(AGLToASL (_vehicle modelToWorld [2,0,0])),(AGLToASL (_vehicle modelToWorld [2,-17,0])),_vehicle,_towedVehicle,TRUE,1,'GEOM'];
	_line02 = lineIntersectsSurfaces [(AGLToASL (_vehicle modelToWorld [-2,0,0])),(AGLToASL (_vehicle modelToWorld [-2,-17,0])),_vehicle,_towedVehicle,TRUE,1,'GEOM'];
	_line03 = lineIntersectsSurfaces [(AGLToASL (_vehicle modelToWorld [0,0,0])),(AGLToASL (_vehicle modelToWorld [0,-17,0])),_vehicle,_towedVehicle,TRUE,1,'GEOM'];
	if (_line01 isNotEqualTo []) then {_posIsClear = FALSE;};
	if (_line02 isNotEqualTo []) then {_posIsClear = FALSE;};
	if (_line03 isNotEqualTo []) then {_posIsClear = FALSE;};
	if (!(_posIsClear)) then {
		private _center = getPosWorld _towedVehicle;
		for '_x' from 0 to 1 step 0 do {
			private _position = _center findEmptyPosition [0,40,(typeOf _towedVehicle)];
			if (_position isEqualTo []) then {
				_position = [_center,0,50,(sizeOf (typeOf _towedVehicle)),0,0.5,0] call (missionNamespace getVariable 'QS_fnc_findSafePos');
			};
			if ((lineIntersectsSurfaces [(AGLToASL (_vehicle modelToWorld [0,0,0])),(AGLToASL _position),_vehicle,_towedVehicle,TRUE,1,'GEOM']) isEqualTo []) exitWith {};
		};
		_position set [2,(_center # 2)];
		private _posToSet = [(_position # 0),(_position # 1),((_position # 2)+0.35)];
		_towedVehicle setPosWorld _posToSet;
		[_towedVehicle,_posToSet] spawn {uiSleep 1;(_this # 0) allowDamage TRUE;(_this # 0) setVectorUp (surfaceNormal (_this # 1));};
		if (!isNull (attachedTo _towedVehicle)) then {
			_towedVehicle attachTo [_vehicle,[(_detachPos # 0),(_detachPos # 1),((_vehicle worldToModelVisual (position _towedVehicle)) # 2)]];
			detach _towedVehicle;
		};
		_towedVehicle setPosWorld _posToSet;
	} else {
		private _posToSet = [((getPosWorld _towedVehicle) # 0),((getPosWorld _towedVehicle) # 1),(((getPosWorld _towedVehicle) # 2)+0.35)];
		_towedVehicle setPosWorld _posToSet;
		[_towedVehicle,_posToSet] spawn {uiSleep 1;(_this # 0) allowDamage TRUE;(_this # 0) setVectorUp (surfaceNormal (_this # 1));};
		if (!isNull (attachedTo _towedVehicle)) then {
			_towedVehicle attachTo [_vehicle,[(_detachPos # 0),(_detachPos # 1),((_vehicle worldToModelVisual (position _towedVehicle)) # 2)]];
			detach _towedVehicle;
		};
		_towedVehicle setPosWorld _posToSet;
	};
};
if (local _towedVehicle) then {
	_towedVehicle lock 0;
} else {
	['lock',_towedVehicle,0] remoteExec ['QS_fnc_remoteExecCmd',_towedVehicle,FALSE];
};
if (isNull (attachedTo _towedVehicle)) then {
	if ((_towedVehicle distance2D (markerPos 'QS_marker_crate_area')) < 500) then {
		if (!isNil {_towedVehicle getVariable 'QS_vehicle_isSuppliedFOB'}) then {
			_towedVehicle setVariable ['QS_vehicle_isSuppliedFOB',nil,TRUE];
			systemChat format ['%1 %2',(getText (configFile >> 'CfgVehicles' >> (typeOf _towedVehicle) >> 'displayName')),localize 'STR_QS_Chat_162'];
		};
	};
};
if (!isNil {_towedVehicle getVariable 'QS_loadCargoIn'}) exitWith {
	detach _towedVehicle;
	private _text = '';
	if ((_towedVehicle getVariable 'QS_loadCargoIn') setVehicleCargo _towedVehicle) then {
		_text = format ['%1 %3 %2',(getText (configFile >> 'CfgVehicles' >> (typeOf _towedVehicle) >> 'displayName')),(getText (configFile >> 'CfgVehicles' >> (typeOf (_towedVehicle getVariable 'QS_loadCargoIn')) >> 'displayName')),localize 'STR_QS_Text_114'];
	} else {
		_text = localize 'STR_QS_Text_116';
	};
	_towedVehicle setVariable ['QS_loadCargoIn',nil,FALSE];
	50 cutText [_text,'PLAIN DOWN',0.5];
	uiSleep 0.5;
	_vehicle allowDamage TRUE;
};
_towedVehicle allowDamage FALSE;
uiSleep 0.05;
_towedVehicle setPosASL (_vehicle modelToWorldWorld _detachPos);
if (!isNull (attachedTo _towedVehicle)) then {
	_towedVehicle attachTo [_vehicle,[(_detachPos # 0),(_detachPos # 1),((_vehicle worldToModelVisual (position _towedVehicle)) # 2)]];
	detach _towedVehicle;
};
_towedVehicle setPosASL (_vehicle modelToWorldWorld _detachPos);
if (((getPosATL _towedVehicle) # 2) < 5) then {
	_towedVehicle setVectorUp (surfaceNormal (getPosWorld _towedVehicle));
};
50 cutText [localize 'STR_QS_Text_092','PLAIN DOWN',0.25];
uiSleep 0.5;
_towedVehicle allowDamage TRUE;
_vehicle allowDamage TRUE;