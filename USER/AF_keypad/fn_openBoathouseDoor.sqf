params ["_keypad"];
 
private _boathouse = nearestObject [position _keypad, "Land_Nav_Boathouse"];
 
_boathouse setVariable ["BIS_Disabled_Door_3",0,true]; 
_boathouse setVariable ["BIS_Disabled_Door_4",0,true]; 

_boathouse animatesource ["Door_4_sound_source", 1, .2];

