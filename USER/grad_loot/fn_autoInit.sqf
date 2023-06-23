if (isServer) then {

	[] spawn {

		// tombstone loot
		private _tombStones = call grad_loot_fnc_getTombStones;
		private _names = call grad_loot_fnc_generateNames;
		private _deathdates = call grad_loot_fnc_getDateRange;
		private _epitaphs = call grad_loot_fnc_getEpitaph;
		
		private _allHashMaps = [];
		systemChat str _tombStones;
		{ 
			private _hashOfThisTombStone = createHashMapFromArray [
				[_x, _names#_forEachIndex], 
				[_x, _deathdates#_forEachIndex], 
				[_x, _epitaphs#_forEachIndex]
			];
			_allHashMaps pushBack _hashOfThisTombStone;

			systemChat str _forEachIndex;

		} forEach _tombStones;

		for "_i" from 1 to 10 do { 
			private _stone = _tombStones selectRandomWeighted [_forEachIndex, 5, 10];
			private _weaponholder = ["rhs_weap_m38", getPosATL _stone, 1] call grad_loot_fnc_createLoot;
		};

		missionNameSpace setVariable ["grad_loot_tombstoneHashes", _allHashMaps, true];
	};
};

if (hasInterface) then {

	[] spawn {
		waitUntil {
			count (missionNameSpace getVariable ["grad_loot_tombstoneHashes", []]) > 0
		};

		private _tombStoneHashes = missionNameSpace getVariable ["grad_loot_tombstoneHashes", []];
		{
			private _actiondummy = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
			private _positionATL = getPosATL _tombstone;
			_actiondummy setPosATL [_positionATL#0, _positionATL#1, _positionATL#2 + 0.35];
			_tombstone setVariable ["grad_loot_actiondummy", _actiondummy];
			_actionDummy setVariable ["grad_loot_tombstone", _tombstone];

			[_actiondummy, "colorGreen"] call grad_loot_fnc_createMarker;

			[_actiondummy] call grad_loot_fnc_addTombNameAction;
			[_actiondummy] call grad_loot_fnc_addDigAction;
		} forEach _tombStoneHashes;
	};
};
