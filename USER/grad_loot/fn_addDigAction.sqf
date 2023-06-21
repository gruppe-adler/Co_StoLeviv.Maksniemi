params ["_object"];

_action = ["Dig", "Dig", "", {

    [5, [_target], {

        params ["_target"];

        if (count (getItemCargo _target select 1) > 0) then {
            Hint "Finished!"
        };
    }, {
        hint "Aborted digging!"
    }, "Digging..."] call ace_common_fnc_progressBar

    hint format ["Fuel: %1", fuel _target]
}, {true}] call ace_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
