if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_player", "_loadout"];

while { missionNamespace getVariable ["GRAD_loadoutTableActive", false] } do {
	sleep (random 0.5);
};

missionNamespace setVariable ["GRAD_loadoutTableActive", true];

private _loadoutTable = missionNamespace getVariable ["GRAD_loadoutTable", createHashMap];
private _id = getPlayerUID _player;

_loadoutTable set [_id, getUnitLoadout player];

missionNamespace setVariable ["GRAD_loadoutTable", _loadoutTable];

missionNamespace setVariable ["GRAD_loadoutTableActive", false];