params ["_unit"];

private _previousMarker = _unit getVariable ["mrk_unconscious", ""];
if (_previousMarker != "") then {
	deleteMarkerLocal _previousMarker;
};
private _name = (_unit getVariable ["ACE_Name", name _unit]);
hint (_name + " rescued.");
