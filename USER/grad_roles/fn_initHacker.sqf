params ["_player"];


 ["cameraView", {
		
	private _currentNVGState = player getVariable ["grad_roles_thermals", false];
	
	if (_currentNVGState) then {
		
		player linkitem "gm_ge_facewear_acidgoggles";
		(player) action ["nvGoggles", (player)];



		[] spawn {
			sleep 0.1;
			private _ppeffect = ppEffectCreate ["Resolution", 5000];
				
			_ppeffect ppEffectEnable true;
			_ppeffect ppEffectAdjust [20];
			_ppeffect ppEffectCommit 0;
			_ppeffect ppEffectForceInNVG true;

			_ppeffect ppEffectAdjust [600];
			_ppeffect ppEffectCommit 10;

			player setVariable ["grad_roles_ppeffect", _ppeffect];
		};
	
		
	} else {
		(player) action ["nvGogglesOff", (player)];
		player removeItem "gm_ge_facewear_acidgoggles";

		private _ppeffect = player getVariable ["grad_roles_ppeffect", -1];
		_ppeffect ppEffectEnable false;
		ppEffectDestroy _ppeffect;
	};
	
}] call CBA_fnc_addPlayerEventHandler;



private _nightVisionOn =
[
  "GetNightVision",
  "Switch to Hacker Goggles",
  "",
  {
	
	  player linkitem "gm_ge_facewear_acidgoggles";
      player action ["nvGoggles", player];
      player setVariable ["grad_roles_thermals", true, true];

	  [] spawn {
		sleep 0.1;
			private _ppeffect = ppEffectCreate ["Resolution", 5000];
				
			_ppeffect ppEffectEnable true;
			_ppeffect ppEffectAdjust [10];
			_ppeffect ppEffectCommit 0;
			_ppeffect ppEffectForceInNVG true;

			_ppeffect ppEffectAdjust [200];
			_ppeffect ppEffectCommit 10;

			player setVariable ["grad_roles_ppeffect", _ppeffect];

			0 fadeMusic 0;
			playMusic "Hackers";
			1 fadeMusic 1;
		};
  },
  {
      player getVariable ["GRAD_cfgCustomRoles_displayName", "none"] == "Hacker" &&
      currentVisionMode player == 0
  },
  {}
] call ace_interact_menu_fnc_createAction;


[(typeOf player), 1, ["ACE_SelfActions"], _nightVisionOn] call ace_interact_menu_fnc_addActionToClass;

private _nightVisionOff =
[
  "DisableNightVision",
  "Remove Hacker Goggles",
  "",
  {
      player action ["nvGogglesOff", player];
      player setVariable ["grad_roles_thermals", false, true];

	[] spawn {
		0.5 fadeMusic 0;
		sleep 0.6;
		playMusic "";
		0 fadeMusic 1;
	};
	  player removeItem "gm_ge_facewear_acidgoggles";

		private _ppeffect = player getVariable ["grad_roles_ppeffect", -1];
		_ppeffect ppEffectEnable false;
		ppEffectDestroy _ppeffect;
  },
  {
      player getVariable ["GRAD_cfgCustomRoles_displayName", "none"] == "Hacker" &&
      currentVisionMode player == 1
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions"], _nightVisionOff] call ace_interact_menu_fnc_addActionToClass;
