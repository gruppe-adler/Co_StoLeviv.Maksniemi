// Updates the players briefings in case of a reconnect

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_player"];

private _briefingTable = missionNamespace getVariable ["GRAD_briefingTable", createHashMap];
private _id = getPlayerUID _player;
private _entry = _briefingTable getOrDefault [_id, []];
// No entry = no briefing
if ( _entry isEqualTo [] ) exitWith {};

_entry params ["_privateBrief", "_publicBrief"];

_player setVariable ["GRAD_dynamicIntelPrivate", _privateBrief, true];
_player setVariable ["GRAD_dynamicIntelPublic", _publicBrief, true];
