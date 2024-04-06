params ["_object", "_text"];

if (!isServer) exitWith {
	_this remoteExec ["grad_loot_fnc_addLeaveNote", 2];
};

[{
	params ["_object", "_text"];

	[
		getPosATL _object, 
		getDir _object, 
		_text, 
		["somewhat",["cramped","EtelkaNarrowMediumPro"]]
	] call GRAD_leaveNotes_fnc_spawnNote;

	deleteVehicle _object;

}, [_object, _text], 10] call CBA_fnc_waitAndExecute;