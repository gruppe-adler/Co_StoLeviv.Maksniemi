params ["_object"];

private _loot = _object getVariable ["GRAD_loot", []];

[_loot, getPosATL _object, 1, false, true] call grad_loot_fnc_createLoot;
