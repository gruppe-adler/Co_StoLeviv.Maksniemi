["Land_BuoyBig_F", "init", {
	private _buoy = (_this select 0);

	if (local _buoy) then {
		_buoy setDamage 1;

		[_buoy] remoteExec ["grad_buoys_fnc_createLight", 0, true];
	};
}, true, [], true] call CBA_fnc_addClassEventHandler;