params ["_vehicle", "_killWhat"];

private _type = typeOf _vehicle;
private _hitPointFuel = switch (_type) do {
	case "BWA3_Multi_Fleck": { 
			"hitFuel"		
	};
	case "gm_ge_army_fuchsa0_engineer": { 
			"hitpoint_fuel"
	};
	case "gm_ge_army_u1300l_medic": {
			"hitpoint_fuel"
	};
	case "gm_ge_army_iltis_cargo": {
			"hitpoint_fuel"
	};
	default { 
			"hitFuel"		
	};
};



[{	
	params ["_vehicle", "_hitPointFuel"];
	[_vehicle, [_hitPointFuel, 1]] remoteExec ["setHitPointDamage", _vehicle];
}, [_vehicle, _hitPointFuel], 3] call CBA_fnc_waitAndExecute;
