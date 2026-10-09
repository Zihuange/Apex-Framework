/*/
File: fn_aceMedicalInit.sqf
Author:

	Quiksilver (ACE3 adaptation)

Description:

	ACE3 Medical integration bootstrap
	- Detect ACE3 medical addon
	- Set QS_medSys gate (TRUE = ACE medical active)
	- Register ACE medical event listeners (client-side)

Called from:
	fn_initPlayerLocal.sqf (client) / fn_config.sqf (server optional)

Notes:
	- ace_unconscious      : Global event, unit unconscious state changed
	- ace_treatmentSucceded: Local event on caller (medic), treatment completed
______________________________________________/*/

// --- Detect ACE3 Medical
private _aceMedicalLoaded = isClass (configFile >> 'CfgPatches' >> 'ace_medical');
missionNamespace setVariable ['QS_medSys',_aceMedicalLoaded,TRUE];
// --- Detect ACE3 Interaction Menu（Windows 键互动菜单 / 自我互动菜单按键适配）
missionNamespace setVariable ['QS_aceInteractMenu',isClass (configFile >> 'CfgPatches' >> 'ace_interact_menu'),TRUE];
// --- Detect ACE3 Arsenal（BI Arsenal 自动适配）
/*/ ace_arsenal_fnc_* 由 ACE3 在 preInit 时经 CBA_fnc_compileFunction 自动编译进 missionNamespace，
   框架无需（也不应）自行 setVariable 初始化；此处仅在模块加载且函数已就绪时才启用 QS_aceArsenal，
   避免运行时 missionNamespace getVariable 返回 nil 导致 call nil 报错 */
private _aceArsenalLoaded = isClass (configFile >> 'CfgPatches' >> 'ace_arsenal');
private _aceArsenalFncOk = (
	_aceArsenalLoaded &&
	{!(isNil {missionNamespace getVariable 'ace_arsenal_fnc_openBox'})} &&
	{!(isNil {missionNamespace getVariable 'ace_arsenal_fnc_addVirtualItems'})} &&
	{!(isNil {missionNamespace getVariable 'ace_arsenal_fnc_removeVirtualItems'})}
);
missionNamespace setVariable ['QS_aceArsenal',_aceArsenalFncOk,TRUE];

if (!_aceMedicalLoaded) exitWith {FALSE};

if (hasInterface) then {
	/*/ ==== Unconscious state tracking ==== */
	["ace_unconscious", {
		params ['_unit','_state'];
		if (isPlayer _unit) then {
			if (_state) then {
				_unit setVariable ['QS_client_downedPosition',getPosASL _unit,FALSE];
				_unit setVariable ['QS_revive_timeDown',diag_tickTime,FALSE];
			};
		};
	}] call CBA_fnc_addEventHandler;

	/*/ ==== Treatment success -> leaderboard (case 51) ==== */
	["ace_treatmentSucceded", {
		params ['_caller','_target','_selectionName','_className','_itemUser','_usedItem','_createLitter'];
		if (isPlayer _target) then {
			private _val = 1;
			if (((_caller getVariable ['QS_stamina_multiplier',[FALSE,0]]) # 0)) then {
				_val = 1.25;
			};
			private _lastPatient = _caller getVariable ['QS_revive_lastPatient',[]];
			if (_lastPatient isEqualTo []) then {
				_caller setVariable ['QS_revive_lastPatient',[(getPlayerUID _target),(time + 180)],FALSE];
				[51,[_caller,(getPlayerUID _caller),profileName,_val]] remoteExec ['QS_fnc_remoteExec',2,FALSE];
			} else {
				if ((getPlayerUID _target) isEqualTo (_lastPatient # 0)) then {
					if (time > (_lastPatient # 1)) then {
						[51,[_caller,(getPlayerUID _caller),profileName,_val]] remoteExec ['QS_fnc_remoteExec',2,FALSE];
					};
				} else {
					[51,[_caller,(getPlayerUID _caller),profileName,_val]] remoteExec ['QS_fnc_remoteExec',2,FALSE];
				};
			};
		};
	}] call CBA_fnc_addEventHandler;
};

TRUE;
