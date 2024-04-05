params ["_balloon"];

private _light = "#lightreflector" createVehicleLocal (_balloon modelToWorld [0, 0, 0]);
_light setLightIntensity 700;
_light setLightAmbient [1, 0.5, 0];
_light setLightColor [1, 0.5, 0];
_light setLightConePars [360, 360, 0.1];
_light attachTo [_balloon, [0,0,0]];