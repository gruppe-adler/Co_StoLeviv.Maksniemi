
if (isServer) then {
	["missionControl_curatorInfo", {
		params ["_unit", "_state"];

		if (_state == "unconscious") then {
			[_unit] remoteExec ["grad_customMedicSystem_fnc_createMedicMarker"];
		};

		if (_state == "wokeup") then {
			[_unit] remoteExec ["grad_customMedicSystem_fnc_removeMedicMarker"];
		};

	}] call CBA_fnc_addEventhandler;

    {
        [_x] remoteExec ["grad_customMedicSystem_fnc_addReviveAction", 0, true];
    } forEach (playableUnits + switchableUnits);
};


if (hasInterface) then {
    ["ace_unconscious", {
        params ["_unit", "_state"];

        // execute only when event is fired locally
        if (player isEqualTo _unit) then {
            [{
                params ["_unit", "_state"];
                if (_state) then {
                    ["missionControl_curatorInfo", [_unit, "unconscious"]] call CBA_fnc_serverEvent;
                } else {
                    ["missionControl_curatorInfo", [_unit, "wokeup"]] call CBA_fnc_serverEvent;
                };
            },[_unit,_state], 1] call CBA_fnc_waitAndExecute;
        };
    }] call CBA_fnc_addEventHandler;
};
