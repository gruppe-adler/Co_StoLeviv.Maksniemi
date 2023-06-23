params ["_actiondummy"];

private _action = ["Dig", "Dig", "", {

    private _cutter = (nearestObject [player, "Land_ClutterCutter_small_F"]);
    if (isNull _cutter) then {
        _cutter = "Land_ClutterCutter_small_F" createVehicle [0,0,0];
        _cutter setPos getPos player;
    } else {
        if (_cutter distance player > 1) then {
            _cutter = "Land_ClutterCutter_small_F" createVehicle [0,0,0];
            _cutter setPos getPos player;
        };
    };
    

    [5, [_target], {
        params ["_args"];
		_args params ["_target"];

        private _weaponholders = _target getVariable ["grad_loot_weaponholders", []];
        private _tombstone = _target getVariable ["grad_loot_tombstone", []];
        Hint "Finished!";
        { _x hideObjectGlobal false; } forEach _weaponHolders;
        _tombstone hideObjectGlobal false;

        [(getModelInfo _tombstone) select 1, _target, getPos player] call grad_loot_fnc_digFinishFX;
        _target setVariable ["grad_loot_available", false, true];
    }, {
        hint "Aborted digging!";
    }, "Digging..."] call ace_common_fnc_progressBar;

}, {
    (_target getVariable ["grad_loot_available", true])
}, {}, [], [0,0,-0.2]] call ace_interact_menu_fnc_createAction;

[_actiondummy, 0, [], _action, true] call ace_interact_menu_fnc_addActionToObject;
