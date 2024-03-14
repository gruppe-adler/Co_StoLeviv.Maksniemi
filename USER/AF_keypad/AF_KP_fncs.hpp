//This checks the variables passed in the execVM statments("number","enter" or "clear")

[player, "beep"] remoteExec ["say3D", 0];

switch (_this select 0) do {
	case "number": {
		GRAD_VM_keypad_InputText = GRAD_VM_keypad_InputText + format["%1", _this select 1];
		publicVariable "GRAD_VM_keypad_InputText";
		ctrlSetText[1000, GRAD_VM_keypad_InputText];
	};
	
	case "clear": {
		GRAD_VM_keypad_InputText = "";
		publicVariable "GRAD_VM_keypad_InputText";
		ctrlSetText[1000, GRAD_VM_keypad_ClearText];
	};
	
	case "enter": {
		GRAD_VM_keypad_OutputText = GRAD_VM_keypad_InputText;
		publicVariable "GRAD_VM_keypad_OutputText";
		closeDialog 0;
		GRAD_VM_keypad_InputText = "";
		publicVariable "GRAD_VM_keypad_InputText";

		if (GRAD_VM_keypad_OutputText == "31337") then {
			[] remoteExec ["GRAD_VM_phase0_fnc_keyPadUnlock", 2];
			[player, "target_locked"] remoteExec ["say3D", 0];
		} else {
			 [player, "zoom_fail"] remoteExec ["say3D", 0];
			 hint format["Wrong Code"];
		};
	};
};