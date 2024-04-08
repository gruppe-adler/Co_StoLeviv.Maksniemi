/*
Parameter(s):
	_this select 0: ARRAY in format
		[text,picture]
			* text: STRING - hint text
			* picture: STRING - picture
		[item1,item2...] - Listbox item ARRAYs in format
			[itemText,itemDescription,picture,icon]
				* itemText: STRING - Text displayed in listbox
				* itemDescription (Optional): STRING - text displayed after clicking on item
				* picture (Optional): STRING - picture displayed after clicking on item
				* icon (Optional): STRING - icon displayed in listbox left from text
	_this select 1 (Optional): STRING - hint header
	_this select 2 (Optional): ARRAY - [STRING,CODE,NUMBER] - text on left button (when "", button is hidden), code executed upon clicking and fade out delay. If only text is present, button is disabled.
	_this select 3 (Optional): ARRAY - [STRING,CODE,NUMBER] - STRING - text on right button and code executed upon clicking
	_this select 4 (Optional): ARRAY - [STRING,CODE,NUMBER] - STRING - text on middle button and code executed upon clicking
	_this select 5 (Optional): NUMBER or ARRAY - width or [width,height] of picture (in grid coordinates). Width > 17 means only picture is used.

*/

params ["_player"];

// TEXTS

// COMMON
private _titleCommon = "<t size='2.0' font='RobotoCondensedBold' color='#ffff3333'>Personal intel. Share only with people you trust!</t><br/><br/>";

private _dynamicTextCombined = "General tips: <br/>
* You can check your disguise with self interact (if russians will shoot you)<br/><br/>
* You can change clothes at your home up to 5 times to reset your disguise state<br/><br/>
* If you are down, Docs will get your position and will revive you at the hospital<br/><br/>
<br/><br/>
Gameplay:<br/>
* Please do not use global chat or markers (Gentlemans agreement)
* If you are completely lost, go to the nearest phone booth and ping zeus, we call back<br/><br/>";

// DYNAMIC INTEL
{
	_x params ["_time", "_text"];
	private _titleDynamic = "<t size='1.0' font='RobotoCondensed' color='#99ffffff'>" + _time + "</t><br/>";
	private _textDynamic= "<t size='1.0' font='RobotoCondensed' color='#ffffffff'>" + _text + "</t><br/><br/><br/>";

	_dynamicTextCombined = _dynamicTextCombined + _titleDynamic + _textDynamic;
} forEach (_player getVariable ["GRAD_dynamicIntelPrivate", []]);

if (_dynamicTextCombined == "") then {
	_dynamicTextCombined = "No personal intel collected so far.";
};

[ parseText
  (
	_titleCommon +
    _dynamicTextCombined
  )
] call grad_briefing_fnc_briefingScrollView;
