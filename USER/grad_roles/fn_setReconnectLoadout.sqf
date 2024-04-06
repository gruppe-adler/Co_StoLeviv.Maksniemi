if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_player"];

private _loadoutTable = missionNamespace getVariable ["GRAD_loadoutTable", createHashMap];
private _id = getPlayerUID _player;
private _entry = _loadoutTable getOrDefault [_id, []];

// player reconnects without ever having changed loadout
if (_entry isEqualTo []) exitWith {
	[_player] remoteExec ["GRAD_roles_fnc_unitSetLoadout", _player];
};

_player setUnitLoadout _entry;