/*
File: fn_clientMenuVTexture.sqf
Author:
	
	Quiksilver
	
Last Modified:

	13/06/2018 A3 1.82 by Quiksilver

Description:

	Cliet Menu Vehicle Textures
__________________________________________________________*/

disableSerialization;
private [
	'_supporterLevel','_list','_supporterAccess','_displayName','_texture','_index','_v','_vehicleTypes','_textureSample','_textureSample','_nearSite','_idc','_author'
];
params ['_type','_display'];
_supporterLevel = [] call (missionNamespace getVariable 'QS_fnc_clientGetSupporterLevel');
_list = [] call (missionNamespace getVariable 'QS_VTextures');
if (_type isEqualTo 'onLoad') then {
	(findDisplay 2000) closeDisplay 1;
	(findDisplay 3000) closeDisplay 1;
	setMousePosition (uiNamespace getVariable ['QS_ui_mousePosition',getMousePosition]);
	_v = vehicle player;
	_idc = 1804;
	{
		_supporterAccess = _x # 0;
		_displayName = _x # 1;
		_textureSample = ((_x # 2) # 0) # 1;
		_toolTip = _x # 3;
		_vehicleTypes = _x # 4;
		_author = _x # 5;
		lbAdd [_idc,_displayName];
		lbSetPicture [_idc,_forEachIndex,_textureSample];
		lbSetTooltip [_idc,_forEachIndex,_toolTip];
		lbSetPictureRight [_idc,_forEachIndex,(getText (configFile >> 'CfgVehicles' >> (_vehicleTypes # 0) >> 'icon'))];
		if (_supporterAccess > _supporterLevel) then {
			lbSetColor [_idc,_forEachIndex,[0.5,0.5,0.5,0.5]];
			lbSetPictureColor [_idc,_forEachIndex,[0.5,0.5,0.5,0.5]];
			lbSetPictureColorSelected [_idc,_forEachIndex,[0.5,0.5,0.5,0.5]];
		};
		if (_forEachIndex isNotEqualTo 0) then {
			if (!((typeOf _v) in _vehicleTypes)) then {
				lbSetColor [_idc,_forEachIndex,[0.5,0.5,0.5,0.5]];
				lbSetPictureColor [_idc,_forEachIndex,[0.5,0.5,0.5,0.5]];
				lbSetPictureColorSelected [_idc,_forEachIndex,[0.5,0.5,0.5,0.5]];		
			};
		};
	} forEach _list;
	lbSetCurSel [_idc,0];
};
private _text = '';
if (_type isEqualTo 'Select') then {
	_v = vehicle player;
	_index = lbCurSel 1804;
	if (_index isNotEqualTo -1) then {
		_supporterAccess = (_list # _index) # 0;
		_displayName = (_list # _index) # 1;
		_textures = (_list # _index) # 2;
		_toolTip = (_list # _index) # 3;
		_vehicleTypes = (_list # _index) # 4;
		_author = (_list # _index) # 5;
		if (_index isEqualTo 0) then {
			if (!isNil {player getVariable 'QS_ClientVTexture'}) then {
				if (!isNull ((player getVariable 'QS_ClientVTexture') # 0)) then {
					_v = (player getVariable 'QS_ClientVTexture') # 0;
					if ((typeOf _v) in ['I_MRAP_03_F','I_MRAP_03_hmg_F','I_MRAP_03_gmg_F']) then {
						_v setObjectTextureGlobal [0,'\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa'];
						_v setObjectTextureGlobal [1,'\A3\data_f\vehicles\turret_co.paa'];
					} else {
						{
							_v setObjectTextureGlobal [_forEachIndex,_x];
						} forEach (getArray (configFile >> 'CfgVehicles' >> (typeOf _v) >> 'hiddenSelectionsTextures'));
					};
					_v setVariable ['QS_ClientVTexture_owner',nil,TRUE];
				};
			};
			player setVariable ['QS_ClientVTexture',[objNull,(getPlayerUID player),[],(time + 5)],TRUE];
			(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,7.5,-1,'载具皮肤已重置，现在你可以为另一个载具选择皮肤了。 同时只能为一个载具设置皮肤！',[],-1,TRUE,'Vehicle Skin',TRUE];
		} else {
			if (_supporterAccess <= _supporterLevel) then {
				if ((typeOf _v) in _vehicleTypes) then {
					if (player isEqualTo (effectiveCommander _v)) then {
						if ((isNull ((player getVariable 'QS_ClientVTexture') # 0)) || {(_v isEqualTo ((player getVariable 'QS_ClientVTexture') # 0))} || {(!alive ((player getVariable 'QS_ClientVTexture') # 0))}) then {
							_nearSite = FALSE;
							if ((player distance (markerPos 'QS_marker_base_marker')) < 500) then {
								_nearSite = TRUE;
							};
							/*/
							{
								if ((player distance (markerPos _x)) < 50) exitWith {
									_nearSite = TRUE;
								};
							} count (missionNamespace getVariable 'QS_veh_repair_mkrs');
							/*/
							if (_nearSite) then {
								if (time > ((player getVariable 'QS_ClientVTexture') # 3)) then {
									{
										_v setObjectTextureGlobal _x;
									} forEach _textures;
									player setVariable ['QS_ClientVTexture',[_v,(getPlayerUID player),(getObjectTextures _v),(time + 2)],TRUE];
									_v setVariable ['QS_ClientVTexture_owner',(getPlayerUID player),TRUE];
									_text = format ['载具皮肤已设置为：%1<br/>作者：%2',_displayName,_author];
									(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,7.5,-1,_text,[],-1,TRUE,'Vehicle Skin',FALSE];
								} else {
									(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,7.5,-1,'请稍等……每次载具皮肤设置必须间隔至少2秒！',[],-1,TRUE,'Vehicle Skin',FALSE];
								};
							} else {
								(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,7.5,-1,'你必须在基地范围内选择载具皮肤！',[],-1,TRUE,'Vehicle Skin',FALSE];
							};
						} else {
							_text = format ['你已经给在坐标 %2 的 %1 设置了皮肤',(getText (configFile >> 'CfgVehicles' >> (typeOf ((player getVariable 'QS_ClientVTexture') # 0)) >> 'displayName')),(mapGridPosition (getPosWorld ((player getVariable 'QS_ClientVTexture') # 0)))];
							(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,10,-1,_text,[],-1,TRUE,'Vehicle Skin',FALSE];
						};
					} else {
						(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,7.5,-1,'你必须是载具的驾驶员/指挥官/拥有者',[],-1,TRUE,'Vehicle Skin',FALSE];
					};
				} else {
					(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,12,-1,'所选皮肤与载具种类无匹配，无法加载皮肤！',[],-1,TRUE,'Vehicle Skin',TRUE];
				};
			} else {
				_text = format ['Supporter level required: %1<br/>Your supporter level: %2<br/>Vehicle Texture not set.',_supporterAccess,_supporterLevel];
				(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,12,-1,_text,[],-1,TRUE,'Vehicle Skin',FALSE];
			};
		};
	};
};

if (_type isEqualTo 'Back') then {
	closeDialog 2;
	0 spawn {
		uiSleep 0.1;
		waitUntil {
			closeDialog 2;
			(!dialog)
		};
		createDialog 'QS_RD_client_dialog_menu_supporters';
	};
};

if (_type isEqualTo 'onUnload') then {
	uiNamespace setVariable ['QS_ui_mousePosition',getMousePosition];
};