params ["_actiondummy"];

private _action = ["Dig", "Dig", "", {

    private _cutter = (nearestObject [player, "Land_ClutterCutter_small_F"]);
    if (isNull _cutter) then {
        _cutter = "Land_ClutterCutter_small_F" createVehicleLocal [0,0,0];
        _cutter setPos getPos player;
    } else {
        if (_cutter distance player > 1) then {
            _cutter = "Land_ClutterCutter_small_F" createVehicleLocal [0,0,0];
            _cutter setPos getPos player;
        };
    };
    
    // [_object, ACE_player] call grad_trenches_functions_fnc_playSound;
    // [_object] call grad_loot_fnc_digFX;

    [5, [_target], {
        params ["_args"];
		_args params ["_target"];

        private _weaponholders = _target getVariable ["grad_loot_weaponholders", []];
        private _tombstone = _target getVariable ["grad_loot_tombstone", []];
        Hint "Finished!";
        { _x hideObjectGlobal false; } forEach _weaponHolders;
        _tombstone hideObjectGlobal true;

        [(getModelInfo _tombstone) select 1, _target, _tombstone, getPos player] call grad_loot_fnc_digFinishFX;
        _target setVariable ["grad_loot_available", false, true];
        _target setVariable ["grad_loot_digging", false];
    }, {
        hint "Aborted digging!";
        _target setVariable ["grad_loot_digging", false];
    }, "Digging..."] call ace_common_fnc_progressBar;

    _target setVariable ["grad_loot_digging", true];

    [{
        params ["_args", "_handle"];
		_args params ["_target"];

        if (!(_target getVariable ["grad_loot_digging", false])) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        private _lastFX = _target getVariable ["grad_loot_lastFX", 3];
        // systemChat "digging ping";
        if (CBA_missionTime - _lastFX > 2) then {
            _target setVariable ["grad_loot_lastFX", CBA_missionTime];
            [_target, ACE_player] call grad_trenches_functions_fnc_playSound;
            [_target] remoteExec ["grad_loot_fnc_digFX"];
        };

    }, 2, [_target]] call CBA_fnc_addPerFrameHandler;

}, {
    (_target getVariable ["grad_loot_available", true])
}, {}, [], [0,0,-0.2]] call ace_interact_menu_fnc_createAction;

[_actiondummy, 0, [], _action, true] call ace_interact_menu_fnc_addActionToObject;
