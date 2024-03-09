params ["_player"];

{
	private _reTailor = 
	['Retailor clothes4','Retailor clothes4', "\A3\ui_f\data\igui\cfg\actions\heal_ca.paa",{

		systemchat str _target;
		if (_target getVariable ['GRAD_isRetailored',false]) then {
			cutText [format["<t size='2.0'>Already retailored this outfit, cant do it again :/</t>"], "PLAIN DOWN"];
			
		} else {
				cutText [format["<t size='2.0'>Good as new. Nobody will recognize you anymore.</t>"], "PLAIN DOWN"];

				player playActionNow "Medic";
				[player, "GRAD_scissors"] remoteExec ["say3D"];
				_target forceAddUniform selectRandom INC_civilianUniforms;
				_target setVariable ["INC_undercoverHandlerRunning", false, true];
				_target setVariable ["INC_isCompromised", false, true];
				_target setVariable ["INC_suspicious", false, true];
				_target setVariable ["INC_cooldown", false, true];
				_target setVariable ["INC_shotAt",false, true];
				_target setVariable ["INC_firedRecent",false, true];
				_target setVariable ["INC_highSecAlert",false, true];
				_target setVariable ["INC_trespassAlert",false, true];
				_target setVariable ["INC_seenByList",[], true];
				_target setVariable ['GRAD_isRetailored',true,true];
		};

	},{[_player, _target, []] call ace_common_fnc_canInteractWith}] call ace_interact_menu_fnc_createAction;

	[_x, 0, ["ACE_MainActions"], _reTailor] call ace_interact_menu_fnc_addActionToObject;
	
} forEach (playableUnits + switchableUnits);



/*
private _sewing = ['Sew Ghillie suit','Ghillie suit','',{

	[player] spawn {
		params ['_unit'];

		"Item_U_I_C_Soldier_Bandit_2_F" in ((vestItems player) + (uniformItems player) + (backpackItems player))

		if ("ItemCorrugated" in magazines player) exitWith {
			cutText [format["You need at least three enemy uniform"], "PLAIN DOWN"];
		};

		player playActionNow "Medic";

		sleep 2;
	};

},{player getVariable ['GRAD_isTailor',false]}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _sewing] call ace_interact_menu_fnc_addActionToObject;


{ 

	private _string = format ["Item_%1", _x]; 
	if (_string == typeOf cursorObject) then { 
		systemchat "found it"; 
	}; 
} forEach INC_incogUniforms;
*/