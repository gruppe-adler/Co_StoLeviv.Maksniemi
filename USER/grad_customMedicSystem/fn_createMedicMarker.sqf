params ["_unit"];

private _marker = createMarkerLocal [format ["mrk_unconscious_%1_%2", _unit, position _unit], getPos _unit];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "hd_join";
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTextLocal (_unit getVariable ["ACE_Name", name _unit]);

hint ("Helpless person reported at " + str mapGridPosition _unit);

private _previousMarker = _unit getVariable ["mrk_unconscious", ""];
if (_previousMarker != "") then {
	deleteMarkerLocal _previousMarker;
};

_unit setVariable ["mrk_unconscious", _marker];