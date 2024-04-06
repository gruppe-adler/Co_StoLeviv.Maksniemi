params ["_house"];

if (!isServer) exitWith {};

_house setVariable ["BIS_Disabled_Door_1",1,true];

private _keypad = "land_gm_euro_furniture_telephone_02" createVehicle [0,0,0];
_keypad enableSimulationGlobal false;
_keypad setposasl (_house modelToWorldWorld [-0.672852,1.27686,0.0507326]); 
// _keypad setDir getDir _house;
_keypad setVectorDirAndUp ([[vectorDirVisual _house, vectorUpVisual _house], 0, 0, -90] call BIS_fnc_transformVectorDirAndUp);
 
private _keycode = [1000, 9999] call BIS_fnc_randomInt;

[_keypad, str _keycode, "[_this] call grad_af_keypad_fnc_openDivingHut;"] remoteExec ["grad_af_keypad_fnc_addaction", 0, true];

_keypad setVariable ["GRAD_divingKeypad", _keycode, true];

diag_log format ["Adding locks to diving hut %1, _keycode is %2", _house, _keypad];
