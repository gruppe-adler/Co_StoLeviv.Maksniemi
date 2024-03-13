[] spawn {
  waitUntil {!isNull player};
  waitUntil {  time > 3 };

  {
    private _curator = _x;
    
      _curator addEventHandler ["CuratorGroupPlaced", {
          params ["", "_group"];

          ["GRAD_missionControl_setServerAsOwner", [_group]] call CBA_fnc_serverEvent;

          {
              if ([_x] call grad_missionControl_fnc_zombieIsZomie) then {
                  [_x] call grad_missionControl_fnc_zombieRandomize;
              };
          } forEach units _group;
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

["STO LEVIV", "Call phone",
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

  [_nearestPhone, "grad_garble"] call GRAD_telephone_fnc_fakeCall;   

}] call zen_custom_modules_fnc_register;
