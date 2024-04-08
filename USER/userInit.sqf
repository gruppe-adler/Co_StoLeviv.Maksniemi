/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

// activate UNCON on each player
if (hasInterface) then {
    player setVariable ["isSneaky", true, true];


    private _checkDisguise = ['Checkdisguise','Check my disguise','',{

        private _unit = player;
        private _disguiseActive = captive player;

        private _response = "All fine, I think the enemy does not suspect anything";

        if ((_unit getVariable ["INC_suspiciousValue",1]) >= 2) then {
				_response = "You are acting suspiciously";
			} else {

				if (_unit getVariable ["INC_firedRecent",false]) then {
					_response = "You smell of cordite";
				};

				if ((_unit getVariable ["INC_disguiseValue",1]) < 2) then {
					_response = "Your disguise is solid";
				} else {
					if ((_unit getVariable ["INC_disguiseValue",1]) < 3) then {
						_response = "Your disguise is good";
					} else {
						if ((_unit getVariable ["INC_disguiseValue",1]) < 7) then {
							_response = "You look a little out of place";
						} else {
							if ((_unit getVariable ["INC_disguiseValue",1]) < 13) then {
								_response = "You look suspicious";
							} else {
								_response = "You look extremely suspicious";
							};
						};
					};
				};
			};

	    if (_disguiseActive) then {
            _response call CBA_fnc_notify;
        } else {
            "I should keep my head low. The russians seem alert." call CBA_fnc_notify;
        };

    },{alive player}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _checkDisguise] call ace_interact_menu_fnc_addActionToObject;


	 ["ace_unconscious", {
        params ["_unit", "_state"];

        if (player getVariable ["grad_telephone_isCalling", false]) then {
            private _nearestPhone = objNull;
            private _nearestPhoneIndex = 0;
            private _position = getpos player;
            private _allNumbers = missionNamespace getVariable ['GRAD_TELEPHONE_ALLNUMBERS', []];
            {
                private _phoneObjects = _x select 1;
                private _numberIndex = _forEachIndex;

                {
                    private _phoneObject = _x;
                    private _positionPhoneObject = position _x;

                    if (isNull _nearestPhone) then {
                        _nearestPhone = _phoneObject;
                    };

                    if (_positionPhoneObject distance2D _position < (position _nearestPhone) distance2D _position) then {
                        _nearestPhone = _phoneObject;
                        _nearestPhoneIndex = _numberIndex;
                    };
                } forEach _phoneObjects;
            } forEach _allNumbers;

            if (count _allNumbers < 1) exitWith { systemChat "No phones on map"; };
            
            [player, _nearestPhone] remoteexec ["grad_telephone_fnc_callEnd", 2];
			player setVariable ["grad_telephone_isCalling", false];
        };
	 }] call CBA_fnc_addEventHandler;
	
};




GRAD_TELEPHONE_DEBUG_MODE = false;

/*
if (isServer) then {
    [] execvm "USER\advanced_slingloading_refactored\aslr_server_init.sqf";
} else {
    [] execvm "USER\advanced_slingloading_refactored\aslr_client_init.sqf";
};

ASLR_SUPPORTED_VEHICLES_OVERRIDE pushBackUnique "Buoy_F";
*/