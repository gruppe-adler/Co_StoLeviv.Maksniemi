if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_player"];

private _loadoutTable = missionNamespace getVariable ["GRAD_loadoutTable", createHashMap];
private _id = getPlayerUID _player;
private _entry = _loadoutTable getOrDefault [_id, []];
_player setUnitLoadout _entry;