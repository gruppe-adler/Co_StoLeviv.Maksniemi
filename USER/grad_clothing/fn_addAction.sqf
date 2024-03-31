params ["_clothesLine"];

private _action = ["Pick up new clothing", "Pick up new clothing", "", {
    
	private _clothingCount = _target getVariable ["grad_clothing_clothesLeft", 0];
	[_target, _clothingCount-1] call grad_clothing_fnc_setClothes;

	private _roles = missionConfigFile >> "cfgCustomRoles";
	private _playerRole = player getVariable ["GRAD_cfgCustomRoles_displayName", "none"];
	private _uniform = selectRandom (getArray(_roles >> _playerRole >> "uniform"));

	player addUniform _uniform;
}, {
	private _clothingCount = _target getVariable ["grad_clothing_clothesLeft", 0];
	_clothingCount > 0
}, {}, [], [0,0,1.5]] call ace_interact_menu_fnc_createAction;

[_clothesLine, 0, [], _action, true] call ace_interact_menu_fnc_addActionToObject;
