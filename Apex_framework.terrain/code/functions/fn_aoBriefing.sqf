/*
File: fn_aoBriefing.sqf
Author: 

	Quiksilver

Last modified: 

	9/06/2016 A3 1.61 by Quiksilver

Description:

	De-brief players and clear AO
______________________________________________*/

_type = _this select 0;
_ao = _this select 1;
_QS_AOpos = _this select 2;

diag_log str _ao;

if (_type isEqualTo 'BRIEF') then {
	missionNamespace setVariable ['QS_enemiesCaptured_AO',0,FALSE];
	{
		_x setMarkerPos _QS_AOpos;
	} forEach [
		'QS_marker_aoCircle',
		'QS_marker_aoMarker'
	];
	if ((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isNotEqualTo 0) then {
		[objNull,_QS_AOpos] remoteExec ['QS_fnc_respawnOPFOR',[EAST,RESISTANCE],FALSE];
	};
	'QS_marker_aoMarker' setMarkerText (format [(localize "STR_QS_Brief_take"),(toString [32,32,32]),_ao]);
	_targetStartText = parseText format [
		(localize "STR_QS_Brief_newTarget"),
		_ao
	];
	if (!(missionNamespace getVariable 'QS_mainao_firstRun')) then {
		//['hint',_targetStartText] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
		['NewMain',[_ao]] remoteExec ['QS_fnc_showNotification',-2,FALSE];
		['NewSub',[(localize "STR_QS_Brief_radioTower")]] remoteExec ['QS_fnc_showNotification',-2,FALSE];
	} else {
		missionNamespace setVariable ['QS_mainao_firstRun',FALSE,FALSE];
	};
	{
		_x setMarkerColorLocal 'ColorOPFOR';
		_x setMarkerAlpha 0.8;
	} forEach [
		'QS_marker_hqCircle',
		'QS_marker_hqMarker',
		'QS_marker_aoCircle',
		'QS_marker_aoMarker',
		'QS_marker_radioCircle',
		'QS_marker_radioMarker'
	];
	if ((missionNamespace getVariable 'QS_ao_aaMarkers') isNotEqualTo []) then {
		{
			_x setMarkerColorLocal 'ColorOPFOR';
			_x setMarkerAlpha 0.8;
		} count (missionNamespace getVariable 'QS_ao_aaMarkers');
	};
	if ((missionNamespace getVariable 'QS_virtualSectors_sub_1_markers') isNotEqualTo []) then {
		{
			_x setMarkerColorLocal 'ColorOPFOR';
			_x setMarkerAlpha 0.5;
		} forEach (missionNamespace getVariable 'QS_virtualSectors_sub_1_markers');
	};
	if ((missionNamespace getVariable 'QS_virtualSectors_sub_2_markers') isNotEqualTo []) then {
		{
			_x setMarkerColorLocal 'ColorOPFOR';
			_x setMarkerAlpha 0.5;
		} forEach (missionNamespace getVariable 'QS_virtualSectors_sub_2_markers');
	};
	if ((missionNamespace getVariable 'QS_virtualSectors_sub_3_markers') isNotEqualTo []) then {
		{
			_x setMarkerColorLocal 'ColorOPFOR';
			_x setMarkerAlpha 0.5;
		} forEach (missionNamespace getVariable 'QS_virtualSectors_sub_3_markers');
	};	
	{
		_x call (missionNamespace getVariable 'BIS_fnc_setTask');
	} forEach [
		[
			'QS_IA_TASK_AO_2',
			TRUE,
			[
				(localize "STR_QS_Brief_taskAo2Desc"),
				(localize "STR_QS_Brief_taskAo2Title"),
				(localize "STR_QS_Brief_taskAo2Marker")
			],
			(markerPos 'QS_marker_hqMarker'),
			'CREATED',
			5,
			FALSE,
			TRUE,
			'Attack',
			TRUE
		],
		[
			'QS_IA_TASK_AO_1',
			TRUE,
			[
				(localize "STR_QS_Brief_taskAo1Desc"),
				(localize "STR_QS_Brief_taskAo1Title"),
				(localize "STR_QS_Brief_taskAo1Marker")
			],
			(markerPos 'QS_marker_radioMarker'),
			'CREATED',
			5,
			FALSE,
			TRUE,
			'Destroy',
			TRUE
		],
		[
			'QS_IA_TASK_AO_0',
			TRUE,
			[
				(localize "STR_QS_Brief_taskAo0Desc"),
				(format [(localize "STR_QS_Brief_taskAo0Title"),_ao]),
				(format [(localize "STR_QS_Brief_taskAo0Marker"),_ao])
			],
			_QS_AOpos,
			'ASSIGNED',
			5,
			FALSE,
			TRUE,
			'X',
			TRUE
		]
	];	
};
if (_type isEqualTo 'DEBRIEF') then {
	['QS_IA_TASK_AO_0'] call (missionNamespace getVariable 'BIS_fnc_deleteTask');
	_targetCompleteText = parseText format [(localize "STR_QS_Brief_taskComplete"),(_ao select 0),(missionNamespace getVariable 'QS_enemiesCaptured_AO')];
	//['hint',_targetCompleteText] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
	missionNamespace setVariable ['QS_evacPosition_1',_QS_AOpos,TRUE];
	{
		_x setMarkerAlpha 0;
	} forEach [
		'QS_marker_aoCircle',
		'QS_marker_aoMarker',
		'QS_marker_radioCircle',
		'QS_marker_radioMarker'
	];
	'QS_marker_aoMarker' setMarkerText (format ['%1',(toString [32,32,32])]);
	{
		_x setMarkerAlphaLocal 0;
		_x setMarkerColor 'ColorOPFOR';
	} forEach [
		'QS_marker_hqMarker',
		'QS_marker_hqCircle'
	];
	if ((missionNamespace getVariable 'QS_virtualSectors_sub_1_markers') isNotEqualTo []) then {
		{
			_x setMarkerAlpha 0;
		} forEach (missionNamespace getVariable 'QS_virtualSectors_sub_1_markers');
	};
	if ((missionNamespace getVariable 'QS_virtualSectors_sub_2_markers') isNotEqualTo []) then {
		{
			_x setMarkerAlpha 0;
		} forEach (missionNamespace getVariable 'QS_virtualSectors_sub_2_markers');
	};
	if ((missionNamespace getVariable 'QS_virtualSectors_sub_3_markers') isNotEqualTo []) then {
		{
			_x setMarkerAlpha 0;
		} forEach (missionNamespace getVariable 'QS_virtualSectors_sub_3_markers');
	};
	['CompletedMain',[(_ao select 0)]] remoteExec ['QS_fnc_showNotification',-2,FALSE];
};