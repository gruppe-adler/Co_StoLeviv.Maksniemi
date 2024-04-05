params ["_container", "_weaponclassname", ["_amount", 1]];

if (!isServer) exitWith {};

([_weaponclassname] call BIS_fnc_itemType) params ["_type"];

for "_i" from 1 to _amount do {
	if (_type == "WEAPON") then {
		_lootContainer addWeaponCargoGlobal [_classname, _amount];

		if (_includeMags) then {
			private _classnameMag = (compatibleMagazines _classname) select 0;
			_lootContainer addMagazineCargoGlobal [_classnameMag, ceil random 3];
		};
	} else {
		diag_log format ["cant create weapon, %1 not a weapon", _weaponclassname];
	};
};

// vn_izh54_shorty
// vn_m2carbine
// vn_m1903
// vn_fkb1_pm
