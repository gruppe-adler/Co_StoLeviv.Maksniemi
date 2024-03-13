if (!isServer) exitWith {};


["grad_missionControl_curatorInfo", {
    params ["_unit", "_type"];

    private _message = "";
    private _color = [0,0,0,1];

    switch (_type) do {
        case ("spawn_demon"): {
            _message = format ["%1 spawned a demon.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.5,0,0.5,1];
        };
        case ("spawn_horse"): {
            _message = format ["%1 spawned a horse.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0,0.5,0.5,1];
        };
        case ("spawn_zombie"): {
            _message = format ["%1 spawned a zombie.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0,0.5,0.5,1];
        };
        case ("unconscious"): {
            _message = format ["%1 was knocked out.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.5,0.1,0.1,1];

            [_unit, false] remoteExec ["allowDamage", _unit];
        };
        case ("revived"): {
            _message = format ["%1 got revived.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.1,0.5,0.5,1];

             [_unit, true] remoteExec ["allowDamage", _unit];
        };
        case ("respawned"): {
            _message = format ["%1 respawned.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.1,0.5,0.1,1];
        };
        case ("killed"): {
            _message = format ["%1 killed.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.7,0.1,0.1,1];
        };
        case ("lovers"): {
            _message = format ["%1 got assigned %2 as a lover.", [_unit, false, true] call ace_common_fnc_getName, [_unit getVariable ["grad_missionControl_buddy", objNull], false, true] call ace_common_fnc_getName];
            _color = [0.7,0.1,0.1,1];
        };
        default {};
    };

    // send message to all curators
    {
        private _playerAsZeus = getAssignedCuratorUnit _x;
        if (!isNull _playerAsZeus) then {
            [_message, _color] remoteExec ["grad_zeus_fnc_curatorShowFeedbackMessage", _playerAsZeus];
        };
    } forEach allCurators;
}] call CBA_fnc_addEventHandler;