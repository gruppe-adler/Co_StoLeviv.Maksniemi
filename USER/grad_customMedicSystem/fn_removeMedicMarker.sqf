params ["_unit"];

private _localMedicMarkers = player getVariable ['grad_customMedicSystem_localMedicMarkers', []];

private _previousMarker = _unit getVariable ["mrk_unconscious", ""];
if (_previousMarker != "") then {
	_localMedicMarkers deleteAt (_localMedicMarkers find _previousMarker);
	player setVariable ['grad_customMedicSystem_localMedicMarkers', _localMedicMarkers];
	
	deleteMarkerLocal _previousMarker;
};
private _name = [_unit, false, false] call ace_common_fnc_getName;
(_name + " rescued.") call CBA_fnc_notify;
