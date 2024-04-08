/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

// activate UNCON on each player
if (hasInterface) then {
    player setVariable ["isSneaky", true, true];


    private _checkDisguise = ['Checkdisguise','Check my disguise','',{

        private _disguiseActive = captive player;

	    if (_disguiseActive) then {
            "All fine, I think the enemy does not suspect anything." call CBA_fnc_notify;
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