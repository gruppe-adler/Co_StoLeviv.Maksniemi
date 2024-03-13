params ["_text"];

private _dynamicIntel = player getVariable ["GRAD_dynamicIntel", []];
private _time = [dayTime, "HH:MM"] call BIS_fnc_timeToString;
_dynamicIntel pushBackUnique [_time, _text];
player setVariable ["GRAD_dynamicIntel", _dynamicIntel, true];

["Intel added to your private briefing (self interact)", 1.5] call CBA_fnc_notify;