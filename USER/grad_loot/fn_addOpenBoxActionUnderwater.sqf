params ["_crate"];

["ReammoBox_F", "init", {

	params ["_crate"];

	private _action = ["Open", "Open Crate", "", {
    
		player action ["Gear", _target];

	}, {true}, {}, []] call ace_interact_menu_fnc_createAction;

	[_crate, 0, [], _action, true] call ace_interact_menu_fnc_addActionToObject;


}, true, [], true] call CBA_fnc_addClassEventHandler;