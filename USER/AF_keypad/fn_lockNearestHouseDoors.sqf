params ["_position", ["_lockDoors", true]];

private _house = nearestBuilding _position;

if (isNull _house) exitWith {
	systemchat "no building close by";
};

if (_house distance2d _position > 20) exitWith {
	systemchat "no building close by";
};

if (_house getVariable ["bis_disabled_Door_1", 0] isEqualTo 1) then {
	for "_door" from 1 to getNumber (configOf _house >> "numberOfDoors") do {
		_house setVariable [format ["bis_disabled_Door_%1", _door], 0, true];

		systemchat ("locked door: " + str _foreachindex + " of " + typeof _house);
	};
};

