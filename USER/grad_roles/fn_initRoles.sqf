#include "cfgCustomRole.hpp"

if (!isServer) exitWith {};


private _roles = configFile >> "cfgRoles";

for "_i" from 0 to (count _roles - 1) do {
	_entry = _roles select _i;

	if (isclass _entry) then {
		private _displayname = getText(_entry >> "role");
		private _briefing = getText(_entry >> "briefing");
		private _code = getText(_entry >> "code");
	};
};

// distribute roles
{ 


} forEach (playableUnits + switchableUnits);


// distribute spawns

