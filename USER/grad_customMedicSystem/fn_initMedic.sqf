params ["_player"];

// remove from blufor BFT
[_player] joinSilent (createGroup civilian);

// show future medic markers
_player setVariable ['grad_customMedicSystem_isMedic', true];

// show existing medic markers
private _localMedicMarkers = _player getVariable ['grad_customMedicSystem_localMedicMarkers', []];

{
    _x setMarkerAlphaLocal 1;
} forEach _localMedicMarkers;

if (count _localMedicMarkers > 0) then {
    "Check map for unsconcious persons" call CBA_fnc_notify;
};


// prevent weapon firing 
player addeventhandler ["Fired",{ 
 
    params ["_shooter","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"]; 
    _dispName = getText (configfile >> "CfgMagazines" >> _magazine >> "displayName"); 
 
    if ((toUpper _weapon isEqualTo "PUT" OR toUpper _weapon isEqualTo "THROW") && _shooter getVariable ['grad_customMedicSystem_isMedic', false]) then { 
 
        deletevehicle _projectile; 
        hint format ["You can not use %1 as a medic", _dispName]}; 
}];
