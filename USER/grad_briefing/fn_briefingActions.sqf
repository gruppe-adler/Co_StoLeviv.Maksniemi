if (!hasInterface) exitWith {};

private _action = ["Briefing", "Briefing", "data\interact_werwolf.paa", {
        
    },{
         alive player
    }] call ace_interact_menu_fnc_createAction;
    
[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;

private _openBriefing =
[
  "OpenPublicBriefing",
  "Public Briefing",
  "data\interact_briefing.paa",
  {
      [] call grad_missionControl_fnc_briefingOpenPublic;
  },
  {
      alive player
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Briefing"], _openBriefing] call ace_interact_menu_fnc_addActionToClass;


private _privateBriefing =
[
  "OpenPersonalBriefing",
  "Personal Briefing",
  "data\interact_secret.paa",
  {
      [] call grad_missionControl_fnc_briefingOpenPrivate;
  },
  {
      alive player
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Briefing"], _privateBriefing] call ace_interact_menu_fnc_addActionToClass;
