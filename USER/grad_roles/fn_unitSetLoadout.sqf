params ["_unit"];

private _roles = missionConfigFile >> "cfgCustomRoles";
private _playerRole = player getVariable ["GRAD_cfgCustomRoles_displayName", "none"];

private _uniform = selectRandom (getArray(_roles >> _playerRole >> "uniform"));
private _headgear = selectRandom (getArray(_roles >> _playerRole >> "headgear"));

_unit setUnitLoadout [
	/* primary weapon */	["", "", "", "", [], [], ""],
	/* secondary weapon */	["", "", "", "", [], [], ""],
	/* handgun weapon */	["", "", "", "", [], [], ""],
	/* uniform */			[_uniform, [["ACE_Flashlight_KSF1", 1]]],
	/* vest */				["V_PlateCarrier1_rgr", []],
	/* backpack */			["",[]],
	/* items */				_headgear, "",[],
	/* items */				["ItemMap", "", "", "ItemCompass", "ItemWatch", ""]
];
