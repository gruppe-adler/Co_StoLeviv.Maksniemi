/*

	runs on server

*/

params ["_unit"];

[_unit, false] call ace_medical_fnc_setUnconscious;
[_unit] remoteExec ["ace_medical_treatment_fnc_fullHealLocal", _unit];

private _reviveAsMedic = false; // random 1 > 0.5;

if (_reviveAsMedic) then {
	// remove from blufor and inco tracker, add to civilian side
	_unit setVariable ["isSneaky", false, true];
	[_unit] remoteExec ["grad_customMedicSystem_fnc_initMedic", _unit];
} else {
	// reset all inco values, globally just to be sure no zeus unit might not run on server, not sure how uncon handles this
	_unit setVariable ["INC_undercoverHandlerRunning", false, true];
	_unit setVariable ["INC_isCompromised", false, true];
	_unit setVariable ["INC_suspicious", false, true];
	_unit setVariable ["INC_cooldown", false, true];
	_unit setVariable ["INC_shotAt",false, true];
	_unit setVariable ["INC_firedRecent",false, true];
	_unit setVariable ["INC_highSecAlert",false, true];
	_unit setVariable ["INC_trespassAlert",false, true];
	_unit setVariable ["INC_seenByList",[], true];
};
