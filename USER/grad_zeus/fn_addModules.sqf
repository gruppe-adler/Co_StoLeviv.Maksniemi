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


    

["NOT GREAT NOT TERRIBLE - SETUP", "List players without lover",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [_objectUnderCursor] call grad_missionControl_fnc_getPlayersWithoutBuddy;

}] call zen_custom_modules_fnc_register;

["NOT GREAT NOT TERRIBLE - FIXES", "Assign lovers for loveless players",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [] remoteExec ["grad_missionControl_fnc_loversAssignRemaining", 2];      

}] call zen_custom_modules_fnc_register;



["NOT GREAT NOT TERRIBLE - FIXES", "Splatter cow",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  if (!isNull _objectUnderCursor) then {
      [getPos _objectUnderCursor, true] remoteExec ["grad_missionControl_fnc_cowBlood", [0,-2] select isDedicated];
	    deleteVehicle _objectUnderCursor;   
  };

}] call zen_custom_modules_fnc_register;




["NOT GREAT NOT TERRIBLE - SETUP", "Assign Saboteur",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [_objectUnderCursor] call grad_missionControl_fnc_assignSaboteur;

}] call zen_custom_modules_fnc_register;


["NOT GREAT NOT TERRIBLE - END", "Execute Outro",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [] remoteExec ["grad_missionControl_fnc_introOutroText"];

}] call zen_custom_modules_fnc_register;


["NOT GREAT NOT TERRIBLE - END", "Kill Fuel",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  if (!((vehicle _objectUnderCursor) isKindOf "Car")) exitWith { 
    ["No car"] call CBA_fnc_notify;
  };

  [vehicle _objectUnderCursor] call grad_missionControl_fnc_zeusKillFuel;

}] call zen_custom_modules_fnc_register;

["NOT GREAT NOT TERRIBLE - END", "Kill Tire",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  if (!((vehicle _objectUnderCursor) isKindOf "Car")) exitWith { 
    ["No car"] call CBA_fnc_notify;
  };

  [vehicle _objectUnderCursor] call grad_missionControl_fnc_zeusKillTire;

}] call zen_custom_modules_fnc_register;



["NOT GREAT NOT TERRIBLE - END", "Add Gasmask Crew to vehicle (WHITE)",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  if (!((vehicle _objectUnderCursor) isKindOf "Car")) exitWith { 
      ["No car"] call CBA_fnc_notify;
  };

  {    _x setUnitLoadout [[],[],["ACE_Flashlight_Maglite_ML300L","","","",[],[],""],["U_C_CBRN_Suit_01_White_F",[["gm_ge_army_gauzeBandage",1],["gm_ge_army_burnBandage",1],["gm_ge_facewear_m65",1],["gm_ge_headgear_hat_80_m62_oli",1]]],[],["B_SCBA_01_F",[]],"","gm_gc_army_facewear_schm41m",[],["ItemMap","","ItemRadio","gm_ge_army_conat2","ItemWatch",""]];
  } forEach crew _objectUnderCursor;

}] call zen_custom_modules_fnc_register;


["NOT GREAT NOT TERRIBLE - AMBIENT", "Add Gasmask Crew to vehicle (TINFOILS)",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  {
      _x setUnitLoadout [[[],[],["ACE_Flashlight_Maglite_ML300L","","","",[],[],""],["U_C_ConstructionCoverall_Red_F",[["gm_ge_army_gauzeBandage",1],["gm_ge_army_burnBandage",1],["gm_ge_facewear_m65",1],["gm_ge_headgear_hat_80_m62_oli",1]]],[],["B_SCBA_01_F",[]],"H_Hat_Tinfoil_F","gm_gc_army_facewear_schm41m",["ace_dragon_sight","","","",[],[],""],["ItemMap","","ItemRadio","gm_ge_army_conat2","ItemWatch",""]],[]];   
  } forEach crew _objectUnderCursor;

}] call zen_custom_modules_fnc_register;

["NOT GREAT NOT TERRIBLE - AMBIENT", "Add Cultist Crew to vehicle",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  {
      _x addGoggles "rhs_googles_black";
      _x setVariable ["missionControl_role", "saboteur", true];
      [_x, "dev_zombieFace"] remoteExec ["setFace", 0, true];
  } forEach crew _objectUnderCursor;

}] call zen_custom_modules_fnc_register;



["NOT GREAT NOT TERRIBLE - FIXES", "Dismount Player from horse",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  if (isPlayer _objectUnderCursor) then {
    [] remoteExec ["EdalyHorse_fnc_dismount", _objectUnderCursor];
  };

}] call zen_custom_modules_fnc_register;


["NOT GREAT NOT TERRIBLE - AMBIENT", "Spawn Boar Herd",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [ASLtoAGL _position] remoteExec ["grad_missionControl_fnc_boarSpawnHerd", 2];

}] call zen_custom_modules_fnc_register;

["NOT GREAT NOT TERRIBLE - AMBIENT", "Enable Default Boar Behaviour",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  private _herd = _objectUnderCursor getVariable ["boar_herd", []];

  if (count _herd > 0) then {
      {
          _x setVariable ["boar_overide", false, true];
      } forEach _herd;
  } else {
      ["No boar"] call CBA_fnc_notify;
  };

}] call zen_custom_modules_fnc_register;



["NOT GREAT NOT TERRIBLE - AMBIENT", "Start lower Fog Script",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [] remoteExec ["grad_ambient_fnc_ambientFog"];

}] call zen_custom_modules_fnc_register;


["NOT GREAT NOT TERRIBLE - AMBIENT", "STOP lower Fog Script",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  diwako_ambientFogglets = false; publicVariable "diwako_ambientFogglets";

}] call zen_custom_modules_fnc_register;


["NOT GREAT NOT TERRIBLE MUSIC", "Lullaby",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLToAGL _position;

  private _radio = "land_gm_euro_furniture_radio_01" createVehicle [0,0,0];
  _radio setPos _position;

  [_radio, true, [0, .5, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];

  private _song = "music_lullaby_source";
  private _source = createSoundSource [_song, _position, [], 0];
  [_source, _radio, true] call GRAD_missionControl_fnc_soundSourceHelper;

  {
    _x addCuratorEditableObjects [[_radio], false];
  } forEach allCurators;

}] call zen_custom_modules_fnc_register;

["NOT GREAT NOT TERRIBLE MUSIC", "Dark",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLToAGL _position;

  private _radio = "land_gm_euro_furniture_radio_01" createVehicle [0,0,0];
  _radio setPos _position;

  [_radio, true, [0, .5, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];

  private _song = "music_dark_source";
  private _source = createSoundSource [_song, _position, [], 0];
  [_source, _radio, true] call GRAD_missionControl_fnc_soundSourceHelper;

  {
    _x addCuratorEditableObjects [[_radio], false];
  } forEach allCurators;

}] call zen_custom_modules_fnc_register;

["NOT GREAT NOT TERRIBLE MUSIC", "Radio",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLToAGL _position;

  private _radio = "land_gm_euro_furniture_radio_01" createVehicle [0,0,0];
  _radio setPos _position;

  [_radio, true, [0, .5, 1], 10] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];

  private _song = "music_radio_source";
  private _source = createSoundSource [_song, _position, [], 0];
  [_source, _radio, true] call GRAD_missionControl_fnc_soundSourceHelper;

  {
    _x addCuratorEditableObjects [[_radio], false];
  } forEach allCurators;

}] call zen_custom_modules_fnc_register;



["NOT GREAT NOT TERRIBLE MUSIC", "Evil Laugh (object)",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  if (isNull _objectUnderCursor) exitWith {
       ["Needs object to be placed on"] call CBA_fnc_notify;
  };

  [_objectUnderCursor, ["evillaugh", 200]] remoteExec ["say3d"];

}] call zen_custom_modules_fnc_register;

