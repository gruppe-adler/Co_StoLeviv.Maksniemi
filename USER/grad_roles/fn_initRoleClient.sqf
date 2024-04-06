params ["_unit", ["_isReconnect", false]];

if (isNull _unit) then {
	_unit = player;
};

[{
	params ["_unit", "_isReconnect"];

	private _code = _unit getVariable ["GRAD_cfgCustomRoles_code", ""];
	private _spawnPos = _unit getVariable ["GRAD_cfgCustomRoles_spawnPos", [0,0,0]];
	private _playerRole = _unit getVariable ["GRAD_cfgCustomRoles_displayName", "none"];
	
	/*
	private _initFile = compile format ["grad_roles_fnc_init%1", _playerRole];
	[_unit] call _initFile;
	*/

	_unit setPos _spawnPos;
	_unit call compile _code;

	if (([_unit, true] call BIS_fnc_objectSide) == west) then {
		private _emptyPosition = [_unit, 1.5, 5, 2, 0, 20, 0] call BIS_fnc_findSafePos;
		if !(_isReconnect) then {
			[_emptyPosition, _unit] call grad_roles_fnc_spawnObjects;
		};
	};

	if (hasInterface) then {
		[_unit] call grad_roles_fnc_createMarkerSpawn;
	};

	[_unit] call GRAD_roles_fnc_unitSetLoadout;


}, [_unit, _isReconnect], 3] call CBA_fnc_waitAndExecute;
