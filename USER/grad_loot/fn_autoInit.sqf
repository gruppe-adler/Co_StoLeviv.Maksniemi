if (isServer) then {

	[] spawn {
		systemChat "spawn running";

		waitUntil { !isNil "GRAD_Roles_Initialised" };

		// tombstone properties
		private _tombStones = call grad_loot_fnc_getTombStones;
		systemChat str count(_tombStones);
		private _names = call grad_loot_fnc_generateNames;
		systemChat str count(_names);
		private _deathdates = call grad_loot_fnc_getDateRange;
		systemChat str count(_deathdates);
		private _epitaphs = call grad_loot_fnc_getEpitaph;
		systemChat ("epitaphs: " + str count(_epitaphs));


		// role specific loot
		private _tombStoneUsed = [];
		private _lootCount = 40;

		for "_i" from 1 to _lootCount do { 
			private _stone = selectRandom (_tombStones - _tombStoneUsed);
			_tombStoneUsed pushBack _stone;
		};

		
		// save attributes to tombstone hashmap
		private _allHashes = [];
		systemChat str (count _tombStones);
		{ 
			private _loot = "none";
			if (_x in _tombStoneUsed) then {
				_loot = selectRandom ["rhs_weap_m38"];
				
				if (!isNil "DEBUG") then {
					[_x, "COLORBLACK"] call grad_loot_fnc_createMarker;
				};
			};
			_allHashes pushBack [_x call BIS_fnc_netId, [_names#_forEachIndex, _deathdates#_forEachIndex, _epitaphs#_forEachIndex, _loot]];

			
			
			// systemChat str _forEachIndex;
		} forEach _tombStones;

		private _hashMap = createHashMapFromArray _allHashes;

			
		// private _weaponholder = ["rhs_weap_m38", _positionATL] call grad_loot_fnc_createLoot;
		// todo store name of tombstone externally to assign to player later on
		

		missionNameSpace setVariable ["grad_loot_tombstoneHashes", _hashMap, true];
		missionNameSpace setVariable ["grad_loot_tombstones", _tombStones, true];
		missionNameSpace setVariable ["grad_loot_tombstonesLoot", _tombStoneUsed, true];
	};
};

if (hasInterface) then {

	[] spawn {
		waitUntil {
			count (missionNameSpace getVariable ["grad_loot_tombstones", []]) > 0
		};

		private _tombStones = missionNameSpace getVariable ["grad_loot_tombstoneHashes", []];
		{
			private _tombstone = (_x call BIS_fnc_objectFromNetId);
			private _values = _y;
			_values params ["_name", "_date", "_epitaph"];

			private _actiondummy = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
			_actiondummy setObjectTexture [0, "#(rgb,8,8,3)color(0,0,0,0)"];
			
			private _positionATL = getPosATL _tombstone;
			_actiondummy setPosATL [_positionATL#0, _positionATL#1, _positionATL#2 + 0.35];
			_tombstone setVariable ["grad_loot_actiondummy", _actiondummy];
			_actionDummy setVariable ["grad_loot_tombstone", _tombstone];

			// [_actiondummy, "colorGreen"] call grad_loot_fnc_createMarker;

			_actionDummy setVariable ["grad_loot_name", _name];
			_actionDummy setVariable ["grad_loot_deathdate", _date];
			_actionDummy setVariable ["grad_loot_epitaph", _epitaph];

			// [_actiondummy] call grad_loot_fnc_addTombNameAction;
			[_actiondummy] call grad_loot_fnc_addDigAction;
		} forEach _tombStones;
		
	};
};
