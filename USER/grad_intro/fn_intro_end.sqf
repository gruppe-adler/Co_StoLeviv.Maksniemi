
params ["_camera"];
private _duration = 1.5;

[{
    "introBlackLoading" cutText ["", "BLACK OUT", _this];
}, _duration, _duration] call CBA_fnc_waitAndeXecute;


[{
    params ["_camera", "_duration"];

    _camera cameraEffect ["terminate","back"];
    camDestroy _camera;
    showCinemaBorder false;
    5 fadeSound 1;
     "introBlackLoading" cutText ["", "BLACK IN", _duration];
     diwako_dui_main_toggled_off = false;
    
}, [_camera, _duration], _duration + 2] call CBA_fnc_waitAndeXecute;
