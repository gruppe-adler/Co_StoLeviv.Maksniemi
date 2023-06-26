/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

// activate UNCON on each player
if (hasInterface) then {
    player setVariable ["isSneaky", true, true];
};
