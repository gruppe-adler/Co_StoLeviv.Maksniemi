params ["_unit"];

[_unit, false] call ace_medical_fnc_setUnconscious;

private _reviveAsMedic = random 1 > 0.5;

if (_reviveAsMedic) then {
	// remove from blufor and inco tracker, add to civilian side
	_unit setVariable ["isSneaky", false, true];
	[_unit] remoteExec ["grad_customMedicSystem_fnc_initMedic", _unit];
} else {
	// reset all inco values
	_unit setVariable ["INC_undercoverHandlerRunning", false];
	_unit setVariable ["INC_isCompromised", false];
	_unit setVariable ["INC_suspicious", false];
	_unit setVariable ["INC_cooldown", false];
	_unit setVariable ["INC_shotAt",false];
	_unit setVariable ["INC_firedRecent",false];
	_unit setVariable ["INC_highSecAlert",false];
	_unit setVariable ["INC_trespassAlert",false];
	_unit setVariable ["INC_seenByList",[]];
};