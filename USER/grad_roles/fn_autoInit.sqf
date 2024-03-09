player addEventhandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];

	// plays alarm on empty cars once
	if (
			_vehicle getVariable ["GRAD_isNotPlayers", false] && 
			_vehicle isKindOf "Car" && 
			count crew _vehicle == 0 &&
			!(_vehicle getVariable ["GRAD_alarmPlayed", false])
		) then {
		["init", _vehicle] call BIS_fnc_carAlarm;
		_vehicle setVariable ["GRAD_alarmPlayed", true, true];
	};

	if (_vehicle isKindOf "Tank") then {
		if (_role == "driver" || _role == "gunner") then {
			if !(player getVariable ["GRAD_isTankCrew", false]) then {
				moveOut player;
				systemChat "I am not trained for this.";
			};
		};
	};
}];


player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1", "_unit2", "_vehicle"];

	{
		private _role = assignedVehicleRole _x;
		if (_role == "driver" || _role == "gunner") then {
			if !(_x getVariable ["GRAD_isTankCrew", false]) then {
				moveOut _x;
				systemChat "I am not trained for this.";
			};
		};
	} forEach [_unit1, _unit2];

}];