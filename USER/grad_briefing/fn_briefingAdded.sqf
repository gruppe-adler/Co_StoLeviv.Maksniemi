params ["_text", ["_private", false]];

// skip if no text was spoken
if (_text == "") exitWith {};

private _time = [dayTime, "HH:MM"] call BIS_fnc_timeToString;

if (_private) then {
	private _dynamicIntelPrivate = player getVariable ["GRAD_dynamicIntelPrivate", []];
	_dynamicIntelPrivate pushBackUnique [_time, _text];
	player setVariable ["GRAD_dynamicIntelPrivate", _dynamicIntelPrivate, true];
	[player, _private, _dynamicIntelPrivate] remoteExec ["grad_briefing_fnc_updateServerTable", 2];

	["Intel added to your PRIVATE briefing (self interact)", 1] call CBA_fnc_notify;
} else {
	private _dynamicIntelPublic = player getVariable ["GRAD_dynamicIntelPublic", []];
	_dynamicIntelPublic pushBackUnique [_time, _text];
	player setVariable ["GRAD_dynamicIntelPublic", _dynamicIntelPublic, true];
	[player, _private, _dynamicIntelPublic] remoteExec ["grad_briefing_fnc_updateServerTable", 2];

	["Intel added to your PUBLIC briefing (self interact)", 1] call CBA_fnc_notify;
};
