private _homePhones = missionNameSpace getVariable ["GRAD_HOME_PHONES", []];
private _playerCount = count allPlayers;
private _segmentSize = _playerCount / 3;

{
    private _unit = _x;
    private _startIndex = 0;
    private _endIndex = 0;
	private _segment = 0;

	if (side _unit == west) then {

		// Determine segment boundaries
		if (_foreachindex < _segmentSize) then {
			// First segment
			_startIndex = 0;
			_endIndex = _segmentSize;
			_segment = 0;
		} else {
			if (_foreachindex < _segmentSize * 2) then {
				// Second segment
				_startIndex = _segmentSize;
				_endIndex = _segmentSize * 2;
				_segment = 1;
			} else {
				// Third segment
				_startIndex = _segmentSize * 2;
				_endIndex = _playerCount;
				_segment = 2;
			};
		};
		_unit setVariable ["GRAD_roles_segment", _segment, true];

		// Get the home phone of the unit
		private _homePhone = _unit getVariable ["GRAD_telephone_homePhone", objNull];
		// Assign phone numbers to the unit
		if (!isNull _homePhone) then {
			for "_i" from _startIndex to (_endIndex - 1) do {
				private _phone = _homePhones select _i;
				if (_phone != _homePhone) then {
					[_unit, _phone] call grad_telephone_fnc_addToPhonebook; 
				};
			};
		};
	} else {
		// emergency doc segment
		_unit setVariable ["GRAD_roles_segment", 3, true];
	};
} forEach (playableUnits + switchableUnits);




// divide into player groups
/*
{
	private _unit = _x;
	// first third
	if (_foreachindex < ceil(_playercount/3)) then {
		private _homePhone = _unit getVariable ["GRAD_telephone_homePhone", objNull];
		if (!isNull _homePhone) then {
			for "_i" from _foreachindex to ceil(_playercount/3) do {
				private _phone = _homePhones select _i;
				if (_phone != _homePhone) then {
					[_unit, _phone] call grad_telephone_fnc_addToPhonebook; 
				};
			};
		};
	} else {
		// second third
		if (_foreachindex < ceil(_playercount/3*2)) then {
			for "_i" from _foreachindex to ceil(_playercount/3) do {
				private _phone = _homePhones select _i;
				if (_phone != _homePhone) then {
					[_unit, _phone] call grad_telephone_fnc_addToPhonebook; 
				};
			};
		} else {
			// rest
			for "_i" from _foreachindex to ceil(_playercount/3) do {
				private _phone = _homePhones select _i;
				if (_phone != _homePhone) then {
					[_unit, _phone] call grad_telephone_fnc_addToPhonebook; 
				};
			};
		};
	};
} forEach (playableUnits + switchableUnits);
*/