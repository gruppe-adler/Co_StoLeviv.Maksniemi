params ["_object"];

private _action = ["Dig", "Dig", "", {

    [5, [_target], {

        params ["_target"];

        hint str (getItemCargo _target);
        if (count (getItemCargo _target select 1) > 0) then {
            Hint "Finished!"
        };
    }, {
        hint "Aborted digging!"
    }, "Digging..."] call ace_common_fnc_progressBar

}, {true}] call ace_interact_menu_fnc_createAction;

[_object, 0, [], _action, true] call ace_interact_menu_fnc_addActionToObject;
