/*/
File: fn_clientInteractUAVSelfDestruct.sqf
Author:

	Quiksilver
	
Last modified:

	22/11/2017 A3 1.78
	
Description:
	
	Self-Destruct UAV
__________________________________________________________________________/*/

_cameraOn = cameraOn;
if (!(unitIsUAV _cameraOn)) exitWith {};
if (!(((crew _cameraOn) findIf {((alive _x) && (isPlayer _x))}) isEqualTo -1)) exitWith {
	50 cutText ['有其他玩家仍然在载具内','PLAIN DOWN',0.333];
};
private _result = [(format ['你确定要销毁这个 %1 么？',(getText (configFile >> 'CfgVehicles' >> (typeOf _cameraOn) >> 'displayName'))]),'警告','销毁','取消',(findDisplay 46),FALSE,FALSE] call (missionNamespace getVariable 'BIS_fnc_guiMessage'); 
if (_result) then {
	['systemChat',(format ['%1 在坐标 %3 启动自毁程序销毁了一个 %2',profileName,(getText (configFile >> 'CfgVehicles' >> (typeOf _cameraOn) >> 'displayName')),(mapGridPosition _cameraOn)])] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
	_cameraOn setDamage [1,FALSE];
} else {
	50 cutText ['已取消','PLAIN DOWN',0.333];
};