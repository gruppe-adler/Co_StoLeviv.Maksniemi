params ["_door", "_keycode"];

_door setVariable ["AF_KP_keycode", _keycode, true];

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
