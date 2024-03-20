params ["_unit"];

// local markers are needed if player changes faction to medic midplay - then all previously hidden medic markers shall become visible
private _localMedicMarkers = player getVariable ['grad_customMedicSystem_localMedicMarkers', []];

private _marker = createMarkerLocal [format ["mrk_unconscious_%1_%2", _unit, position _unit], getPos _unit];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "hd_join";
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerAlphaLocal 0;
_marker setMarkerTextLocal (_unit getVariable ["ACE_Name", name _unit]);

_localMedicMarkers pushbackUnique _marker;
player setVariable ['grad_customMedicSystem_localMedicMarkers', _localMedicMarkers];


if (player getVariable ['grad_customMedicSystem_isZeus', false] || player getVariable ['grad_customMedicSystem_isMedic', false]) then {
	_marker setMarkerAlphaLocal 1;
	hint ("Helpless person reported at " + str mapGridPosition _unit);
};

private _previousMarker = _unit getVariable ["mrk_unconscious", ""];
if (_previousMarker != "") then {
	deleteMarkerLocal _previousMarker;
};

_unit setVariable ["mrk_unconscious", _marker];