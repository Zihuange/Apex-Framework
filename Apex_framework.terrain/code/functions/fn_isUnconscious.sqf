/*/
File: fn_isUnconscious.sqf
Author:

	Quiksilver

Description:

	Unified unconsciousness check (ACE3-aware)

	- ACE3 医疗激活 (QS_medSys=TRUE): 检测 ACE_isUnconscious 变量
	- 原版路径: 检测 lifeState == 'INCAPACITATED'

Params:
	0: _unit <OBJECT>

Return:
	<BOOL> - unit is unconscious
____________________________________________________/*/

params ['_unit'];
if (isNull _unit) exitWith {FALSE};
if ((missionNamespace getVariable ['QS_medSys',FALSE])) then {
	(_unit getVariable ['ACE_isUnconscious',FALSE])
} else {
	((lifeState _unit) isEqualTo 'INCAPACITATED')
};
