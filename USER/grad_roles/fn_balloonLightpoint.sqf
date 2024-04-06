params ["_balloon"];

private _light = "#lightreflector" createVehicleLocal (_balloon modelToWorld [0, 0, 0]);
_light setLightIntensity 7000;
_light setLightAmbient [1, 0.5, 0];
_light setLightColor [1, 0.5, 0];
_light setLightConePars [360, 360, 50];
_light attachTo [_balloon, [0,0,0]];

// delete if zeus deletes balloon
[{
	params ["_balloon"];
	isNull _balloon
},{
	params ["_balloon", "_light"];
	deleteVehicle _light;
}, [_balloon, _light]] call CBA_fnc_waitUntilAndExecute;
