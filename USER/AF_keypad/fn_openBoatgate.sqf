params ["_keypad"];
 
private _boathouse = nearestObject [position _keypad, "land_vn_embassy_gate_01"];
 
_boathouse setVariable ["BIS_Disabled_Door_1",0,true]; 
_boathouse setVariable ["BIS_Disabled_Door_2",0,true]; 

_boathouse animatesource ["door_01", 1, .2];
_boathouse animatesource ["door_02", 1, .2];

