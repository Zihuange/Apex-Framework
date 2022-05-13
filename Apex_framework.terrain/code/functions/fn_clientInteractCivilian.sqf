/*/
File: fn_clientInteractCivilian.sqf
Author:

	Quiksilver
	
Last Modified:

	13/06/2018 ArmA 3 1.82
	
Description:

	-
________________________________________________/*/

_t = cursorTarget;
private _c = FALSE;
if (isNull (objectParent _t)) then {
	if ((side _t) isEqualTo CIVILIAN) then {
		if (alive _t) then {
			if (!isNil {_t getVariable 'QS_civilian_interactable'}) then {
				if (_t getVariable 'QS_civilian_interactable') then {
					_c = TRUE;
				};
			};
		};
	};
};
if (!(_c)) exitWith {false;};
private _text = '';
_QS_interacted = _t getVariable 'QS_civilian_interacted';
if (_QS_interacted) exitWith {
	if ((random 1) > 0.5) then {
		(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,'这个平民现在并不想搭理你。',[],-1,TRUE,'Civilian',TRUE];
	} else {
		if ((random 1) > 0.5) then {
			(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,'这个平民没有什么可跟你说的了。',[],-1,TRUE,'Civilian',TRUE];
		} else {
			(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,'这个平民甚至没在听你说话，你正在浪费时间！',[],-1,TRUE,'Civilian',TRUE];
		};
	};
};
_QS_responseNeutrality = _t getVariable 'QS_civilian_neutrality';
if (_QS_responseNeutrality isEqualTo 0) then {
	_t setVariable ['QS_civilian_interacted',TRUE,TRUE];
	if ((random 1) > 0.40) then {
		if ((missionNamespace getVariable 'QS_sideMission_POW_civIntel_quality') < 3) then {
			missionNamespace setVariable ['QS_sideMission_POW_civIntel_quality',((missionNamespace getVariable 'QS_sideMission_POW_civIntel_quality') + 1),TRUE];
			if ((random 1) > 0.5) then {
				(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,'根据平民提供的情报，我们缩小了需要搜索的区域！',[],-1,TRUE,'Civilian',TRUE];
			} else {
				_text = format ['%1 提高了任务中地图标记的准确性。',name _t];
				(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,_text,[],-1,TRUE,'Civilian',TRUE];
			};
		} else {
			(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,'这个平民无法提供更多帮助了。',[],-1,TRUE,'Civilian',TRUE];
		};
	} else {
		if ((random 1) > 0.5) then {
			(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,'这个平民根本什么都不知道。',[],-1,TRUE,'Civilian',TRUE];
		} else {
			if ((random 1) > 0.5) then {
				_text = format ['%1 已经六年没说话了，您配让他开口么？',(name _t)];
				(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,_text,[],-1,TRUE,'Civilian',TRUE];
			} else {
				if ((random 1) > 0.25) then {
					(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,'平民一边嘟囔着“WDNMD”一边快速走开了。',[],-1,TRUE,'Civilian',TRUE];
				} else {
					_t setVariable ['QS_civilian_suicideBomber',TRUE,TRUE];
				};
			};
		};
	};
		
};
if (_QS_responseNeutrality isEqualTo -1) then {
	_t setVariable ['QS_civilian_interacted',TRUE,TRUE];
	if ((random 1) > 0.25) then {
		if ((random 1) > 0.5) then {
			(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,10,-1,'这个平民的家人在NATO的空袭中丧生，他并不会鸟你。',[],-1,TRUE,'Civilian',TRUE];
		} else {
			_text = format ['%1 并不想和NATO打交道，他希望你们早点离开%2。',name _t,worldName];
			(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,_text,[],-1,TRUE,'Civilian',TRUE];
		};
	} else {
		if ((random 1) > 0.5) then {
			_text = format ['%1 似乎想要向敌军透露我们的情报！',name _t];
			(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,_text,[],-1,TRUE,'Civilian',TRUE];
			_t setVariable ['QS_civilian_alertingEnemy',TRUE,TRUE];
		} else {
			(missionNamespace getVariable 'QS_managed_hints') pushBack [2,TRUE,7.5,-1,'这个平民很希望你去死！',[],-1,TRUE,'Civilian',TRUE];
		};
	};
};
true;