params ["_position"];

if (!hasInterface) exitWith {};

private _drop = 0.001+(random 0.02);

private _sparkEffect = "#particlesource" createVehicleLocal _position;
_sparkEffect setParticleCircle [0, [0, 0, 0]];
_sparkEffect setParticleRandom [2, [0.2, 0.2, 0.2], [0, 0, -0.1], 0, 0.25, [0, 0, 0, 0], 0, 0];
_sparkEffect setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0], 0, 15, 7.9, 0, [0.01, 0.005, 0.003], [[1, 0.7, 0.5, 1], [1, 0.7, 0.5, 1], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _this];
_sparkEffect setDropInterval _drop;

private _drop2 = 0.001+(random 0.02);
private _sparkEffect2 = "#particlesource" createVehicleLocal _position;
_sparkEffect2 setParticleCircle [0, [0, 0, 0]];
_sparkEffect2 setParticleRandom [1, [0.15, 0.15, 0.1], [3, 3, 2], 0, 0.0025, [0, 0, 0, 0], 0, 0];
_sparkEffect2 setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [0.002, 0.001, 0.001], [[1, 0.7, 0.5, 1], [1, 0.7, 0.5, 1], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _this];
_sparkEffect2 setDropInterval _drop2;

[{deleteVehicle _this},_sparkEffect,0.2] call CBA_fnc_waitAndExecute;
[{deleteVehicle _this},_sparkEffect2,0.3] call CBA_fnc_waitAndExecute;