if (!isServer) exitWith {};

private _roles = missionConfigFile >> "cfgCustomRoles";
private _rolesCount = count _roles;
private _allMapMarkers = allMapMarkers;

// distribute roles and spawns
{
	private _unit = _x;
	private _playerIndex = _foreachindex; // for unique identity assignment

	if (side _unit == west) then {

		private _index = _foreachindex mod _rolesCount;
		/*
			The mod operator calculates the remainder when dividing the left operand by the right operand. 
			So _foreachindex mod _rolesCount effectively calculates the remainder of dividing the current 
			iteration index by the total number of roles. This operation ensures that _index stays within
			the bounds of the _roles array. For instance, if there are 5 roles in the _roles array, and 
			_foreachindex is 7, _index would be 7 % 5 = 2, effectively looping back to the beginning of 
			the _roles array after reaching its end.
		*/

		private _entry = _roles select _index;

		if (isclass _entry) then {
			private _displayname = getText(_entry >> "role");
			private _briefing = getText(_entry >> "briefing");
			private _code = getText(_entry >> "code");
			private _spawn = getText(_entry >> "spawn");
			private _markernumber = (_foreachIndex mod 3) + 1;
			
			private _spawnMarker = format ["%1_%2", _spawn, _markernumber];

			_unit setVariable ["GRAD_cfgCustomRoles_displayName", _displayName, true];
			_unit setVariable ["GRAD_cfgCustomRoles_briefing", _briefing, true];
			_unit setVariable ["GRAD_cfgCustomRoles_code", _code, true];
			_unit setVariable ["GRAD_cfgCustomRoles_playerIndex", _playerIndex, true];

			private _face = getText(((missionConfigFile >> "CfgIdentities") select _playerIndex) >> "face");
			private _name = getText(((missionConfigFile >> "CfgIdentities") select _playerIndex) >> "name");

			// all hunters from one big happy family
			if (_displayname == "hunter") then {
				_name = _name splitString " ";
				_name set [1, "Vixxär"];
				_name = _name joinString " ";
			};

			[_unit, _face, "Male01ENGB", 1.05, _name, _name] call BIS_fnc_setIdentity;
			_unit setVariable ["ACE_Name", _name, true];

			diag_log format ["spawnmarker %1 found: %2", _spawnMarker, _spawnMarker in _allMapMarkers];

			if (_spawnMarker in _allMapMarkers) then {
				private _spawnPos = getMarkerPos _spawnMarker;
				
				_unit setVariable ["GRAD_cfgCustomRoles_spawnPos", _spawnPos, true];
			} else {
				diag_log "initRoles Error: no spawn marker found for " + _spawnMarker;
			};
		};
	} else {
		private _roleEmergency = missionConfigFile >> "cfgRoleEmergency";
		private _entry = _roles select 0;

		// docs and excluded zeus
		if (isclass _entry && (isNull getAssignedCuratorLogic _unit)) then {
			private _displayname = getText(_entry >> "role");
			private _briefing = getText(_entry >> "briefing");
			private _code = getText(_entry >> "code");
			private _spawn = getText(_entry >> "spawn");
			private _markernumber = (_foreachIndex mod 3) + 1;
			
			private _spawnMarker = format ["%1_%2", _spawn, _markernumber];

			_unit setVariable ["GRAD_cfgCustomRoles_displayName", _displayName, true];
			_unit setVariable ["GRAD_cfgCustomRoles_briefing", _briefing, true];
			_unit setVariable ["GRAD_cfgCustomRoles_code", _code, true];

			diag_log format ["spawnmarker %1 found: %2", _spawnMarker, _spawnMarker in _allMapMarkers];

			if (_spawnMarker in _allMapMarkers) then {
				private _spawnPos = getMarkerPos _spawnMarker;
				
				_unit setVariable ["GRAD_cfgCustomRoles_spawnPos", _spawnPos, true];
			} else {
				diag_log "initRoles Error: no spawn marker found for " + _spawnMarker;
			};
		};
	};

} forEach (playableUnits + switchableUnits);

missionNameSpace setVariable ["GRAD_Roles_Initialised", true];

[{
	[] call grad_roles_fnc_distributePhoneNumbers;
}, [], 10] call CBA_fnc_waitAndExecute;
