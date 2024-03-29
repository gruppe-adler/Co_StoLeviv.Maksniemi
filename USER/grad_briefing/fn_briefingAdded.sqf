params ["_text", ["_private", false]];

private _time = [dayTime, "HH:MM"] call BIS_fnc_timeToString;

if (_private) then {
	private _dynamicIntelPrivate = player getVariable ["GRAD_dynamicIntelPrivate", []];
	_dynamicIntelPrivate pushBackUnique [_time, _text];
	player setVariable ["GRAD_dynamicIntelPrivate", _dynamicIntelPrivate, true];

	["Intel added to your PRIVATE briefing (self interact)", 1.5] call CBA_fnc_notify;
} else {
	private _dynamicIntelPublic = player getVariable ["GRAD_dynamicIntelPublic", []];
	_dynamicIntelPublic pushBackUnique [_time, _text];
	player setVariable ["GRAD_dynamicIntelPublic", _dynamicIntelPublic, true];

	["Intel added to your PUBLIC briefing (self interact)", 1.5] call CBA_fnc_notify;
};
