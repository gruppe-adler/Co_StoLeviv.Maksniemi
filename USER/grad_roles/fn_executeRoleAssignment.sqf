if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

// Lock assignment to avoid race-conditions
missionNamespace setVariable ["GRAD_roleAssignmentAvailable", false, false];

params ["_player"];

// Initialize roles for first assignment, or when all roles have been assigned an equal amount of times
private _availableRoles = missionNamespace getVariable ["GRAD_availableRoles", []];
if (_availableRoles isEqualTo []) then {
	private _currentSegment = missionNamespace getVariable ["GRAD_currentSegment", -1];
	_currentSegment = _currentSegment + 1;
	missionNamespace setVariable ["GRAD_currentSegment", _currentSegment mod 2];

	// Emergency roles are excluded on purpose
	private _roles = missionConfigFile >> "cfgCustomRoles";
	private _rolesCount = count _roles;

	for "_i" from 0 to (_rolesCount - 1) do {
		private _roleClass = _roles select _i;
		private _roleMap = createHashMap;

		_roleMap set ["name", configName _roleClass];
		_roleMap set ["displayName", getText(_roleClass >> "role")];
		_roleMap set ["briefing", getText(_roleClass >> "briefing")];
		_roleMap set ["code", getText(_roleClass >> "code")];
		_roleMap set ["spawn", getText(_roleClass >> "spawn")];
		_roleMap set ["uniform", getArray(_roleClass >> "uniform")];
		_roleMap set ["headgear", getArray(_roleClass >> "headgear")];
		_roleMap set ["items", getArray(_roleClass >> "items")];
		_roleMap set ["backpack", getText(_roleClass >> "backpack")];
		_roleMap set ["bino", getText(_roleClass >> "bino")];
		// hmd is not set for all roles
		if (isClass (_roleClass >> "hmd")) then {
			_roleMap set ["hmd", getText(_roleClass >> "hmd")];
		} else {
			_roleMap set ["hmd", ""];
		};

		_availableRoles pushBack _roleMap;
	};
	missionNamespace setVariable ["GRAD_availableRoles", _availableRoles];
};

// Initialize marker suffixes for the different spawn-locations
private _availableSpawns = missionNamespace getVariable ["GRAD_availableSpawns", []];
if (_availableSpawns isEqualTo []) then {
	_availableSpawns = createHashMap;
	private _roles = missionConfigFile >> "cfgCustomRoles";
	private _rolesCount = count _roles;

	for "_i" from 0 to (_rolesCount - 1) do {
		private _roleClass = _roles select _i;
		_availableSpawns set [configName _roleClass, [1, 2, 3, 4]];
	};
	// The emergency-roles are not part of the cfgCustomRoles and therefore have to be set separately
	_availableSpawns set ["emergency", [1, 2, 3, 4]];

	missionNamespace setVariable ["GRAD_availableSpawns", _availableSpawns];
};

// Initialize identities
private _availableIdentities = missionNamespace getVariable ["GRAD_availableIdentities", []];
if (_availableIdentities isEqualTo []) then {
	_identityMap = createHashMap;
	private _identities = missionConfigFile >> "CfgIdentities";
	private _identityCount = count _identities;

	for "_i" from 0 to (_identityCount - 1) do {
		private _identityClass = _identities select _i;
		_identityMap set ["face", getText(_identityClass >> "face")];
		_identityMap set ["name", getText(_identityClass >> "name")];
		_availableIdentities pushBack _identityMap;
	};
<<<<<<< HEAD
		
=======
	
>>>>>>> ddf1574979e235643afa8adbfdae35955f7eefa4
	missionNamespace setVariable ["GRAD_availableIdentities", _availableIdentities];
};


////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////// ACTUAL ROLE ASSIGNMENT //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

private _currentSegment = missionNamespace getVariable ["GRAD_currentSegment", 0];
private _assignmentTable = missionNamespace getVariable ["GRAD_assignmentTable", createHashMap];

// Check if Player already has an assigned role (JIP)
private _id = getPlayerUID _player;
private _assignedEntry = _assignmentTable getOrDefault [_id, []];
// First time assignment
if (_assignedEntry isEqualTo []) then {
	private _role = createHashmap;
	private _spawnMarker = "";
	// Role
	// Normal Partisan
	if (([_player, true] call BIS_fnc_objectSide) == west) then {
		_player setVariable ["GRAD_roles_segment", _currentSegment, true];
		_role = selectRandom _availableRoles;
		_availableRoles deleteAt (_availableRoles find _role);
		missionNamespace setVariable ["GRAD_availableRoles", _availableRoles];

	// Medic
	} else {
		_player setVariable ["GRAD_roles_segment", 3, true];
		private _roleEmergency = missionConfigFile >> "cfgRoleEmergency";
		private _entry = _roleEmergency select 0;
		// docs and excluded zeus
		if (isclass _entry && (isNull getAssignedCuratorLogic _player) || isclass _entry && !isMultiplayer) then {
			_role set ["name", configName _entry];
			_role set ["displayName", getText(_entry >> "role")];
			_role set ["briefing", getText(_entry >> "briefing")];
			_role set ["code", getText(_entry >> "code")];
			_role set ["spawn", getText(_entry >> "spawn")];
			_role set ["uniform", getArray(_entry >> "uniform")];
			_role set ["headgear", getArray(_entry >> "headgear")];
			_role set ["items", getArray(_entry >> "items")];
			_role set ["backpack", getText(_entry >> "backpack")];
			_role set ["bino", getText(_entry >> "bino")];
		};
	};

	// Spawn
	private _roleName = _role get "name";
	private _availableMarkerNumbers = _availableSpawns get _roleName;
	private _markerNumber = selectRandom _availableMarkerNumbers;	
	_availableMarkerNumbers deleteAt (_availableMarkerNumbers find _markerNumber);
	_availableSpawns set [_roleName, _availableMarkerNumbers];
	missionNamespace setVariable ["GRAD_availableSpawns", _availableSpawns];
	_spawnMarker = format ["%1_%2", _role get "spawn", _markerNumber];

	// Identity
	private _identity = selectRandom _availableIdentities;
	_availableIdentities deleteAt (_availableIdentities find _identity);
	missionNamespace setVariable ["GRAD_availableIdentities", _availableIdentities];

	_assignedEntry = [_role, _spawnMarker, _identity, _markerNumber];
	_assignmentTable set [_id, _assignedEntry];
	missionNamespace setVariable ["GRAD_assignmentTable", _assignmentTable];
};

_assignedEntry params ["_role", "_spawnMarker", "_identity", "_markerNumber"];

// Handle role
_player setVariable ["GRAD_cfgCustomRoles_displayName", _role getOrDefault ["displayName", ""], true];
_player setVariable ["GRAD_cfgCustomRoles_briefing", _role getOrDefault ["briefing", ""], true];
_player setVariable ["GRAD_cfgCustomRoles_code", _role getOrDefault ["code", ""], true];
// _player setVariable ["GRAD_cfgCustomRoles_playerIndex", _playerIndex, true];

// Handlde spawn
private _allMapMarkers = allMapMarkers;
diag_log format ["spawnmarker %1 found: %2", _spawnMarker, _spawnMarker in _allMapMarkers];
if (_spawnMarker in _allMapMarkers) then {
	private _spawnPos = getMarkerPos _spawnMarker;
	_player setVariable ["GRAD_cfgCustomRoles_spawnPos", _spawnPos, true];	
	_player setVariable ["GRAD_cfgCustomRoles_spawnIndex", _markerNumber, true];
} else {
	diag_log "initRoles Error: no spawn marker found for " + _spawnMarker;
};

// Handlde identity
private _face = _identity get "face";
[_player, _face] remoteExec ["setFace", 0, _player];
private _name = _identity get "name";
private _sanitizedName = [_name, true] call ace_common_fnc_sanitizeString;
private _rawName = [_name, false] call ace_common_fnc_sanitizeString;
_player setVariable ["ACE_Name", _sanitizedName, true];
_player setVariable ["ACE_NameRaw", _rawName, true];


[_player] remoteExec ["grad_roles_fnc_initRoleClient", _player];

// Make assignment available again
missionNamespace setVariable ["GRAD_roleAssignmentAvailable", true, false];