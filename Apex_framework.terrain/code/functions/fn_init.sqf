if (!isDedicated) exitWith {};
missionNamespace setVariable ['QS_fnc_whitelist',(compileScript ['@Apex_cfg_opfor\whitelist.sqf',TRUE]),TRUE];
call (compileScript ['@Apex_cfg_opfor\parameters.sqf']);
0 spawn (missionNamespace getVariable 'QS_fnc_config');