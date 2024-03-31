params ["_unit"];

if (isNull _unit) then {
	_unit = player;
};

[{
	params ["_unit"];

	private _code = _unit getVariable ["GRAD_cfgCustomRoles_code", ""];
	private _spawnPos = _unit getVariable ["GRAD_cfgCustomRoles_spawnPos", [0,0,0]];

	_unit setPos _spawnPos;
	_unit call compile _code;

	private _playerIndex = _unit getVariable ["GRAD_cfgCustomRoles_playerIndex", ceil random 30];

	if (side _unit == west) then {
		private _emptyPosition = [_unit, 1.5, 5, 2, 0, 20, 0] call BIS_fnc_findSafePos;
		[_emptyPosition, _unit] call grad_roles_fnc_spawnObjects;
	};

	[_unit] call grad_roles_fnc_createMarkerSpawn;

	[_unit] call GRAD_roles_fnc_unitSetLoadout;


}, [_unit], 3] call CBA_fnc_waitAndExecute;
