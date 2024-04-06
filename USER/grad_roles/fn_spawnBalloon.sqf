params ["_target", "_caller", "_actionId", "_arguments"];


if (speed _target > 15) exitWith {
	["Fly slower than 15 kmh to release balloon"] call CBA_fnc_notify;
};

private _vehiclePos = getPosASL _target; 
 
// Define the distance below the bounding box 
private _distanceBelow = 0.5; // Adjust this value as needed 
 
// Calculate the position below 
_positionBelow = [_vehiclePos select 0, _vehiclePos select 1, (_vehiclePos select 2) - _distanceBelow]; 
 
private _balloon = "Land_Balloon_01_air_F" createVehicle [0,0,0]; 
_balloon setPosASL _positionBelow; 

private _vel = velocity _target;
_balloon setVelocity [_vel # 0, _vel # 1, -1];
// _balloon allowDamage false;
 
[_balloon] remoteExec ["grad_roles_fnc_balloonLightpoint", [0,-2] select isDedicated, true];

systemChat "balloon dropped";
