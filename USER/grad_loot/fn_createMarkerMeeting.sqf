params ["_player"];

private _meetingPoint = _player getVariable ["grad_loot_meetingPoint", [0,0,0]];

private _markerstr = createMarkerLocal [format ["mrk_meeting_%1_%2", _meetingPoint, _meetingPoint], _meetingPoint];
_markerstr setMarkerShapeLocal "ICON";
_markerstr setMarkerTypeLocal "hd_join";
_markerstr setMarkerColorLocal [1,0,0,1];

private _time = [dayTime + 0.33, "HH:MM"] call BIS_fnc_timeToString;
_markerstr setMarkerTextLocal "Resistance Meeting";