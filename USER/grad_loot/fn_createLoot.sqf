params ["_classname", "_positionATL", ["_amount", 1], ["_buried", false]];

 private _lootContainer = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "CAN_COLLIDE"];
_lootContainer setDir (random 360);
_lootContainer setPosATL _positionATL;

systemchat ("creating " + str _classname);

for "_i" from 1 to _amount do {

    if (_classname in ([configFile >> "CfgWeapons", true] call BIS_fnc_returnParents)) then {
        _container addWeaponCargoGlobal [_classname, _amount]; 
    };
    if (_classname in ([configFile >> "CA_Magazine", true] call BIS_fnc_returnParents)) then {
        _container addMagazineCargoGlobal [_classname, _amount]; 
    };
    if (_classname in ([configFile >> "CfgItems", true] call BIS_fnc_returnParents)) then {
        _container addItemCargoGlobal [_classname, _amount]; 
    };
    if (_classname in ([configFile >> "Bag_Base", true] call BIS_fnc_returnParents)) then {
        _container addBackpackCargoGlobal [_classname, _amount]; 
    };
};

 if (_buried) then {
    // _container setPosATL (_positionATL#0, _positionATL#1, _positionATL#2);
    // hideObjectGlobal _lootContainer;
    [_lootContainer] remoteExec ["grad_loot_fnc_addDigAction", 0, _lootContainer]
};

