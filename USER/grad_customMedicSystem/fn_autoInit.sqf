
if (isServer) then {
	["missionControl_curatorInfo", {
		params ["_unit", "_state"];

		if (_state == "unconscious") then {
			[_unit] remoteExec ["grad_customMedicSystem_fnc_createMedicMarker"];
		};

		if (_state == "revived") then {
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

        if (player getVariable ["grad_telephone_isCalling", false]) then {
            private _nearestPhone = objNull;
            private _nearestPhoneIndex = 0;
            private _position = getpos player;
            private _allNumbers = missionNamespace getVariable ['GRAD_TELEPHONE_ALLNUMBERS', []];
            {
                private _phoneObjects = _x select 1;
                private _numberIndex = _forEachIndex;

                {
                    private _phoneObject = _x;
                    private _positionPhoneObject = position _x;

                    if (isNull _nearestPhone) then {
                        _nearestPhone = _phoneObject;
                    };

                    if (_positionPhoneObject distance2D _position < (position _nearestPhone) distance2D _position) then {
                        _nearestPhone = _phoneObject;
                        _nearestPhoneIndex = _numberIndex;
                    };
                } forEach _phoneObjects;
            } forEach _allNumbers;

            if (count _allNumbers < 1) exitWith { systemChat "No phones on map"; };
            
            [player, _nearestPhone] remoteexec ["grad_telephone_fnc_callEnd", 2];
        };

        // execute only when event is fired locally
        if (player isEqualTo _unit) then {
            [{
                params ["_unit", "_state"];
                if (_state) then {
                    ["missionControl_curatorInfo", [_unit, "unconscious", ""]] call CBA_fnc_globalEvent;
                } else {
                    ["missionControl_curatorInfo", [_unit, "revived", ""]] call CBA_fnc_globalEvent;
                };
            },[_unit,_state], 1] call CBA_fnc_waitAndExecute;
        };
    }] call CBA_fnc_addEventHandler;
};
