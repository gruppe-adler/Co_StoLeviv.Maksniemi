params ["_target", "_caller", "_actionId", "_arguments"];


if (speed _target > 15) exitWith {
	systemChat "fly slower than 15 kmh to release balloon";
};

private _vehiclePos = getPosASL _target; 
 
// Define the distance below the bounding box 
private _distanceBelow = 0.5; // Adjust this value as needed 
 
// Calculate the position below 
_positionBelow = [_vehiclePos select 0, _vehiclePos select 1, (_vehiclePos select 2) - _distanceBelow]; 
 
private _balloon = "Land_Balloon_01_air_F" createVehicle [0,0,0]; 
_balloon setPosASL _positionBelow; 
_balloon setMass 0.0001;

_balloon setVelocity [0,0,-1]; 
_balloon allowDamage false;
 
private _chemlight = "ACE_G_Chemlight_Orange_Infinite" createVehicle [0,0,0]; 
_chemlight attachto [_balloon, [0,0,0.2]];

systemChat "balloon dropped";
