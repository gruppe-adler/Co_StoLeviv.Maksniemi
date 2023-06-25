params ["_position"];

private _source2 = "#particlesource" createVehicleLocal [0, 0, 0];  
_source2 setPos _position;  
_source2 setParticleParams [
    ["a3\misc_f\helpers\sign_arrow_f.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
    [0, 0, 0], [0, 0, 0], 0.5, 200, 20, 3.75, [2,2,2], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
    [0.08], 1, 0, "", "", _this,0,true,0.1,[],[[1,0,0], [0,0,1]]
];  
_source2 setDropInterval .1; 

[{ params ["_source"]; deleteVehicle _source; }, [_source2], 0.15] call CBA_fnc_waitAndExecute;