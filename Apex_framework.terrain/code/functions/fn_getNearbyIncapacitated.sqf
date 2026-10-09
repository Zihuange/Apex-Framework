/*/
File: fn_getNearbyIncapacitated.sqf
Author:

	Quiksilver

Last Modified:

	4/12/2018 A3 1.86 by Quiksilver
	
Description:

	Get Nearby Incapacitated
_____________________________________________/*/

params ['_origin','_radius','_fn_enemySides'];
private _fn_isUnconscious = missionNamespace getVariable ['QS_fnc_isUnconscious',{((lifeState _this) isEqualTo 'INCAPACITATED')}];
private _incapacitated = (_origin nearEntities ['CAManBase',_radius]) select {
	( (_x call _fn_isUnconscious) && ( (isNull (group _x)) || {(!((side (group _x)) in ((QS_player getVariable ['QS_unit_side',WEST]) call _fn_enemySides)))}) )
};
private _v = objNull;
{
	_v = _x;
	if (alive _v) then {
		if (((crew _v) findIf {(alive _x)}) isNotEqualTo -1) then {
			{
				if (_x call _fn_isUnconscious) then {
					if (isNull (group _x)) then {
						_incapacitated pushBackUnique _x;
					} else {
						if (!((side (group _x)) in ((QS_player getVariable ['QS_unit_side',WEST]) call _fn_enemySides))) then {
							_incapacitated pushBackUnique _x;
						};
					};
				};
			} forEach (crew _v);
		};
	};
} forEach (_origin nearEntities [['LandVehicle','Air','Ship'],_radius]);
missionNamespace setVariable ['QS_client_medicIcons_units',_incapacitated,FALSE];