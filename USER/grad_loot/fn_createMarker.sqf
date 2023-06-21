params ["_object", "_color"];

private _markerstr = createMarkerLocal [format ["mrk_tomb_%1_%2", _object, getPos _object], getPos _object];
_markerstr setMarkerShapeLocal "ICON";
_markerstr setMarkerTypeLocal "KIA";
_markerstr setMarkerColorLocal _color;