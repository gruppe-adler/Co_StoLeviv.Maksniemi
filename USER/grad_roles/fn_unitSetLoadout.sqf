params ["_unit"];

private _roles = missionConfigFile >> "cfgCustomRoles";
private _playerRole = _unit getVariable ["GRAD_cfgCustomRoles_displayName", "none"];

private _uniform = selectRandom (getArray(_roles >> _playerRole >> "uniform"));
private _headgear = selectRandom (getArray(_roles >> _playerRole >> "headgear"));
private _item = selectRandom (getArray(_roles >> _playerRole >> "items"));
private _backpack = getText(_roles >> _playerRole >> "backpack");
private _backpackitems = [];

if (_playerRole == "emergency") then {
	_backpackitems = [["ACE_splint",1], ["ACE_packingBandage", 10], ["ACE_quikclot", 10], ["ACE_elasticBandage",10], ["ACE_bloodIV",5], ["ACE_morphine",10], ["ACE_epinephrine",10]];
};

_unit setUnitLoadout [
	[],[],[],
	[_uniform,
	[
		["ACE_Flashlight_KSF1",1],[_item, 1]
	]
	],
	[_backpack,
	_backpackitems
	],[],_headgear,"",[],["ItemMap","","","ItemCompass","ItemWatch",""]
];