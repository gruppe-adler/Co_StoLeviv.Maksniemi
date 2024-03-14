//This checks the variables passed in the execVM statments("number","enter" or "clear")

private _keypadAffected = nearestObject [position player, "keypadclassname"]; // todo helper object that is unique for keypads
private _keycode = _keypadAffected getVariable ["AF_KP_keycode", "none"];
private _codeToUnlock = _keypadAffected getVariable ["AF_KP_codeToUnlock", {}];

[player, "beep"] remoteExec ["say3D", 0];

switch (_this select 0) do {
	case "number": {
		AF_KP_keypad_InputText = AF_KP_keypad_InputText + format["%1", _this select 1];
		ctrlSetText[1000, AF_KP_keypad_InputText];
	};
	
	case "clear": {
		AF_KP_keypad_InputText = "";
		ctrlSetText[1000, AF_KP_keypad_clearText];
	};
	
	case "enter": {
		AF_KP_keypad_OutputText = AF_KP_keypad_InputText;
		closeDialog 0;
		AF_KP_keypad_InputText = "";

		if (AF_KP_keypad_OutputText == _keycode) then {
			_keypadAffected call _codeToUnlock;
			[player, "target_locked"] remoteExec ["say3D", 0];
		} else {
			 [player, "zoom_fail"] remoteExec ["say3D", 0];
			 hint format["Wrong Code"];
		};
	};
};
