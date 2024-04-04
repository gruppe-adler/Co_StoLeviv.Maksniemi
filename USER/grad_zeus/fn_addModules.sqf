[] spawn {
  waitUntil {!isNull player};
  waitUntil {  time > 3 };

  {
    private _curator = _x;
    
      _curator addEventHandler ["CuratorGroupPlaced", {
          params ["", "_group"];

          ["GRAD_missionControl_setServerAsOwner", [_group]] call CBA_fnc_serverEvent;
      }];

      _curator addEventHandler ["CuratorObjectPlaced", {
          params ["", "_object"];

          if (_object isKindOf "CAManBase") then {
             if (count units _object == 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group _object]] call CBA_fnc_serverEvent;
             };
          } else {
             if (count crew _object > 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group (crew _object select 0)]] call CBA_fnc_serverEvent;
             };
         };

      }];

  } forEach allCurators;
};


//////////////

["STO LEVIV", "Custom Call phone",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLtoAGL _position;

  ["Example Dialog", [["EDIT", "Intel to send via call", "string ping"]], {
			params ["_message", "_position"]; 
      
      private _nearestPhone = objNull;
      private _nearestPhoneIndex = 0;
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

      [_nearestPhone, "GRAD_garble_long", _message#0] remoteExec ["GRAD_telephone_fnc_fakeCallPhone", 2];   
  
  }, { systemchat "cancelled"; }, _position] call zen_dialog_fnc_create;  

}] call zen_custom_modules_fnc_register;

["STO LEVIV", "Custom Intel Call phone",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    _position = ASLtoAGL _position;
      
    private _nearestPhone = objNull;
    private _nearestPhoneIndex = 0;
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

    [_nearestPhone, "GRAD_garble_long", "customintel"] remoteExec ["GRAD_telephone_fnc_fakeCallPhone", 2];

}] call zen_custom_modules_fnc_register;



["STO LEVIV", "Segment Intel Call phone",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    _position = ASLtoAGL _position;
      
    private _nearestPhone = objNull;
    private _nearestPhoneIndex = 0;
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

    [_nearestPhone, "GRAD_garble_long", "segmentintel"] remoteExec ["GRAD_telephone_fnc_fakeCallPhone", 2];

}] call zen_custom_modules_fnc_register;


["STO LEVIV", "Segment Intel Call all HOMES",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    _position = ASLtoAGL _position;
      
    private _homePhones = missionNameSpace getVariable ["GRAD_HOME_PHONES", []];

    {
        [_x, "GRAD_garble_long", "segmentintel"] remoteExec ["GRAD_telephone_fnc_fakeCallPhone", 2];
    } forEach _homePhones;

    if (count _homePhones < 1) exitWith { systemChat "No home phones on map"; };

}] call zen_custom_modules_fnc_register;



["STO LEVIV", "Create XXX Phone from object",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    if (!isNull _objectUnderCursor) then {
        [_objectUnderCursor] remoteExec ["GRAD_zeus_fnc_addFakePhone", 2];
    };

}] call zen_custom_modules_fnc_register;



["STO LEVIV", "End nearest Call",
{
    params ["_modulePosition"]; 
    private _position = ASLtoAGL _modulePosition;

      private _nearestPhone = objNull;
      private _nearestPhoneIndex = 0;
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

      _nearestPhone setVariable ["grad_telephone_phoneStatus", "ending", true];
      [objNull, _nearestPhone] call grad_telephone_fnc_callEnd;

}] call zen_custom_modules_fnc_register;


["STO LEVIV", "Spawn Note",
{
        params ["_modulePosition"]; 
        private _position = ASLtoAGL _modulePosition;

        ["Example Dialog", [["EDIT", "Your text?", "string ping"]], {
			   params ["_message", "_position"]; 
                  // systemchat str _position; 
                  // systemchat (_message select 0);
			   [_position, random 360, _message select 0, ["somewhat",["cramped","EtelkaNarrowMediumPro"]]] remoteExec ["GRAD_leaveNotes_fnc_spawnNote", 2, false];
		  }, { systemchat "cancelled"; }, _position] call zen_dialog_fnc_create;        

}] call zen_custom_modules_fnc_register;



["STO LEVIV", "Get Private Briefing from player",
{
        params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
        private _isPlayer = isPlayer _objectUnderCursor;

        if (!isplayer _objectUnderCursor) exitWith { systemChat "no player"; };

        [_objectUnderCursor] call grad_briefing_fnc_briefingOpenPrivate;

}] call zen_custom_modules_fnc_register;


["STO LEVIV", "Get Public Briefing from player",
{
        params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
        private _isPlayer = isPlayer _objectUnderCursor;

        if (!isplayer _objectUnderCursor) exitWith { systemChat "no player"; };

        [_objectUnderCursor] call grad_briefing_fnc_briefingOpenPublic;

}] call zen_custom_modules_fnc_register;