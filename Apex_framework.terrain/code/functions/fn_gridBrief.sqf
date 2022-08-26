/*/
File: fn_gridBrief.sqf
Author: 

	Quiksilver

Last Modified:

	9/12/2017 A3 1.78 by Quiksilver

Description:

	Grid (De)Briefing
____________________________________________________________________________/*/

params ['_type','_usedObjectives','_gridMarkers'];
if (_type isEqualTo 0) exitWith {
	//comment 'Debrief';
	['QS_TASK_GRID_0'] call (missionNamespace getVariable 'BIS_fnc_deleteTask');
	['GRID_BRIEF',['主线战区','任务完成']] remoteExec ['QS_fnc_showNotification',-2,FALSE];
	{
		_x setMarkerAlpha 0;
	} forEach [
		'QS_marker_grid_IGmkr',
		'QS_marker_grid_IGcircle',
		'QS_marker_grid_IDAPloc',
		'QS_marker_grid_IDAPmkr',
		'QS_marker_grid_IDAPcircle',
		'QS_marker_grid_mtrMkr',
		'QS_marker_grid_mtrCircle'
	];
	0 spawn {
		uiSleep 5;
		{
			_x setMarkerAlpha 0;
		} forEach [
			'QS_marker_grid_capState',
			'QS_marker_grid_rspState',
			'QS_marker_grid_civState'
		];
	};
};
if (_type isEqualTo 1) exitWith {
	//comment 'Brief';
	private _text = '';
	{
		_x setMarkerAlpha 0.75;
	} forEach _aoGridMarkers;
	_centroid = missionNamespace getVariable 'QS_grid_aoCentroid';
	{
		_x setMarkerPos _centroid;
	} forEach [
		'QS_marker_aoMarker',
		'QS_marker_aoCircle'
	];
	if ((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isNotEqualTo 0) then {
		[objNull,_centroid] remoteExec ['QS_fnc_respawnOPFOR',[EAST,RESISTANCE],FALSE];
	};
	_centroidOffset = [
		((_centroid # 0) + 1000),
		((_centroid # 1) + 300),
		(_centroid # 2)
	];	
	'QS_marker_grid_civState' setMarkerText (format ['%1无平民伤亡',(toString [32,32,32])]);
	'QS_marker_grid_civState' setMarkerColor 'ColorCIVILIAN';
	'QS_marker_grid_civState' setMarkerPos _centroidOffset;
	'QS_marker_grid_civState' setMarkerAlpha 0.75;
	'QS_marker_grid_capState' setMarkerAlpha 0.75;
	_text = '任务目标列表<br/><br/>- (非强制) 不要造成平民伤亡，伤害平民会导致敌军数量增加<br/>- (必要) 消灭敌人，将指定数量的方格区域从红变绿<br/>- (必要) 摧毁敌军重生地道，否则叛军会持续出现<br/>';
	{
		if (_x isEqualTo 'SITE_TUNNEL') then {
			'QS_marker_grid_rspState' setMarkerAlpha 0.75;
		};
		if (_x isEqualTo 'SITE_IG') then {
			'QS_marker_grid_IGmkr' setMarkerAlpha 0.75;
			'QS_marker_grid_IGcircle' setMarkerAlpha 0.75;
			_text = _text + '- (非强制) 击杀或俘虏敌军指挥官<br/>';
			_text = _text + '- (非强制) 占领并守住HQ<br/>';
		};
		if (_x isEqualTo 'SITE_IDAP') then {
			'QS_marker_grid_IDAPloc' setMarkerAlpha 0.75;
			'QS_marker_grid_IDAPmkr' setMarkerAlpha 0.75;
			'QS_marker_grid_IDAPcircle' setMarkerAlpha 0.75;
			_text = _text + '- (非强制) 帮助IDAP清理未爆弹地雷区<br/>';
		};
	} forEach _usedObjectives;
	_text = _text + '<br/><br/>搜索战区内的建筑物收集情报，以确认敌军地道口位置。<br/><br/>敌军的地道入口看起来像是井盖，在基地内步兵重生点有实物展示！';
	[
		'QS_TASK_GRID_0',
		TRUE,
		[
			_text,
			'主线战区',
			'主线战区'
		],
		_centroid,
		'CREATED',
		5,
		FALSE,
		TRUE,
		'X',
		TRUE
	] call (missionNamespace getVariable 'BIS_fnc_setTask');
	['GRID_BRIEF',['主线战区','目标已经下发']] remoteExec ['QS_fnc_showNotification',-2,FALSE];
	// yes do it again, the marker network propagation can be ... unstable ...
	{
		_x setMarkerAlpha 0.75;
	} forEach _aoGridMarkers;
};