/*/
File: fn_eventOnUserSelectedPlayer.sqf
Author:
	
	Quiksilver
	
Last Modified:

	29/01/2024 A3 2.16 by Quiksilver
	
Description:

	Executes assigned code after player object is selected for user to take over control, 
	the ownership information is broadcast and request to sync is made but the object is still owned by previous owner for a short time.

	https://community.bistudio.com/wiki/getUserInfo

	//[playerID, owner, playerUID, soldierName, displayName, steamProfileName, 
	//clientStateNumber, isHeadless, adminState, networkInfo, playerObject]
______________________________________________________/*/

params ['_nID','_player','_tries'];
/*/ 修复 1.5.8 Dev bug：isNil 括号表达式改 code block 形式（对 hashmap get 的 Object 结果直接 isNil 报类型错误） */
private _puid = _nID getUserInfo 2;
if (!(isNil {QS_hashmap_playerList get _puid})) exitWith {
	// Player already ingame
	QS_hashmap_playerList set [_puid,_player];
};
// New joining player
QS_hashmap_playerList set [_puid,_player,TRUE];
/*/ 修复 1.5.8 Dev bug：perFrameQueue 参数格式应为 [sync, actual_args]；
   actual_args 为 fn_initPlayerServer 5 参数格式（恢复 1.5.7 后），
   1.5.8 Dev 误将 getUserInfo 11 元素数组作为 _args（fn_perFrameExec 的 _args#0 类型错误）。
   注：fn_perFrameExec 的 isFinal 检查（initPlayerServer 未标记 final）会静默禁用本路径，
   玩家初始化由 fn_initClientLocal case 0 驱动，勿将 initPlayerServer 标记 final 以免双触发。 */
if (local _player) then {
	_player addEventHandler [
		'Local',
		{
			params ['_player'];
			_player removeEventHandler [_thisEvent,_thisEventHandler];
			[[FALSE,[_player,FALSE,(owner _player),(getPlayerUID _player),(name _player)]],'qs_fnc_initplayerserver'] call QS_fnc_perFrameQueue;
		}
	];
} else {
	[[FALSE,[_player,FALSE,(owner _player),(getPlayerUID _player),(name _player)]],'qs_fnc_initplayerserver'] call QS_fnc_perFrameQueue;
};