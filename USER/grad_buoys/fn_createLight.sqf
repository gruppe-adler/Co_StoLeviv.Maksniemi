params ["_buoy"];

// systemchat "wtf";

private _reflector = "Reflector_Cone_01_wide_white_F" createVehicleLocal [0,0,0];
_reflector attachTo [_buoy, [0.00378418,0.00439453,2.98995]];

private _yaw = 0; private _pitch = -20; private _roll = 0;
_reflector setVectorDirAndUp [
	[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
	[[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D
];

private _lightpoint = "#lightpoint" createVehicleLocal [0,0,0];
_lightpoint attachTo [_reflector, [0, 0, 0]];
_lightpoint setLightColor [0,0,0];
_lightpoint setLightAmbient [1, 1, 1];
_lightpoint setLightBrightness 1;
_lightpoint setLightFlareMaxDistance 2000;
_lightpoint setLightFlareSize 1;
_lightpoint setLightDayLight true;
