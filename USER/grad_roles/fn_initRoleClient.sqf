
[{

	private _code = player getVariable ["GRAD_cfgCustomRoles_code", ""];
	private _spawnPos = player getVariable ["GRAD_cfgCustomRoles_spawnPos", [0,0,0]];

	player setPos _spawnPos;
	player call compile _code;

	private _playerIndex = player getVariable ["GRAD_cfgCustomRoles_playerIndex", ceil random 30];

	if (side player == west) then {
		private _emptyPosition = [player, 1.5, 5, 2, 0, 20, 0] call BIS_fnc_findSafePos;
		[_emptyPosition, player] call grad_roles_fnc_spawnObjects;
	};

	[player] call grad_roles_fnc_createMarkerSpawn;


}, [], 3] call CBA_fnc_waitAndExecute;
