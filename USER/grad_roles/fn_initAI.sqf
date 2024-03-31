params ["_unit"];

private _roles = missionConfigFile >> "cfgCustomRoles";
private _playerRole = _unit getVariable ["GRAD_cfgCustomRoles_displayName", "none"];

private _uniform = getArray(_roles >> _playerRole >> "uniform");
_unit addUniform selectRandom _uniform;

private _headgear = getArray(_roles >> _playerRole >> "headgear");
_unit addHeadgear selectRandom _headgear;

removeVest _unit;
_unit unassignItem "NVGoggles";
_unit removeItem "NVGoggles";
removeAllItems _unit;
_unit addItem "ItemCompass";
_unit addItem "ItemMap";
_unit addItem "ItemWatch";

removeAllWeapons _unit;

// exclude zeus here :P
if (_playerRole != "none") then {
	private _initFile = compile format ["grad_roles_fnc_init%1", _playerRole];
	[_unit] call _initFile;
};