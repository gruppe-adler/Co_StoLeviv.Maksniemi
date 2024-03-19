params ["_classname", "_positionATL", ["_amount", 1], ["_hideInitially", true], ["_includeMags", false]];

private _lootContainers = [];

for "_i" from 1 to _amount do {
    private _lootContainer = createVehicle ["weaponholdersimulated", [0,0,0], [], 0, "CAN_COLLIDE"];

    _lootContainer setDir (random 360); 
    _lootContainer setPosATL [_positionATL#0, _positionATL#1, _positionATL#2+.2]; 

    ([_classname] call BIS_fnc_itemType) params ["_type"];

    if (_type == "WEAPON") then {
        _lootContainer addWeaponCargoGlobal [_classname, _amount];

        if (_includeMags) then {
            private _classnameMag = (compatibleMagazines _classname) select 0;
            _lootContainer addMagazineCargoGlobal [_classnameMag, ceil random 3];
        };
    };
    if (_type == "ITEM") then {
        _lootContainer addItemCargoGlobal [_classname, _amount]; 
    };
    if (_type == "MAGAZINE") then {
        _lootContainer addMagazineCargoGlobal [_classname, _amount]; 
    };
    if (_type == "EQUIPMENT") then {
        //backpack
        if ( isClass( configFile >> "CfgVehicles" >> _classname ) ) then {
            _lootContainer addBackpackCargoGlobal [ _classname, 1 ];
        }else{
            _lootContainer addItemCargoGlobal [ _classname, 1 ];
        };
    };
    _lootContainer hideObjectGlobal _hideInitially;
    _lootContainers pushBackUnique _lootContainer;
};

_lootContainers
