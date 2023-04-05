/*/
File: fn_clientDamageModifier.sqf
Author: 

	Quiksilver
	
Last modified:

	16/09/2022 A3 2.10 by Quiksilver
	
Description:

	Player Damage Modification
___________________________________________________________________/*/

params ['_unit','','_damage','_source','','_hitPartIndex','_instigator',''];
private _return = 0.925;
if (isNull (objectParent _unit)) then {
	if (_source isEqualType objNull) then {
		if (!isNull _source) then {
			if ((isPlayer _source) || {(isPlayer _instigator)}) then {
				if (!(_unit in [_source,_instigator])) then {
					if ((side (group _instigator)) in [(_unit getVariable ['QS_unit_side',WEST]),sideEnemy]) then {
						_return = 0.05;
					};
				};
			} else {
				if ((call (missionNamespace getVariable ['QS_missionConfig_reducedDamage',{1}])) isEqualTo 1) then {
					_return = 0.333;
					if (_hitPartIndex in [-1,0,1,2,3,4,5,6,7,11]) then {
						if ((random 1) > ([0.5,0.25] select (((((_unit getVariable 'QS_client_soundControllers') # 1) # 8) # 1) isEqualTo 1))) then {
							_randomSelection = selectRandomWeighted [8,0.5,9,0.25,10,0.25];
							_hitValue = (_unit getHitIndex _randomSelection) max ((_unit getHitIndex _randomSelection) + _damage);
							_unit setHitIndex [_randomSelection,_hitValue,TRUE,_source];		// To Do: add _instigator in A3 2.12
							_return = 0.05;
						};
					};
					if (_source getVariable ['QS_AI_ignoreDamageReduction',FALSE]) then {
						_return = 1;
					};
					if (_unit getVariable ['QS_unit_ignoreDamageReduction',FALSE]) then {
						_return = 1;
					};
				};
			};
		};
	} else {
		if (
			(!isNull _instigator) &&
			{(isPlayer _instigator)} &&
			{((side (group _instigator)) in [(_unit getVariable ['QS_unit_side',WEST]),sideEnemy])}
		) then {
			_return = 0.05;
		};
	};
} else {
	if ((objectParent _unit) isKindOf 'Air') then {
		if (alive (objectParent _unit)) then {
			if ((call (missionNamespace getVariable ['QS_missionConfig_reducedDamage',{1}])) isEqualTo 1) then {
				_return = 0.333;
			};
			if (
				(_unit isEqualTo (driver (objectParent _unit))) &&
				{(!isNull _instigator)} &&
				{(isPlayer _instigator)} &&
				{(!(_unit in [_source,_instigator]))} &&
				{((side (group _instigator)) in [(_unit getVariable ['QS_unit_side',WEST]),sideEnemy])}
			) then {
				_return = 0;
			};
		};
	} else {
		if ((objectParent _unit) isKindOf 'Tank') then {
			_return = 0.333;
		};
		if ((objectParent _unit) isKindOf 'Car') then {
			if ((objectParent _unit) getVariable ['QS_vehicle_armored',FALSE]) then {
				
			};
		};
	};
};
_return;