params ["_actiondummy"];

private _action = ["Read Name", "Read Name", "", {
    
	private _name = _target getVariable ["grad_loot_name", "Peter Popel"];
	private _deathdate = _target getVariable ["grad_loot_deathdate", call grad_loot_fnc_getDateRange];
	private _epitaph = _target getVariable ["grad_loot_epitaph", call grad_loot_fnc_getEpitaph];

	["<t color='#ffffff' size='1.2'>" + _name + "<br />" + _deathdate + "<br />" + _epitaph + "</t>",-1,-1,.1,1.5,0,789] spawn BIS_fnc_dynamicText;

}, {true}, {}, []] call ace_interact_menu_fnc_createAction;

[_actiondummy, 0, [], _action, true] call ace_interact_menu_fnc_addActionToObject;
