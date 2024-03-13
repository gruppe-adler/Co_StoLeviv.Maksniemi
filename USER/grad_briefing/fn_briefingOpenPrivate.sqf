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

// TEXTS

// COMMON
private _titleCommon = "<t size='2.0' font='Caveat' color='#ffff3333'>Please keep this personal briefing secret.</t><br/><br/>";

private _dynamicTextCombined = "";

// DYNAMIC INTEL
{
	_x params ["_time", "_text"];
	private _titleDynamic = "<t size='1.5' color='#99ff0000'>" + _time + "</t><br/><br/>";
	private _textDynamic= "<t size='1.0' color='#ffffffff'>" + _text + "</t><br/><br/>";

	_dynamicTextCombined = _dynamicTextCombined + _titleDynamic + _textDynamic;
} forEach (player getVariable ["GRAD_dynamicIntelPrivate", []]);

[ parseText
  (
	_titleCommon +
    _dynamicTextCombined
  )
] call grad_briefing_fnc_briefingScrollView;
