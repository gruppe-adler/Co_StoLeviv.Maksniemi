
[{

	private _code = player getVariable ["GRAD_cfgCustomRoles_code", ""];
	private _spawnPos = player getVariable ["GRAD_cfgCustomRoles_spawnPos", [0,0,0]];

	player setPos _spawnPos;
	player call compile _code;

	private _playerIndex = player getVariable ["GRAD_cfgCustomRoles_playerIndex", ceil random 30];
	private _identities = missionConfigFile >> "cfgIdentities";
	private _identity = _identities select _playerIndex;
	player setIdentity _identity;

	if (side player == west) then {
		private _emptyPosition = getPosASL player findEmptyPosition [0, 3, "land_gm_euro_furniture_table_02"];
		[_emptyPosition] call grad_roles_fnc_spawnObjects;
	};


}, [], 3] call CBA_fnc_waitAndExecute;
