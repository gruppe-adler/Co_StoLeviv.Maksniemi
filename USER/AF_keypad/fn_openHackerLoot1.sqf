params ["_keypad"];
 
private _gate = nearestObject [position _keypad, "Land_Workshop_04_F"];
 
_gate setVariable ["BIS_Disabled_Door_3",0,true];

_gate animatesource ["Door_3_sound_source", 1, 1];
