if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_player", "_isPrivate", "_briefingArr"];

while { missionNamespace getVariable ["GRAD_briefingTableActive", false] } do {
	sleep (random 0.5);
};

missionNamespace setVariable ["GRAD_briefingTableActive", true];

private _briefingTable = missionNamespace getVariable ["GRAD_briefingTable", createHashMap];
private _id = getPlayerUID _player;

// Table entries consist of arrays that look like this: [privateBriefing, publicBriefing]
private _entry = _briefingTable getOrDefault [_id, [[], []]];
if (_isPrivate) then {
	_entry set [0, _briefingArr];
} else {
	_entry set [1, _briefingArr];
};

_briefingTable set [_id, _entry];
missionNamespace setVariable ["GRAD_briefingTable", _briefingTable];

missionNamespace setVariable ["GRAD_briefingTableActive", false];