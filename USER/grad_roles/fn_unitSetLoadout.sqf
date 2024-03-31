params ["_unit"];

private _roles = missionConfigFile >> "cfgCustomRoles";
private _playerRole = _unit getVariable ["GRAD_cfgCustomRoles_displayName", "none"];

private _uniform = selectRandom (getArray(_roles >> _playerRole >> "uniform"));
private _headgear = selectRandom (getArray(_roles >> _playerRole >> "headgear"));

_unit setUnitLoadout [
	[],[],[],
	[_uniform,
	[
		["ACE_Flashlight_KSF1",1]]
	],
	["V_PlateCarrier1_rgr",
	[

	]],[],_headgear,"",[],["ItemMap","","","ItemCompass","ItemWatch",""]
];