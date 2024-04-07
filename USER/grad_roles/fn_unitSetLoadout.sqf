params ["_unit"];

private _playerRole = _unit getVariable ["GRAD_cfgCustomRoles_displayName", "none"];
private _config = "cfgCustomRoles";

if (_playerRole == "emergency") then {
	_backpackitems = [["ACE_splint",1], ["ACE_packingBandage", 10], ["ACE_quikclot", 10], ["ACE_elasticBandage",10], ["ACE_bloodIV",5], ["ACE_morphine",10], ["ACE_epinephrine",10]];
	_config = "cfgRoleEmergency";
};

private _roles = missionConfigFile >> _config;

private _uniform = selectRandom (getArray(_roles >> _playerRole >> "uniform"));
private _headgear = selectRandom (getArray(_roles >> _playerRole >> "headgear"));
private _item = selectRandom (getArray(_roles >> _playerRole >> "items"));
private _backpack = getText(_roles >> _playerRole >> "backpack");
private _bino = getText(_roles >> _playerRole >> "bino");

private _hmd = ([_roles >> _playerRole,"hmd",""] call BIS_fnc_returnConfigEntry);
private _radio = ([_roles >> _playerRole,"radio",""] call BIS_fnc_returnConfigEntry);
private _backpackitems = [];


_unit setUnitLoadout [ 
  [],[],[],[_uniform,[[_item,1]]],[],[_backpack,_backpackitems],_headgear,"",[],["ItemMap","",_radio,"ItemCompass","ItemWatch",_hmd]
];

if (_bino != "") then {
	_unit addWeapon _bino;
};