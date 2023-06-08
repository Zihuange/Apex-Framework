/*/
File: fn_getAIMotorPool.sqf
Author:

	Quiksilver
	
Last Modified:

	13/12/2022 A3 2.10 by Quiksilver
	
Description:

	AI Motor Pool
__________________________________________________/*/

params ['_case'];
private _return = [];
_allPlayersCount = count allPlayers;
_p_0 = 0.0;
_p_1 = 1.0;
_p_2 = 2.0;
_p_3 = 3.0;
_p_4 = 4.0;
private _tank_modifier = (missionNamespace getVariable ['QS_AI_targetsKnowledge_threat_armor',1]) max 1;
private _air_modifier = (missionNamespace getVariable ['QS_AI_targetsKnowledge_threat_air',0.5]) max 0.5;
if (_case isEqualTo -1) exitWith {
	// All armed
	[
		'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
		'vn_o_armor_type63_01',_tank_modifier * _p_1,
		'vn_o_wheeled_btr40_mg_02',_p_1,
		'vn_o_wheeled_btr40_mg_01',_p_1,
		'vn_o_wheeled_btr40_mg_03',_p_1,
		'vn_o_wheeled_z157_mg_01',_p_1,
		'vn_o_wheeled_z157_mg_02',_p_1
	]
};
if (_case isEqualTo 0) exitWith {
	// Classic AO - armed
	_return = [
		'vn_o_armor_m41_01',((_tank_modifier * _p_0) min 0.1),
		'vn_o_armor_type63_01',_tank_modifier * _p_1,
		'vn_o_wheeled_btr40_mg_02',_p_1,
		'vn_o_wheeled_btr40_mg_01',_p_1,
		'vn_o_wheeled_btr40_mg_03',_p_1,
		'vn_o_wheeled_z157_mg_01',_p_1,
		'vn_o_wheeled_z157_mg_02',_p_1
	];
	if (_allPlayersCount > 10) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_1,
			'vn_o_wheeled_btr40_mg_01',_p_1,
			'vn_o_wheeled_btr40_mg_03',_p_1,
			'vn_o_wheeled_z157_mg_01',_p_2,
			'vn_o_wheeled_z157_mg_02',_p_2
		];
	};
	if (_allPlayersCount > 20) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_2,
			'vn_o_wheeled_z157_mg_02',_p_2
		];
	};
	if (_allPlayersCount > 30) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	if (_allPlayersCount > 40) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_2) * 0.75) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_2,
			'vn_o_wheeled_btr40_mg_02',_p_3,
			'vn_o_wheeled_btr40_mg_01',_p_3,
			'vn_o_wheeled_btr40_mg_03',_p_3,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		]
	};
	_return;
};
if (_case isEqualTo 1) exitWith {
	// SC AO - armed
	_return = [
		'vn_o_armor_m41_01',((_tank_modifier * _p_0) min 0.1),
		'vn_o_armor_type63_01',_tank_modifier * _p_1,
		'vn_o_wheeled_btr40_mg_02',_p_1,
		'vn_o_wheeled_btr40_mg_01',_p_1,
		'vn_o_wheeled_btr40_mg_03',_p_1,
		'vn_o_wheeled_z157_mg_01',_p_1,
		'vn_o_wheeled_z157_mg_02',_p_1
	];
	if (_allPlayersCount > 10) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_1,
			'vn_o_wheeled_btr40_mg_01',_p_1,
			'vn_o_wheeled_btr40_mg_03',_p_1,
			'vn_o_wheeled_z157_mg_01',_p_2,
			'vn_o_wheeled_z157_mg_02',_p_2
		];
	};
	if (_allPlayersCount > 20) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_2,
			'vn_o_wheeled_z157_mg_02',_p_2
		];
	};
	if (_allPlayersCount > 30) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	if (_allPlayersCount > 40) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_2) * 0.75) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_2,
			'vn_o_wheeled_btr40_mg_02',_p_3,
			'vn_o_wheeled_btr40_mg_01',_p_3,
			'vn_o_wheeled_btr40_mg_03',_p_3,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	_return;
};
if (_case isEqualTo 2) exitWith {
	// Side mission general
	_return = [
		'vn_o_armor_m41_01',((_tank_modifier * _p_0) min 0.1),
		'vn_o_armor_type63_01',_tank_modifier * _p_1,
		'vn_o_wheeled_btr40_mg_02',_p_1,
		'vn_o_wheeled_btr40_mg_01',_p_1,
		'vn_o_wheeled_btr40_mg_03',_p_1,
		'vn_o_wheeled_z157_mg_01',_p_1,
		'vn_o_wheeled_z157_mg_02',_p_1
	];
	if (_allPlayersCount > 10) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_1,
			'vn_o_wheeled_btr40_mg_01',_p_1,
			'vn_o_wheeled_btr40_mg_03',_p_1,
			'vn_o_wheeled_z157_mg_01',_p_2,
			'vn_o_wheeled_z157_mg_02',_p_2
		];
	};
	if (_allPlayersCount > 20) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_2,
			'vn_o_wheeled_z157_mg_02',_p_2
		];
	};
	if (_allPlayersCount > 30) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	if (_allPlayersCount > 40) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_2) * 0.75) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_2,
			'vn_o_wheeled_btr40_mg_02',_p_3,
			'vn_o_wheeled_btr40_mg_01',_p_3,
			'vn_o_wheeled_btr40_mg_03',_p_3,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	_return;
};
if (_case isEqualTo 3) exitWith {
	_return = [
		'vn_o_armor_m41_01',((_tank_modifier * _p_0) min 0.1),
		'vn_o_armor_type63_01',_tank_modifier * _p_1,
		'vn_o_wheeled_btr40_mg_02',_p_1,
		'vn_o_wheeled_btr40_mg_01',_p_1,
		'vn_o_wheeled_btr40_mg_03',_p_1,
		'vn_o_wheeled_z157_mg_01',_p_1,
		'vn_o_wheeled_z157_mg_02',_p_1
	];
	if (_allPlayersCount > 10) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_1,
			'vn_o_wheeled_btr40_mg_01',_p_1,
			'vn_o_wheeled_btr40_mg_03',_p_1,
			'vn_o_wheeled_z157_mg_01',_p_2,
			'vn_o_wheeled_z157_mg_02',_p_2
		];
	};
	if (_allPlayersCount > 20) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_2,
			'vn_o_wheeled_z157_mg_02',_p_2
		];
	};
	if (_allPlayersCount > 30) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_1) * 0.5) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	if (_allPlayersCount > 40) then {
		_return = [
			'vn_o_armor_m41_01',(((_tank_modifier * _p_2) * 0.75) min 0.1),
			'vn_o_armor_type63_01',_tank_modifier * _p_2,
			'vn_o_wheeled_btr40_mg_02',_p_3,
			'vn_o_wheeled_btr40_mg_01',_p_3,
			'vn_o_wheeled_btr40_mg_03',_p_3,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	_return;
};
if (_case isEqualTo 4) exitWith {
	// Grid/Insurgency AOs
	[
		'vn_o_armor_type63_01',_tank_modifier * _p_1,
		'vn_o_wheeled_btr40_mg_02',_p_2,
		'vn_o_wheeled_btr40_mg_01',_p_2,
		'vn_o_wheeled_btr40_mg_03',_p_2,
		'vn_o_wheeled_z157_mg_01',_p_2,
		'vn_o_wheeled_z157_mg_02',_p_2
	]
};
if (_case isEqualTo 5) exitWith {
	// Ambient Hostility - low target knowledge
	[
		'vn_o_armor_m41_01',0,
		'vn_o_armor_type63_01',0.1,
		'vn_o_wheeled_btr40_mg_02',1,
		'vn_o_wheeled_btr40_mg_01',1,
		'vn_o_wheeled_btr40_mg_03',1,
		'vn_o_wheeled_z157_mg_01',1,
		'vn_o_wheeled_z157_mg_02',1
	]
};
if (_case isEqualTo 6) exitWith {
	// Ambient Hostility - higher target knowledge
	[
		'vn_o_armor_m41_01',0,
		'vn_o_armor_type63_01',0.1,
		'vn_o_wheeled_btr40_mg_02',_p_1,
		'vn_o_wheeled_btr40_mg_01',_p_1,
		'vn_o_wheeled_btr40_mg_03',_p_1,
		'vn_o_wheeled_z157_mg_01',_p_1,
		'vn_o_wheeled_z157_mg_02',_p_1
	]
};
if (_case isEqualTo 7) exitWith {
	// Classic AO - armed
	_return = [
		'vn_o_armor_m41_01',_tank_modifier * _p_0,
		'vn_o_armor_type63_01',_tank_modifier * _p_1,
		'vn_o_wheeled_btr40_mg_02',_p_2,
		'vn_o_wheeled_btr40_mg_01',_p_2,
		'vn_o_wheeled_btr40_mg_03',_p_2,
		'vn_o_wheeled_z157_mg_01',_p_3,
		'vn_o_wheeled_z157_mg_02',_p_3
	];
	if (_allPlayersCount > 10) then {
		_return = [		
			'vn_o_armor_m41_01',((_tank_modifier * _p_1) * 0.5),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	if (_allPlayersCount > 20) then {
		_return = [
			'vn_o_armor_m41_01',((_tank_modifier * _p_1) * 0.5),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_2,
			'vn_o_wheeled_btr40_mg_01',_p_2,
			'vn_o_wheeled_btr40_mg_03',_p_2,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	if (_allPlayersCount > 30) then {
		_return = [
			'vn_o_armor_m41_01',((_tank_modifier * _p_1) * 0.75),
			'vn_o_armor_type63_01',_tank_modifier * _p_1,
			'vn_o_wheeled_btr40_mg_02',_p_3,
			'vn_o_wheeled_btr40_mg_01',_p_3,
			'vn_o_wheeled_btr40_mg_03',_p_3,
			'vn_o_wheeled_z157_mg_01',_p_2,
			'vn_o_wheeled_z157_mg_02',_p_2
		];
	};
	if (_allPlayersCount > 40) then {
		_return = [
			'vn_o_armor_m41_01',((_tank_modifier * _p_2) * 0.5),
			'vn_o_armor_type63_01',_tank_modifier * _p_2,
			'vn_o_wheeled_btr40_mg_02',_p_4,
			'vn_o_wheeled_btr40_mg_01',_p_4,
			'vn_o_wheeled_btr40_mg_03',_p_4,
			'vn_o_wheeled_z157_mg_01',_p_3,
			'vn_o_wheeled_z157_mg_02',_p_3
		];
	};
	_return;
};
if (_case isEqualTo 8) exitWith {
	[
		'vn_o_armor_m41_01',0,
		'vn_o_armor_type63_01',0,
		'vn_o_wheeled_btr40_mg_02',1,
		'vn_o_wheeled_btr40_mg_01',1,
		'vn_o_wheeled_btr40_mg_03',1,
		'vn_o_wheeled_z157_mg_01',1,
		'vn_o_wheeled_z157_mg_02',1
	]
};
_return;