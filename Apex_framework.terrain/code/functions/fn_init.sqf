if (!isDedicated) exitWith {};
compileScript ['@Apex_cfg_opfor\please_enable_filePatching.sqf',TRUE];
missionNamespace setVariable ['QS_fnc_whitelist',(compileScript ['@Apex_cfg_opfor\whitelist.sqf',TRUE]),TRUE];
call (compileScript ['@Apex_cfg_opfor\parameters.sqf']);
0 spawn (missionNamespace getVariable 'QS_fnc_config');