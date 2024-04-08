/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

// activate UNCON on each player
if (hasInterface) then {
    player setVariable ["isSneaky", true, true];


    private _checkDisguise = ['Checkdisguise','Check my disguise','',{

        private _unit = player;
        private _disguiseActive = captive player;

        private _response = "All fine, I think the enemy does not suspect anything";

        if ((_unit getVariable ["INC_suspiciousValue",1]) >= 2) then {
				_response = "You are acting suspiciously";
			} else {

				if (_unit getVariable ["INC_firedRecent",false]) then {
					_response = "You smell of cordite";
				};

				if ((_unit getVariable ["INC_disguiseValue",1]) < 2) then {
					_response = "Your disguise is solid";
				} else {
					if ((_unit getVariable ["INC_disguiseValue",1]) < 3) then {
						_response = "Your disguise is good";
					} else {
						if ((_unit getVariable ["INC_disguiseValue",1]) < 7) then {
							_response = "You look a little out of place";
						} else {
							if ((_unit getVariable ["INC_disguiseValue",1]) < 13) then {
								_response = "You look suspicious";
							} else {
								_response = "You look extremely suspicious";
							};
						};
					};
				};
			};

	    if (_disguiseActive) then {
            _response call CBA_fnc_notify;
        } else {
            "I should keep my head low. The russians seem alert." call CBA_fnc_notify;
        };

    },{alive player}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _checkDisguise] call ace_interact_menu_fnc_addActionToObject;
};




GRAD_TELEPHONE_DEBUG_MODE = false;

/*
if (isServer) then {
    [] execvm "USER\advanced_slingloading_refactored\aslr_server_init.sqf";
} else {
    [] execvm "USER\advanced_slingloading_refactored\aslr_client_init.sqf";
};

ASLR_SUPPORTED_VEHICLES_OVERRIDE pushBackUnique "Buoy_F";
*/