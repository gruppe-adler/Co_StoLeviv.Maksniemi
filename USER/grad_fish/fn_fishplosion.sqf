params ["_position"];


// shockwave

for "_i" from 1 to 360 do {
    private _vector = _position vectorFromTo (_position getPos [1, _i]);
    _vector = _vector vectorMultiply 150;
    _vector set [2,10];
    private _source01 = "#particlesource" createVehicleLocal _position;
  

    _source01 setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 0.5, 3, 
        [0,0,1], _vector, 0, 1, 0.2, 0, [1,20], [[1,1,1,1],[0,0,0,0]], 
        [0.08], 1, 0, "", "", _this,0,false,0, [[1,1,1,0]],
        _vector
    ];   
    _source01 setDropInterval 1;

    [{ params ["_source"]; deleteVehicle _source; }, [_source01], 0.2] call CBA_fnc_waitAndExecute;
};

private _fishes = [
	"a3\animals_f\fishes\mullet_f.p3d",
	"a3\animals_f\fishes\mackerel_f.p3d",
	"a3\animals_f\fishes\tuna_f.p3d",
	"a3\animals_f\fishes\salema_porgy_f.p3d",
	"a3\animals_f\fishes\catshark_f.p3d",
	"a3\animals_f\fishes\ornate_f.p3d"
];



private _source2 = "#particlesource" createVehicleLocal [0, 0, 0];  
_source2 setPos _position;  
_source2 setParticleCircle [0, [0, 0, 2]];  
_source2 setParticleRandom [0, [1, 1, 1], [20, 20, 150], 1, 1, [0, 0, 0, 0.1], 0, 0];  
_source2 setParticleParams [
    ["a3\animals_f\fishes\mullet_f.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
    [0.1, 0.1, 1], [0, 0, 0], 0.5, 200, 20, 0, [1,1,1], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
    [0.08], 1, 0, "", "", _this,0,true,0.1
];  
_source2 setDropInterval 0.0001; 

[{ params ["_source"]; deleteVehicle _source; }, [_source2], 0.1] call CBA_fnc_waitAndExecute;

private _source3 = "#particlesource" createVehicleLocal [0, 0, 0]; 
_source3 setPos _position;
_source3 setParticleClass "WaterSplash"; 

[{ params ["_source"]; deleteVehicle _source; }, [_source3], 0.1] call CBA_fnc_waitAndExecute;
