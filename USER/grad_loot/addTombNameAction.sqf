params ["_actiondummy"];

private _action = ["Read Name", "Read Name", "", {

	params ["_target", "_player", "_params"];
    
	private _name = _target getVariable ["grad_loot_name", "Peter Popel"];
	private _deathdate = _target getVariable ["grad_loot_deathdate", "1.1.1932 - 23.12.1983"];
	private _epitaph = _target getVariable ["grad_loot_epitaph", "He didnt die in vain."];

	["<t color='#ffffff' size='1.2'>" + _name + "<br />" + _deathdate + "<br />" + _epitaph + "</t>",-1,-1,.1,1.5,0,789] spawn BIS_fnc_dynamicText;

}, {true}, []] call ace_interact_menu_fnc_createAction;

[_actiondummy, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject;
