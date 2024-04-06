params ["_position", "_unit"];

private _objects =
[
	["land_gm_euro_furniture_table_02",[0,0,-9.53674e-07],0,1,0,[-0.833217,-0.625016],"","",true,false], 
	["land_gm_euro_furniture_coffeejug_01",[0.0664063,0.0419922,0.91091],123.871,1,0,[0.983146,-0.343314],"","",true,false], 
	["land_gm_euro_furniture_mug_01",[-0.103516,-0.0371094,0.911178],0,1,0,[-0.832982,-0.625016],"","",true,false], 
	["land_gm_euro_furniture_chair_04",[-0.928711,-0.0273438,1.14441e-05],289.15,1,0,[-0.86374,0.582101],"","",true,false], 
	["land_gm_euro_stationary_09",[-0.250977,0.192383,0.911177],74.4681,1,0,[0.379143,-0.969897],"","",true,false], 
	["land_gm_euro_furniture_radio_01",[0.325195,-0.0996094,0.911179],82.3968,1,0,[0.509311,-0.908342],"","",true,false], 
	["land_gm_euro_stationary_03_01",[0.109375,0.349609,0.911174],94.87,1,0,[0.693472,-0.776923],"","",true,false], 
	["land_gm_euro_furniture_telephone_01",[-0.311523,-0.207031,0.911176],36.5114,1,0,[-0.297656,-0.997914],"","",true,false]
];

private _spawned = [_position, random 360, _objects] call BIS_fnc_ObjectsMapper;

private _phone = _spawned select -1;

// disable sim for objects not flying around as much
{
	if (_x != _phone) then {
		_x enableSimulationGlobal false;
	};
} forEach _spawned;

private _displayName = ([_unit] call ace_common_fnc_getName);

[_phone, true, "none", _displayName, "all", false, getPos _phone, false, false] remoteExec ["grad_telephone_fnc_addPhone", 2];

_unit setVariable ["GRAD_telephone_homePhone", _phone, true];

private _homePhones = missionNameSpace getVariable ["GRAD_HOME_PHONES", []];
_homePhones pushBackUnique _phone;
missionNameSpace setVariable ["GRAD_HOME_PHONES", _homePhones, true];


/*
 ["_object", objNull],
  ["_isRotary", false],
  ["_number", "none"],
  ["_displayName", "none"],
  ["_canOnlyCallNumber", "all"],
  ["_hasPublicPhoneBookEntry", false],
  ["_phonePosition", [0,0,0]],
  ["_isPhoneBooth", false],
  ["_isFakePhone", false]
*/