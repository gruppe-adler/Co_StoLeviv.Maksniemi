params ["_unit"];

private _action = [
        "Revive","Revive",
        "",
        {
            if (player distance getMarkerPos "mrk_hospital" > 30) then {
                "Please transport back to hospital to revive." call CBA_fnc_notify;
            } else {
                [_target] remoteExec ["grad_customMedicSystem_fnc_reviveServer", 2];
            };
        },{
            _target getVariable ["ACE_isUnconscious", false]
        },{},[]] call ace_interact_menu_fnc_createAction;
[_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
