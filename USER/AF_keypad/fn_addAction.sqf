/*

	[this, "11333", {
		{
			private _selName = _x select 0;

			if (_selName select [0,5] == "door_") exitWith
			{
				_target setVariable ["bis_disabled_" + _selName, 0, true];
			};
		} forEach selectionNames (_this);
	}] execVM "USER\AF_keypad\AF_KP_addAction.sqf";

*/


params ["_door", ["_keycode", "none"], ["_unlockCode", { systemchat "no unlock code provided;" }]];

_door setVariable ["AF_KP_keycode", _keycode];
_door setVariable ["AF_KP_codeToUnlock", _unlockCode];

_door addAction
[
    "Show Keypad",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        if (_target getVariable ["AF_KP_keyPadInUse", false]) then {
            hint "KeyPad already in use";
        } else {
            _target setVariable ["AF_KP_keyPadInUse", true, true];
            createDialog "AF_Keypad";
        };
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "true",     // condition
    3,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];
