
call grad_loot_fnc_generateNames;

// tombstone loot
private _tombStones = call grad_loot_fnc_getTombStones;


{
	private _tombstone = _x;

	["Item_rhs_weap_m38", getPosATL _x, 1, true] remoteExec ["grad_loot_fnc_createLoot", 0, _x];

	private _actiondummy = "Sign_Sphere10cm_F" createVehicle [0,0,0];
	private _positionATL = getPosATL _tombstone;
	_actiondummy setPosATL [_positionATL#0, _positionATL#1, _positionATL#2 + 0.35];
	_tombstone setVariable ["grad_loot_actiondummy", _actiondummy, true];
	
	[_actiondummy, "colorGreen"] call grad_loot_fnc_createMarker;
	_actiondummy setVariable ["grad_loot_name", grad_lootnames select _foreachindex, true];
	_actiondummy setVariable ["grad_loot_deathdate", call grad_loot_fnc_getDateRange, true];
	_actiondummy setVariable ["grad_loot_epitaph", call grad_loot_fnc_getEpitaph, true];

	[_actiondummy] remoteExec ["grad_loot_fnc_addTombNameAction", 0, _x];
	
	
} forEach _tombStones;
