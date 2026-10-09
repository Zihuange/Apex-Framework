/*/ 
File: fn_initClientLocal.sqf 
Author:

	Quiksilver
	
Last Modified:

	19/10/2020 A3 2.00 by Quiksilver
	
Description:

	Client Initialization 
______________________________________________________/*/
if (isDedicated || !isMultiplayer || is3DEN) exitWith {};
if (!((uiNamespace getVariable ['BIS_shownChat',TRUE]) isEqualType TRUE)) exitWith {
	[
		40,
		[
			time,
			serverTime,
			(name player),
			profileName,
			profileNameSteam,
			(getPlayerUID player),
			2,
			(format ['Anti-Hack * BIS_shownChat : %1',(uiNamespace getVariable 'BIS_shownChat'),2]),
			player,
			productVersion
		]
	] remoteExec ['QS_fnc_remoteExec',2,FALSE];
	//disableUserInput TRUE;
	endMission 'QS_RD_end_2';
};
if (!(hasInterface)) exitWith {
	0 spawn (missionNamespace getVariable 'QS_fnc_hcCore');
	0 spawn (missionNamespace getVariable 'QS_fnc_AI');
};
/*/=========================== ACE3 Medical Integration =====================*/
/*/ 在客户端 preInit 独立执行，不干预 fn_initPlayerLocal 玩家初始化链 */
if (!isNil {missionNamespace getVariable 'QS_fnc_aceMedicalInit'}) then {
	0 spawn (missionNamespace getVariable 'QS_fnc_aceMedicalInit');
};
/*/=========================== 玩家服务器注册（case 0 发送） =====================*/
/*/ 1.5.8 Dev（379fec6）移除了本段 case 0 发送，且 onPlayerConnected 仅处理 HC，    */
/*/ 导致服务器端 fn_initPlayerServer 无触发入口，玩家初始化链断裂                   */
/*/ （欢迎页面 / 角色选择界面不出现）。此处恢复 1.5.7 机制。                         */
if (hasInterface) then {
	0 spawn {
		scriptName 'QS - Client Player Registration';
		player setVehiclePosition [(getPosWorld player),[],0,'NONE'];
		waitUntil {
			(!(isNull (findDisplay 46)))
		};
		if (isMultiplayer) then {
			50 cutText [localize 'STR_QS_Text_213','BLACK OUT',0.1,TRUE];
		};
		private _count = 1;
		_limit = 4;
		_didJIP = didJIP;
		_clientowner = clientOwner;
		_puid = getPlayerUID player;
		for '_x' from 0 to 1 step 0 do {
			[0,player,_didJIP,_clientowner,_puid,profileName] remoteExec ['QS_fnc_remoteExec',2,FALSE];
			uiSleep 10;
			if (!isNil {player getVariable 'QS_5551212'}) exitWith {};
			_count = _count + 1;
			if (_count > _limit) exitWith {
				if (userInputDisabled) then {
					disableUserInput FALSE;
				};
				endMission 'QS_RD_end_2';
			};
			if ((getOxygenRemaining player) isNotEqualTo 1) then {
				player setOxygenRemaining 1;
			};
		};
	};
};