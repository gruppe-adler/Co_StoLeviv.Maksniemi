if (didJIP) exitWith {
    "introBlackLoading" cutText ["", "BLACK IN", 5];
};

[{
    "introBlackLoading" cutText ["", "BLACK IN", 5];
    [{
        private _music = playMusic "GRAD_polka_music";
    }, [], 0] call CBA_fnc_waitAndeXecute;
}, [], 0] call CBA_fnc_waitAndeXecute;



diwako_dui_main_toggled_off = true;
// 0 fadeSound 0; 

showCinemaBorder true;

private _camera = "camera" camCreate [0, 0, 3];
_camera cameraEffect ["internal","back"];
_camera camCommand "inertia on";
_camera camPreparePos (getPos intro_1);
_camera camSetFOV 0.55; // 0.25
_camera camCommitPrepared 0;


// private _vectorDir = (getPos introMarker_1) vectorFromTo (getpos introMarkerTarget_1);
private _vectorDir = vectorDir intro_1;
private _vectorUp = vectorUp intro_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _ppGrain = ppEffectCreate ["filmGrain", 2000];
_ppGrain ppEffectEnable true;
_ppGrain ppEffectAdjust [
	0.025,
	1.25,
	2.01,
	0.75,
	1.0,
	0
];

_ppGrain ppEffectCommit 0;

/*
private _ppBW = ppEffectCreate ["ColorCorrections", 1500];
_ppBW ppEffectEnable true;
_ppBW ppEffectAdjust
[
	1,
	1,
	0,
	[0, 0, 0, 0],
	[1, 1, 1, 0],
	[0.299, 0.587, 0.114, 0],
	[-1, -1, 0, 0, 0, 0, 0]
];

_ppBW ppEffectCommit 0;

missionNameSpace setVariable ["intro_fx_ppBW", _ppBW];
*/

// _camera camPreparePos (getPos introMarker_1_5);
// _camera camSetFOV 0.25;
// _camera camCommitPrepared 6;

// intro 1
[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_1;
}, [_camera], 0] call CBA_fnc_waitAndExecute;


/*
[{
    params ["_camera"];
    [_camera, 0.001, 20] execvm "user\intro\fn_camshake.sqf";
}, [_camera], .1] call CBA_fnc_waitandexecute;
*/


/*
private _splitscreen = "camera" camCreate (player modelToWorld [0,-5,2]);
_splitscreen cameraEffect ["internal", "back", "rtt"];
"rtt" setPiPEffect [0];
with uiNamespace do {
	private _pic = findDisplay 46 ctrlCreate ["RscPicture", -1];
	_pic ctrlSetPosition [safezoneX+(safezoneW/2),safezoneY,safeZoneW/2,safeZoneH];
	_pic ctrlCommit 0;
	_pic ctrlSetText "#(argb,512,512,1)r2t(rtt,1.0)";

    [{
    params ["_pic"];

    ctrlDelete _pic;
    
    }, [_pic], _duration] call CBA_fnc_waitAndeXecute;
};
*/



