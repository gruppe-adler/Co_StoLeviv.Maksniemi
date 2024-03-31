if (!isServer) exitWith {};

private _roles = missionConfigFile >> "cfgCustomRoles";
private _rolesCount = count _roles;
private _allMapMarkers = allMapMarkers;
private _markerCounter = 1;

// distribute roles and spawns
{
	private _unit = _x;
	private _playerIndex = _foreachindex; // for unique identity assignment
	// cap at identity limit
	if (_playerIndex > 31) then {
		_playerIndex = ceil random 31;
	};

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
			private _markernumber = min(floor((_markerCounter - 1) / 7) + 1, 4);
			
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

				diag_log format ["InitRolesServer: assigning %1 - iteration %2 - spawnpos %3 - name: %4", _displayName, _markernumber, _spawnPos, _name];
			} else {
				diag_log "initRoles Error: no spawn marker found for " + _spawnMarker;
			};
		};
	} else {
		private _roleEmergency = missionConfigFile >> "cfgRoleEmergency";
		private _entry = _roleEmergency select 0;

		// docs and excluded zeus
		if (isclass _entry && (isNull getAssignedCuratorLogic _unit) || isclass _entry && !isMultiplayer) then {
			private _displayname = getText(_entry >> "role");
			private _briefing = getText(_entry >> "briefing");
			private _code = getText(_entry >> "code");
			private _spawn = getText(_entry >> "spawn");
			private _markernumber = min(floor((_markerCounter - 1) / 7) + 1, 4);
			
			private _spawnMarker = format ["%1_%2", _spawn, _markernumber];

			private _face = getText(((missionConfigFile >> "CfgIdentities") select _playerIndex) >> "face");
			private _name = getText(((missionConfigFile >> "CfgIdentities") select _playerIndex) >> "name");

			[_unit, _face, "Male01ENGB", 1.05, _name, _name] call BIS_fnc_setIdentity;
			_unit setVariable ["ACE_Name", _name, true];

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

	// for ai testing
	if (local _unit && !isPlayer _unit) then {
		[_unit] call grad_roles_fnc_initRoleClient;
		[_unit] call grad_roles_fnc_initAI;
	} else {
		[_unit] remoteExec ["grad_roles_fnc_initRoleClient", 0, true];
	};

	_markerCounter = _markerCounter + 1;

} forEach (playableUnits + switchableUnits);

missionNameSpace setVariable ["GRAD_Roles_Initialised", true];

[{
	// part players into three segments and give them a phone number
	[] call grad_roles_fnc_distributeSegments;
}, [], 10] call CBA_fnc_waitAndExecute;
