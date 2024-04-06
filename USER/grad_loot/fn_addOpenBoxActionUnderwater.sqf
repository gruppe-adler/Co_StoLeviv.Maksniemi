params ["_crate"];

["ReammoBox_F", "init", {

	params ["_crate"];

	if (isServer) then {
		_crate enableRopeAttach false;
	};

	if (hasInterface) then {
		private _action = ["AttachHook", "Make slingloadable", "", {
		
			[_target, true] remoteExec ["enableRopeAttach", _target, true];

		}, {true}, {}, []] call ace_interact_menu_fnc_createAction;

		[_crate, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject;
	};


}, true, [], true] call CBA_fnc_addClassEventHandler;