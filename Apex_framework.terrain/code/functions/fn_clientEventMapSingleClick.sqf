/*
File: fn_clientEventMapSingleClick.sqf
Author: 

	Quiksilver
	
Last modified:

	3/09/2016 A3 1.62 by Quiksilver
	
Description:

	Map Single Click Mission Event
___________________________________________________________________*/

params ['_units','_pos','_alt','_shift'];
if ((_pos distance2D (markerPos 'QS_marker_module_fob')) < 250) then {
	[nil,nil,nil,1] call (missionNamespace getVariable 'QS_fnc_clientInteractFOBTerminal');
};
if (missionNamespace getVariable ['QS_customAO_GT_active',FALSE]) then {
	if (_shift) then {
		if ((markerAlpha 'QS_marker_GT_TP') isEqualTo 1) then {
			if ((_pos distance2D (markerPos 'QS_marker_GT_TP')) < 100) then {
				if ((player distance2D (markerPos 'QS_marker_aoMarker')) > 1000) then {
					if (isNull (objectParent player)) then {
						if (((attachedObjects player) findIf {((!isNull _x) && (!(_x isKindOf 'Sign_Sphere10cm_F')))}) isEqualTo -1) then {
							if (((lifeState player) in ['HEALTHY','INJURED']) && (!captive player)) then {
								setViewDistance 500;
								setObjectViewDistance 500;
								player setDir (random 360);
								preloadCamera (markerPos 'QS_marker_GT_TP');
								0 spawn {
									player allowDamage FALSE;
									uiSleep 10;
									player allowDamage TRUE;
								};
								player setVehiclePosition [(markerPos 'QS_marker_GT_TP'),[],15,'NONE'];
								openMap FALSE;
								50 cutText [(format ['欢迎来到 %1',(['Kavala','Georgetown'] select (worldName isEqualTo 'Tanoa'))]),'PLAIN DOWN',0.5];
							} else {
								50 cutText ['重伤时无法传送','PLAIN DOWN',0.5];
							};
						} else {
							50 cutText ['必须无阻碍才能传送','PLAIN DOWN',0.5];
						};
					} else {
						50 cutText ['必须徒步才能传送','PLAIN DOWN',0.5];
					};
				} else {
					50 cutText ['距离传送点距离过短','PLAIN DOWN',0.5];
				};
			};
		};
	};
};