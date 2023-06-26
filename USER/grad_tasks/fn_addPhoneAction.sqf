params ["_booth"];

private _action = ["Pick up phone", "Pick up phone", "", {
    
	// todo
}, {
	private _ringing = _target getVariable ["grad_tasks_phoneRinging", false];
	_ringing
}, {}, [], [0,0,1.5]] call ace_interact_menu_fnc_createAction;

[_booth, 0, [], _action, true] call ace_interact_menu_fnc_addActionToObject;
