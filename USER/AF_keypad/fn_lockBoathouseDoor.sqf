params ["_keypad"];

private _boathouse = nearestObject [position _keypad, "Land_Nav_Boathouse"];

_boathouse setVariable ["BIS_Disabled_Door_3",1,true]; 
_boathouse setVariable ["BIS_Disabled_Door_4",1,true]; 