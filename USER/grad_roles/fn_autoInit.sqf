
if (isServer && !isMultiplayer) then {


};

[] spawn { 
	
	private _playerRole = player getVariable ["GRAD_cfgCustomRoles_displayName", "none"];
	// exclude zeus here :P
	if (_playerRole != "none") then {
		private _initFile = compile format ["grad_roles_fnc_init%1", _playerRole];
		[player] call _initFile;
	};


	player addEventhandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];

		// plays alarm on empty cars once
		if (
				!(_vehicle getVariable ["GRAD_isPlayers", false]) && 
				_vehicle isKindOf "Car" && 
				count crew _vehicle == 0 &&
				!(_vehicle getVariable ["GRAD_alarmPlayed", false])
			) then {
				["play", _vehicle] call BIS_fnc_carAlarm;
				_vehicle setVariable ["GRAD_alarmPlayed", true, true];
		};

		if (_vehicle isKindOf "Tank") then {
			if (_role == "driver" || _role == "gunner") then {
				if !(player getVariable ["GRAD_isTankCrew", false]) then {
					moveOut player;
					systemChat "I am not trained for this.";
				};
			};
		};
		if (_vehicle isKindOf "Ship") then {
			if (_role == "driver" || _role == "gunner") then {
				if !(player getVariable ["GRAD_isBoatCrew", false]) then {
					moveOut player;
					systemChat "I am not trained for this.";
				};
			};
		};
	}];

	player addEventHandler ["SeatSwitchedMan", {
		params ["_unit1", "_unit2", "_vehicle"];
		{
			if (!isNull _x) then {
				private _role = (assignedVehicleRole _x);
				if (count _role < 1) exitWith {};
				_role = _role#0;
				if (_vehicle isKindOf "Tank") then {
					if (_role == "driver" || _role == "gunner") then {
						if !(_x getVariable ["GRAD_isTankCrew", false]) then {
							moveOut _x;
							systemChat "I am not trained for this.";
						};
					};
				};
				if (_vehicle isKindOf "Ship") then {
					if (_role == "driver" || _role == "gunner") then {
						if !(_x getVariable ["GRAD_isBoatCrew", false]) then {
							moveOut _x;
							systemChat "I am not trained for this.";
						};
					};
				};
			};
		} forEach [_unit1, _unit2];
	}];
};
/*



["loadout", {

	systemChat str _this
	
}] call CBA_fnc_addPlayerEventHandler;


player addEventHandler [ "Put", {
    params[ "_unit", "_container" ];
    
    if( typeOf _container isEqualTo "GroundWeaponHolder" ) then {
        {
			if (typeOf _x in ((missionNamespace getVariable ["INC_incogUniforms",[]]) + (missionNamespace getVariable ["INC_civilianUniforms",[]]))) then {
				systemchat "player dropped his uniform";
			};
		} forEach items _container;
    };
}];
*/


/*
	vehicle crew stuff
*/


