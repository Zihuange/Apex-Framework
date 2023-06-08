/*
    File: fn_tunnel_aperture.sqf
    Author: Ethan Johnson
    Date: 2020-12-08
    Last Update: 2021-01-04
    Public: No

    Description:
    Sets the aperture of the users view camera which makes tunnels darker in the day without affecting other users/ the world.

    Parameter(s):
    _value - Value of the terrain brightness, used to determien how dark to make the aperture [NUMBER, defaults to -1]

    Returns:
    Function reached the end [BOOL]

    Example(s):
    [-1] call vn_fnc_tunnel_aperture
*/

params [['_value', -1, [-1]]];
if (
	(player getVariable ['QS_client_inTunnel',FALSE]) &&
	((lifeState player) isEqualTo 'INCAPACITATED')
) exitWith {
	setApertureNew [75,75,75,1];
};
if (_value <= -1) exitWith {
	setApertureNew [-1];
};
if ((_value >= 0) && (_value < 50)) exitWith {
	setApertureNew [3,3,3,1];
};
if ((_value >= 50) && (_value < 250)) exitWith {
	setApertureNew [12,12,12,1];
};
if ((_value >= 250) && (_value < 500)) exitWith {
	setApertureNew [15,15,15,1];
};
if ((_value >= 500) && (_value < 1000)) exitWith {
	setApertureNew [25,25,25,1];
};
if ((_value >= 1000) && (_value < 1500)) exitWith {
	setApertureNew [30,30,30,1];
};
if ((_value >= 1500) && (_value < 2000)) exitWith {
	setApertureNew [35,35,35,1];
};
if ((_value >= 2000) && (_value < 3000)) exitWith {
	setApertureNew [45,45,45,1];
};
if ((_value >= 3000) && (_value < 4000)) exitWith {
	setApertureNew [55,55,55,1];
};
if (_value >= 4000) exitWith {
	setApertureNew [75,75,75,1];
};
TRUE;
