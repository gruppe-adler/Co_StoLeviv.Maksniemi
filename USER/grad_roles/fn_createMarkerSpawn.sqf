params ["_player"];

private _homePos = _player getVariable ["GRAD_cfgCustomRoles_spawnPos", [0,0,0]];

private _markerstr = createMarkerLocal [format ["mrk_home_%1_%2", _homePos, _homePos], _homePos];
_markerstr setMarkerShapeLocal "ICON";
_markerstr setMarkerTypeLocal "hd_start";
_markerstr setMarkerColorLocal [0,0,0,1];

_markerstr setMarkerTextLocal " Home";