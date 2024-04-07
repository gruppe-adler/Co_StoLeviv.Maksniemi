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
////////////// CALLS
//////////////

["STO LEVIV - CALLS", "Ad hoc intel call (Input)",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLtoAGL _position;

  ["Example Dialog", [["EDIT", "Intel to send via call", "Your message for public briefing"]], {
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


["STO LEVIV - CALLS", "Personal Intel (Role specific)",
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


["STO LEVIV - CALLS", "Main objective Intel (Segment)",
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


["STO LEVIV - CALLS", "Appeal players to call each other",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    _position = ASLtoAGL _position;
      
    private _homePhones = missionNameSpace getVariable ["GRAD_HOME_PHONES", []];

    {
        if (random 1 > 0.5) then {
            [_x, "GRAD_garble_long", "Its time to rise fellow partisan. Someone from our cell will call you. Decide for a meeting place and time."] remoteExec ["GRAD_telephone_fnc_fakeCallPhone", 2];
        } else {
            [_x, "GRAD_garble_long", "Its time to rise fellow partisan. Check your phonebook and call ALL your private contacts, gather them on a position and time of your choice to discuss your intel and further steps."] remoteExec ["GRAD_telephone_fnc_fakeCallPhone", 2];
        };
    } forEach _homePhones;

    if (count _homePhones < 1) exitWith { systemChat "No home phones on map"; };

}] call zen_custom_modules_fnc_register;


["STO LEVIV - ROUND CALLS", "Personal Intel Roundcall",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    _position = ASLtoAGL _position;
      
    private _homePhones = missionNameSpace getVariable ["GRAD_HOME_PHONES", []];

    {
       [_x, "GRAD_garble_long", "customintel"] remoteExec ["GRAD_telephone_fnc_fakeCallPhone", 2];
    } forEach _homePhones;

    if (count _homePhones < 1) exitWith { systemChat "No home phones on map"; };

}] call zen_custom_modules_fnc_register;

["STO LEVIV - ROUND CALLS", "Segment Intel Roundcall",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    _position = ASLtoAGL _position;
      
    private _homePhones = missionNameSpace getVariable ["GRAD_HOME_PHONES", []];

    {
       [_x, "GRAD_garble_long", "segmentintel"] remoteExec ["GRAD_telephone_fnc_fakeCallPhone", 2];
    } forEach _homePhones;

    if (count _homePhones < 1) exitWith { systemChat "No home phones on map"; };

}] call zen_custom_modules_fnc_register;


["STO LEVIV - CALLS", "End nearest Call",
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



//////////////
////////////// PHONES
//////////////


["STO LEVIV - PHONES", "Create XXX Phone from object",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    if (!isNull _objectUnderCursor) then {
        [_objectUnderCursor] remoteExec ["GRAD_zeus_fnc_addFakePhone", 2];
    };

}] call zen_custom_modules_fnc_register;


["STO LEVIV - PHONES", "Spawn Rotary Phone",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    _position = ASLtoAGL _position;

    private _nearbyLocations = nearestLocations [getpos player, [], 10000, getPos player] select { text _x != "" };
    if (count _nearbyLocations < 1) exitWith { systemChat "no location nearby"; };
    _nearbyLocations params ["_location"];

    private _chair =  createVehicle ["land_gm_euro_furniture_chair_04", _position, [], 0, "NONE"]; 
    
    private _phone = createVehicle ["land_gm_euro_furniture_telephone_01", [0,0,0], [], 0, "NONE"];
    _phone setPos (_chair modelToWorld [0.00512695,-0.0283203,0.460115]);
    _phone setVectorDirAndUp [[0.237576,0.971369,0],[0,0,1]];

    private _displayName = "Some phone near " + text _location;
    [_phone, true, "none", _displayName, "all", false, getPos _phone, false, false] remoteExec ["grad_telephone_fnc_addPhone", 2];

}] call zen_custom_modules_fnc_register;


["STO LEVIV - PHONES", "Spawn Sat Phone",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    _position = ASLtoAGL _position;

    private _getRandomChar = {
        private _chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
        private _index = floor(random(count _chars)); 
        private _randomChar = (_chars splitstring "") select _index;
        _randomChar
    };
    private _satphoneID = ((call _getRandomChar) + (call _getRandomChar) + (call _getRandomChar) + (call _getRandomChar));
    private _phone = createVehicle ["Land_SatellitePhone_F", _position, [], 0, "NONE"];
    private _displayName = "Sat Phone " + _satphoneID;
     _phone setVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0.2,0], true];

    [_phone, true, "none", _displayName, "all", false, getPos _phone, false, false] remoteExec ["grad_telephone_fnc_addPhone", 2];

    [_phone, true, [0, 0.2, 1], 0, true] remoteExec ["ace_dragging_fnc_setCarryable", [0,-2] select isDedicated, true]; 

}] call zen_custom_modules_fnc_register;


//////////////
////////////// LOCKING
//////////////


["STO LEVIV - LOCKING", "UNLOCK all building doors",
{
        params ["_modulePosition"]; 
        private _position = ASLtoAGL _modulePosition;

        [_position, false] call grad_af_keypad_fnc_lockNearestHouseDoors;

}] call zen_custom_modules_fnc_register;

["STO LEVIV - LOCKING", "LOCK all building doors",
{
        params ["_modulePosition"]; 
        private _position = ASLtoAGL _modulePosition;

        [_position, true] call grad_af_keypad_fnc_lockNearestHouseDoors;

}] call zen_custom_modules_fnc_register;


//////////////
////////////// NOTES
//////////////


["STO LEVIV - NOTES", "Write + Spawn Note",
{
        params ["_modulePosition"]; 

        _modulePosition = ASLToATL _modulePosition;

        ["Example Dialog", [["EDIT", "Your text?", "string ping"]], {
			   params ["_message", "_position"]; 
                  // systemchat str _position; 
                  // systemchat (_message select 0);
			   [_position, random 360, _message select 0, ["somewhat",["cramped","EtelkaNarrowMediumPro"]]] remoteExec ["GRAD_leaveNotes_fnc_spawnNote", 2, false];
		  }, { systemchat "cancelled"; }, _modulePosition] call zen_dialog_fnc_create;        

}] call zen_custom_modules_fnc_register;



//////////////
////////////// LOOT
//////////////


["STO LEVIV - LOOT", "Spawn random Weapon Loot",
{
        params ["_modulePosition"]; 

        _position = ASLtoATL _position; // LOOT FNC needs ATL!

        private _loot = selectRandom ["rhs_weap_m38", "vn_m1891", "UK3CB_M1903A1", "vn_m1903"];
        [_loot, _position, 1, false, true] call grad_loot_fnc_createLoot;

}] call zen_custom_modules_fnc_register;



//////////////
////////////// BRIEFING
//////////////

["STO LEVIV - BRIEFING", "Get Private Briefing",
{
        params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
        _position = ASLtoAGL _position;

        private _playerCloseBy = objNull;
        private _nearestPlayerDistance = 100;
        {
            private _distance = _x distance2d _position;
            if (_distance < _nearestPlayerDistance) then {
                _nearestPlayerDistance = _distance;
                _playerCloseBy = _x;
            };
        } forEach allPlayers;

        if (isNull _playerCloseBy) exitWith { systemChat "no player around here"; };

        [_playerCloseBy] call grad_briefing_fnc_briefingOpenPrivate;

}] call zen_custom_modules_fnc_register;


["STO LEVIV - BRIEFING", "Get Public Briefing",
{
        params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
        _position = ASLtoAGL _position;

        private _playerCloseBy = objNull;
        private _nearestPlayerDistance = 100;
        {
            private _distance = _x distance2d _position;
            if (_distance < _nearestPlayerDistance) then {
                _nearestPlayerDistance = _distance;
                _playerCloseBy = _x;
            };
        } forEach allPlayers;

        if (isNull _playerCloseBy) exitWith { systemChat "no player around here"; };

        [_playerCloseBy] call grad_briefing_fnc_briefingOpenPublic;

}] call zen_custom_modules_fnc_register;


["STO LEVIV - FISH", "Fishplosion!",
{
        params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
        _position = ASLtoAGL _position;

        [_position] remoteExec ["grad_fish_fnc_fishplosion", [0,-2] select isDedicated];

}] call zen_custom_modules_fnc_register;
