params ["_vehicle"];

["Air", "init", {
	(_this select 0) addAction ["Drop Balloon Marker",
	grad_roles_fnc_spawnBalloon,
	[],
	0,
	false,
	false,
	"", "_this in (crew _target) && {speed _target < 10}"];
}, true, [], true] call CBA_fnc_addClassEventhandler;
