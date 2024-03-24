/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

// activate UNCON on each player
if (hasInterface) then {
    player setVariable ["isSneaky", true, true];
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