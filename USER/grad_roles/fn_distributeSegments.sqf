[{
	private _playerCount = (count (playableUnits + switchableUnits)) max 1;
	private _segmentSize = _playerCount / 3;
	diag_log format ["distribute segments, player count %1", _playerCount];

	{
		private _unit = _x;
		private _startIndex = 0;
		private _endIndex = 0;
		private _segment = 0;

		if (([_unit, true] call BIS_fnc_objectSide) == west) then {

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
		} else {
			// emergency doc segment
			_unit setVariable ["GRAD_roles_segment", 3, true];
		};
	} forEach (playableUnits + switchableUnits);
}, [], 5] call CBA_fnc_waitAndExecute;


// add phonebook entries of buddies
[{
	{
		private _unit = _x;
		private _segment = _unit getVariable ["GRAD_roles_segment", -1];
		// Get the home phone of the unit
		private _homePhone = _unit getVariable ["GRAD_telephone_homePhone", objNull];
		// Assign phone numbers to the unit
		if (!isNull _homePhone) then {
			{
				private _otherUnit = _x;
				private _segmentOther = _otherUnit getVariable ["GRAD_roles_segment", -1];
				if (_segmentOther == _segment && _otherUnit != _unit) then {
					private _homePhoneOther = _otherUnit getVariable ["GRAD_telephone_homePhone", objNull];
					if (!isNull _homePhoneOther) then {
						[_unit, _homePhoneOther] call grad_telephone_fnc_addToPhonebook;
					};
				};
			} forEach (playableUnits + switchableUnits);
		};
	} forEach (playableUnits + switchableUnits);
}, [], 10] call CBA_fnc_waitAndExecute;


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