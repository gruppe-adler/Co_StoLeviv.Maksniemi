params ["_player"];


private _role = selectRandom ["tailor", "tankcrew"]; // todo set from server
_player setVariable ["GRAD_loot_customRole", _role];

private _role = _player getVariable ["GRAD_loot_customRole", "none"];

