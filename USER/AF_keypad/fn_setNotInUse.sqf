private _keypadAffected = nearestObject [position player, "Cube5cm_ACR"];

_keyPad setVariable ["AF_KP_keyPadInUse", false, true];

// reset input vars
AF_KP_keypad_InputText = "";
AF_KP_keypad_OutputText = "";