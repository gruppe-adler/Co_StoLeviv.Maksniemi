params ["_keypad"];
 
private _gate = nearestObject [position _keypad, "land_vn_embassy_gate_01"];
 
_gate setVariable ["BIS_Disabled_Door_1",0,true]; 
_gate setVariable ["BIS_Disabled_Door_2",0,true]; 

_gate animatesource ["door_01_sound_source", 1, .2];
_gate animatesource ["door_02_sound_source", 1, .2];
