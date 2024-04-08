private _duration = 120;

// skiptime 3;
// setTimeMultiplier 1;
// skiptime -1.5;
setDate [2019,1,27,6,0]; // fix date at night

[_duration] remoteExec ["grad_intro_fnc_intro_start", 0, true];


// private _busPath = [
// 	getPos busPath_1,
// 	getPos busPath_2,
// 	getPos busPath_3,
// 	getPos busPath_4,
// 	getPos busPath_5,
// 	getPos busPath_6,
// 	getPos busPath_7,
// 	getPos busPath_8,
// 	getPos busPath_9,
// 	getPos busPath_10,
// 	getPos busPath_11,
// 	getPos busPath_12,
// 	getPos busPath_13
// ];

private _busPath = [];
for "_i" from 1 to 13 do {
	private _marker = call(compile format ["busPath_%1", _i]);
	private _entry = getPos _marker;
	_busPath pushBack _entry;
};
introBus setDriveOnPath _busPath;

[{
	params ["_bus"];
	[
		{
			params ["_bus"];
			_bus move (getPos busPath_14);
		},
		[_bus],
		5
	] call CBA_fnc_waitAndExecute;
	// if (introDude getVariable ["grad_walkCommand", false]) exitWith {};
	// introDude playActionNow "radioAnims_Ear";
	private _newDudeActual = (createGroup civilian) createUnit ["C_Man_1", position introStep_1, [], 0, "CAN_COLLIDE"];
	_newDudeActual setUnitLoadout [[],[],[],["UK3CB_U_KZS_UP_KHK",[]],[],[],"","",[],["","","","","ItemWatch",""]];
	_newDudeActual allowDamage false;

	private _steps = [
		getPos introStep_2,
		getPos introStep_3,
		getPos introStep_4
	];

	private _steps = [];
	for "_i" from 2 to 4 do {
		private _marker = call(compile format ["introStep_%1", _i]);
		private _entry = getPos _marker;
		_steps pushBack _entry;
	};

	// AmovPercMlmpSnonWnonDf / AidlPercMstpSnonWnonDnon_G01
	[_newDudeActual, _steps, {}, "AmovPercMlmpSnonWnonDf", 1, 0.5, ""] spawn BIS_fnc_scriptedMove;

	[
		{
			params ["_newDudeActual"];
			deleteVehicle _newDudeActual;
		},
		[_newDudeActual],
		30
	] call CBA_fnc_waitAndExecute;
	
}, [introBus], 24] call CBA_fnc_waitAndExecute;

[{
	[introTelefonzelle, 1, 1] call BIS_fnc_Door;
	
}, [], 37] call CBA_fnc_waitAndExecute;

[{
	deleteVehicle (driver introBus);
	deleteVehicle introBus;
	
}, [], 40] call CBA_fnc_waitAndExecute;


// add phonebook entries of buddies
[{
	{
		private _unit = _x;
		private _segment = _unit getVariable ["GRAD_roles_segment", -1];
		// Get the home phone of the unit
		private _homePhone = _unit getVariable ["GRAD_telephone_homePhone", objNull];
		_homePhone setVariable ["grad_telephone_displayName", (_unit getVariable ["ACE_Name", "no name"]), true];
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
}, [], 60] call CBA_fnc_waitAndExecute;
