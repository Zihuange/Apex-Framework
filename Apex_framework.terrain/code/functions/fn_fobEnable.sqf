/*
File: fn_fobEnable.sqf
Author:

	Quiksilver
	
Last Modified:

	8/09/2016 A3 1.62 by Quiksilver

Description:

	Enable FOB
___________________________________________________*/

_side = _this # 0;
_activatorName = _this # 1;
private _color = 'ColorUnknown';
if (_side isEqualTo EAST) then {
	_color = 'ColorOPFOR';
};
if (_side isEqualTo WEST) then {
	_color = 'ColorWEST';
};
if (_side isEqualTo RESISTANCE) then {
	_color = 'ColorINDEPENDENT';
};
if (_side isEqualTo CIVILIAN) then {
	_color = 'ColorCIVILIAN';
};
if (_side isEqualTo sideUnknown) then {
	_color = 'ColorUNKNOWN';
};
'QS_marker_module_fob' setMarkerAlpha 1;
{
	_x setMarkerColor _color;
} forEach [
	'QS_marker_module_fob',
	'QS_marker_veh_fieldservice_04',
	'QS_marker_veh_fieldservice_01'
];
[
	[],
	{
		if ((vehicle player) isKindOf 'Air') then {
			if (player in [(driver (vehicle player)),(gunner (vehicle player))]) then {
				player enableAIFeature ['CHECKVISIBLE',TRUE];
			};
		};
	}
] remoteExec ['call',-2,FALSE];
[(missionNamespace getVariable 'QS_module_fob_flag'),_side,'',FALSE,objNull,1] call (missionNamespace getVariable 'QS_fnc_setFlag');
/*/'QS_marker_module_fob' setMarkerColor 'ColorINDEPENDENT';/*/
['sideChat',[WEST,'HQ'],(format ['%3 %1 %4 %2!',(missionNamespace getVariable 'QS_module_fob_displayName'),_activatorName,localize 'STR_QS_Chat_047',localize 'STR_QS_Chat_048'])] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
['FOB_UPDATE',['',localize 'STR_QS_Notif_055']] remoteExec ['QS_fnc_showNotification',-2,FALSE];
0 spawn {
	sleep 2;
	{
		if (!isNull _x) then {
			[_x,3] call (missionNamespace getVariable 'BIS_fnc_DataTerminalAnimate');
		};
	} forEach [
		(missionNamespace getVariable 'QS_module_fob_dataTerminal'),
		(missionNamespace getVariable 'QS_module_fob_baseDataTerminal')
	];
	sleep 3;
	['FOB_UPDATE',['',localize 'STR_QS_Notif_056']] remoteExec ['QS_fnc_showNotification',-2,FALSE];
};
/*/taskfailed for other sides?/*/
missionNamespace setVariable ['QS_module_fob_side',_side,TRUE];