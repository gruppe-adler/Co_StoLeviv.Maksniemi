
[{

	private _code = player getVariable ["GRAD_cfgCustomRoles_code", ""];
	private _spawnPos = player getVariable ["GRAD_cfgCustomRoles_spawnPos", [0,0,0]];

	player setPos _spawnPos;
	player call compile _code;

}, [], 3] call CBA_fnc_waitAndExecute;
