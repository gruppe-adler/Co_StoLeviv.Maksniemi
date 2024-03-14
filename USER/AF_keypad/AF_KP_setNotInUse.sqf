private _keypadAffected = nearestObject [position player, "keypadclassname"];

_keyPad setVariable ["AF_KP_keyPadInUse", false, true];

// reset input vars
AF_KP_keypad_InputText = "";
AF_KP_keypad_OutputText = "";