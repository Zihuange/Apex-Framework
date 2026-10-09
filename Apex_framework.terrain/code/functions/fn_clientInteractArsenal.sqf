/*/
File: fn_clientInteractArsenal.sqf
Author:

	Quiksilver
	
Last Modified:

	9/10/2023 A3 2.14 by Quiksilver
	
Description:

	Arsenal
_____________________________________________/*/

params ['','','','_unit'];
(QS_player getVariable ['QS_inzone',[]]) params ['_inSafezone','_safezoneLevel','_safezoneActive'];
_enemySides = QS_player call QS_fnc_enemySides;
if (
	(
		(!(_inSafezone)) ||
		(_inSafezone && _safezoneActive && (_safezoneLevel < 2))
	) &&
	(((flatten (_enemySides apply {units _x})) inAreaArray [QS_player,QS_enemyInterruptAction_radius,QS_enemyInterruptAction_radius,0,FALSE,-1]) isNotEqualTo [])
) exitWith {
	50 cutText [localize 'STR_QS_Text_454','PLAIN DOWN',0.5];
	FALSE;
};
if (missionNamespace getVariable ['QS_aceArsenal',FALSE]) exitWith {
	/*/ ACE3 Arsenal：scheduled 环境准备虚拟物品 → openBox → 关闭检测。
	   注：ace_arsenal_fnc_* 由 ACE3 preInit 自动编译进 missionNamespace；此处再作防御性检查，
	   函数异常（nil）时回退 BI Arsenal，避免 call nil 报错 */
	if (isNil {missionNamespace getVariable 'ace_arsenal_fnc_openBox'}) exitWith {
		['Open',[nil,_unit,_unit]] call (missionNamespace getVariable 'BIS_fnc_arsenal');
		TRUE;
	};
	/*/ 整个打开流程在 scheduled 环境执行（0 spawn）：
	   - fn_clientArsenal 的 addVirtualItems（全量 hashmap 构建）分摊到多帧，避免 unscheduled 主线程卡顿
	   - _arsenal==3（Vanilla）时 openBox mode=TRUE 忽略虚拟物品，跳过白名单设置
	   - openBox 内部（复制 configItems/创建 display）由 CBA_fnc_directCall 在 unscheduled 执行（ACE 固有） */
	0 spawn {
		scriptName 'QS - ACE Arsenal Open';
		if ((missionNamespace getVariable ['QS_missionConfig_Arsenal',0]) isNotEqualTo 3) then {
			[player] call (missionNamespace getVariable 'QS_fnc_clientArsenal');
		};
		if ((missionNamespace getVariable ['QS_missionConfig_Arsenal',0]) isEqualTo 3) then {
			[player, player, TRUE] call (missionNamespace getVariable 'ace_arsenal_fnc_openBox');
		} else {
			[player, player] call (missionNamespace getVariable 'ace_arsenal_fnc_openBox');
		};
		/*/ 关闭检测：display 出现后等待关闭，触发装备保存 */
		_t = diag_tickTime + 10;
		waitUntil { ((!(isNull (findDisplay 1127001))) || {(diag_tickTime > _t)}) };
		if (isNull (findDisplay 1127001)) exitWith {};
		waitUntil { isNull (findDisplay 1127001) };
		call (missionNamespace getVariable 'QS_fnc_clientEventArsenalClosed');
	};
	TRUE;
};
if ((missionNamespace getVariable ['QS_missionConfig_Arsenal',0]) isEqualTo 3) then {
	if (_unit isNotEqualTo player) then {
		[_unit] call (missionNamespace getVariable 'QS_fnc_clientArsenal');
	};
	missionNamespace setVariable ['BIS_fnc_arsenal_target',_unit,FALSE];
	['Open',TRUE] call (missionNamespace getVariable 'BIS_fnc_arsenal');
} else {
	['Open',[nil,_unit,_unit]] call (missionNamespace getVariable 'BIS_fnc_arsenal');
};
TRUE;