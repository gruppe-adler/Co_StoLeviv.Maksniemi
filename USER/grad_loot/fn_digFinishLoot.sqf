params ["_tombstone"];

private _tombstoneNetId = (_tombstone call BIS_fnc_netId);
private _data = (missionNameSpace getVariable "grad_loot_tombstoneHashes") getOrDefault [_tombstoneNetId, []];
if (count _data < 1) exitWith {}; // on mission start

_data params ["_name", "_deathdate", "_epitaph", "_loot"];

[_loot, getPosATL _tombstone, 1, false, true] call grad_loot_fnc_createLoot;
