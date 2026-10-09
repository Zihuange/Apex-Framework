/*
File: fn_clientEventKeyUp.sqf
Author:
	
	Quiksilver
	
Last Modified:

	24/02/2023 A3 2.12 by Quiksilver

Description:

	Client Event KeyUp
__________________________________________________________*/

params ['','_key','_shift','_ctrl','_alt'];
/*/ ACE arsenal 打开时放行 KeyUp（同 KeyDown，避免框架拦截） */
if (!(isNull (findDisplay 1127001))) exitWith {FALSE};
private _c = FALSE;
/*/
if !(uiNamespace isNil 'BIS_dynamicGroups_keyDownTime') then {
	uiNamespace setVariable ['BIS_dynamicGroups_keyDownTime',nil];
};
if (
	(_key in (actionKeys 'TeamSwitch')) &&
	{(!_shift)} &&
	{(!_ctrl)} &&
	{(uiNamespace isNil 'BIS_dynamicGroups_ignoreInterfaceOpening')}
) then {
	if ((isNull (findDisplay 60490)) && {missionNamespace getVariable ['BIS_dynamicGroups_allowInterface',TRUE]}) then {
		(call (missionNamespace getVariable 'BIS_fnc_displayMission')) createDisplay 'RscDisplayDynamicGroups';
	} else {
		if (uiNamespace isNil 'BIS_dynamicGroups_hasFocus') then {
			(['GetDisplay'] call (uiNamespace getVariable ['RscDisplayDynamicGroups_script',{}])) closeDisplay 2;
		};			
	};
	_c = TRUE;
};
/*/
if (
	(_key in (actionKeys 'GetOver')) &&
	{(isNull (objectParent QS_player))}
) then {
	if (uiNamespace getVariable ['QS_ui_getincargo_activate',TRUE]) then {
		uiNamespace setVariable ['QS_ui_getincargo_activate',FALSE];
	};
};
if (((actionKeys 'User20') isEqualTo []) && {(_key isEqualTo 219)}) then {
	if (missionNamespace getVariable ['QS_aceInteractMenu',FALSE]) then {
		/*/ ACE3 环境：Windows 键适配 ACE3 自我互动菜单。
		   此处调用 ACE keyUp [1] 关闭自我互动菜单并触发选中动作。
		   安全：单按/Ctrl+Win 时 CBA keybind 的 keyUp 先触发并关闭菜单（openedMenuType=-1），
		   本调用幂等退出；Shift/Alt+Win（CBA 不匹配）时由本调用负责关闭，避免菜单卡住。 */
		if !(isNil {missionNamespace getVariable 'ace_interact_menu_fnc_keyUp'}) then {
			[1,false] call (missionNamespace getVariable 'ace_interact_menu_fnc_keyUp');
		};
		_c = TRUE;
	} else {
		['OUT'] call QS_fnc_clientMenuActionContext;
	};
};
_c;