
private _code = player getVariable ["GRAD_cfgRoles_code", ""];
private _spawnPos =player getVariable ["GRAD_cfgRoles_spawnPos", [0,0,0]];

player setPos _spawnPos;
player call compile _code;
