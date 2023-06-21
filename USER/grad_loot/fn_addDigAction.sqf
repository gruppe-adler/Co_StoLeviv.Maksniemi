params ["_actiondummy"];

private _action = ["Dig", "Dig", "", {

    [5, [_target], {

        params ["_target"];

        private _weaponholder = _target getVariable ["grad_loot_weaponholder", objNull];

        hint str (getItemCargo _weaponholder);
        if (count (getItemCargo _weaponholder select 1) > 0) then {
            Hint "Finished!"
        };
    }, {
        hint "Aborted digging!"
    }, "Digging..."] call ace_common_fnc_progressBar

}, {true}] call ace_interact_menu_fnc_createAction;

[_actiondummy, 0, [], _action, true] call ace_interact_menu_fnc_addActionToObject;
