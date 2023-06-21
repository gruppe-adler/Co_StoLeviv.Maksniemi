
call grad_loot_fnc_generateNames;

// tombstone loot
private _tombStones = call grad_loot_fnc_getTombStones;


{
	private _tombstone = _x;

	["Item_rhs_weap_m38", getPosATL _x, 1, true] remoteExec ["grad_loot_fnc_createLoot", 0, _x];

	private _actiondummy = "Sign_Sphere10cm_F" createVehicle [0,0,0];
	_actiondummy setPosATL getPosATL _tombstone;
	_tombstone setVariable ["grad_loot_actiondummy", _actiondummy, true];
	
	[_actiondummy, "colorGreen"] call grad_loot_fnc_createMarker;
	_actiondummy setVariable ["grad_loot_name", grad_lootnames select _foreachindex, true];
	[_actiondummy] remoteExec ["grad_loot_fnc_addTombNameAction", 0, _x];
	
	
} forEach _tombStones;
