params ["_door"];

GRAD_VM_keypadDoor = _door;

_door addAction
[
    "Show Keypad",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        if (_target getVariable ["GRAD_VM_keyPadInUse", false]) then {
            hint "KeyPad already in use";
        } else {
            _target setVariable ["GRAD_VM_keyPadInUse", true, true];
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