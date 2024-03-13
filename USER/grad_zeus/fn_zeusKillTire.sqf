params ["_vehicle"];

private _type = typeOf _vehicle;
private _wheelHitPoints = switch (_type) do {
	case "BWA3_Multi_Fleck": { 
		[
			"wheel_1_1",
			"wheel_1_2",
			"wheel_1_3",
			"wheel_1_4",
			"wheel_2_1",
			"wheel_2_2",
			"wheel_2_3",
			"wheel_2_4"
		]
	};
	case "gm_ge_army_fuchsa0_engineer": { 
		[
			"hitpoint_wheel_1_2","hitpoint_wheel_1_2","hitpoint_wheel_2_1", "hitpoint_wheel_2_2","hitpoint_wheel_3_1","hitpoint_wheel_3_2"
		]
	};
	case "gm_ge_army_u1300l_medic": {
		[
			"hitpoint_wheel_1_1","hitpoint_wheel_1_2","hitpoint_wheel_2_1","hitpoint_wheel_2_2"
		]
	};
	case "gm_ge_army_iltis_cargo": {
		[
			"hitpoint_wheel_1_1","hitpoint_wheel_1_2","hitpoint_wheel_2_1","hitpoint_wheel_2_2"
		]
	};
	default { 
		[
			"wheel_1_1","wheel_1_2","wheel_1_3","wheel_1_4","wheel_2_1","wheel_2_2","wheel_2_3","wheel_2_4"
		]
	};
};

private _hitPoint = selectRandom _wheelHitPoints;



private _sound = "sabo_tire" + str (ceil(random(6)));
[_vehicle, [_sound, 75]] remoteExec ["say3d"];

[{	
	params ["_vehicle", "_hitPoint"];
	[_vehicle, [_hitPoint, 1]] remoteExec ["setHitPointDamage", _vehicle];
}, [_vehicle, _hitPoint], 3] call CBA_fnc_waitAndExecute;
