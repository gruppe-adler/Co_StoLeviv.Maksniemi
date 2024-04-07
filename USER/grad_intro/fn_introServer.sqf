private _duration = 120;

// skiptime 3;
// setTimeMultiplier 1;
// skiptime -1.5;
setDate [2019,8,27,0,28]; // fix date at night

[_duration] remoteExec ["grad_intro_fnc_intro_start", 0, true];


private _busPath = [
	getPos busPath_1,
	getPos busPath_2,
	getPos busPath_3,
	getPos busPath_4,
	getPos busPath_5,
	getPos busPath_6,
	getPos busPath_7,
	getPos busPath_8,
	getPos busPath_9,
	getPos busPath_10,
	getPos busPath_11,
	getPos busPath_12,
	getPos busPath_13
];

introBus setDriveOnPath _busPath;

[{
	if (introDude getVariable ["grad_walkCommand", false]) exitWith {};
	// introDude playActionNow "radioAnims_Ear";
	private _newDudeActual = (createGroup civilian) createUnit ["C_Man_1", position introStep_1, [], 0, "CAN_COLLIDE"];
	_newDudeActual setUnitLoadout [[],[],[],["UK3CB_U_KZS_UP_KHK",[]],[],[],"","",[],["","","","","ItemWatch",""]];
	_newDudeActual allowDamage false;

	private _steps = [
		getPos introStep_2,
		getPos introStep_3,
		getPos introStep_4
	];

	[_newDudeActual, _steps, {}, "AmovPercMlmpSnonWnonDfl", 0.5, 1] spawn BIS_fnc_scriptedMove;
	
}, [], 24] call CBA_fnc_waitAndExecute;

[{
	[introTelefonzelle, 1, 1] call BIS_fnc_Door;
	
}, [], 35] call CBA_fnc_waitAndExecute;

[{
	deleteVehicle introBus;
	
}, [], 60] call CBA_fnc_waitAndExecute;

