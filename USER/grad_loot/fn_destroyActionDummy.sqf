params ["_tombstone"];

private _actiondummy = _tombstone getVariable ["grad_loot_actiondummy", objNull];

deleteVehicle _actiondummy;
