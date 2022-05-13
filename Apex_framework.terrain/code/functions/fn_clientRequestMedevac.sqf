/*/
File: fn_clientRequestMedevac.sqf
Author:
	
	Quiksilver
	
Last Modified:

	22/10/2017 A3 1.76 by Quiksilver

Description:

	Client Medevac Request
__________________________________________________________/*/

closeDialog 2;
0 spawn {
	uiSleep 0.05;
	_textBody = '- 确认呼叫医疗撤离将在10分钟内禁止你复活。<br/>- 同时作战救生衣员无法治疗你。<br/>- 唯一的选择是在你失血过多死亡之前，队友将你送回基地医疗设施。';
	_textHeader = '医疗撤离提醒 (请仔细阅读)';
	_textOk = '确认';
	_textCancel = '取消';
	private _result = [_textBody,_textHeader,_textOk,_textCancel,(findDisplay 46),FALSE,FALSE] call (missionNamespace getVariable 'BIS_fnc_guiMessage'); 
	if (_result) then {
		if ((!(missionNamespace getVariable ['QS_dynTask_medevac_inProgress',TRUE])) && ((lifeState player) isEqualTo 'INCAPACITATED') && (isNull (objectParent player)) && (isNull (attachedTo player))) then {
			{
				player setVariable _x;
			} forEach [
				['QS_client_medevacRequested',TRUE,FALSE],
				['QS_client_lastMedevacRequest',(diag_tickTime + 60),FALSE],
				['QS_revive_disable',TRUE,TRUE],
				['QS_respawn_disable',(diag_tickTime + 600),FALSE]
			];
			50 cutText ['医疗撤离已请求','PLAIN DOWN',0.5];
			['systemChat',(format ['%1 在坐标 %2 呼叫了医疗撤离',profileName,(mapGridPosition player)])] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
			[77,'MEDEVAC',[player,profileName]] remoteExec ['QS_fnc_remoteExec',2,FALSE];
		} else {
			50 cutText ['无法呼叫医疗撤离','PLAIN DOWN',0.5];
		};
	} else {
		50 cutText ['已取消呼叫医疗撤离','PLAIN DOWN',0.5];
	};
};