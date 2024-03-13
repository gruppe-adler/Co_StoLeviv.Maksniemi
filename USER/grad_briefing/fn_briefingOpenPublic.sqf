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

// STORY
private _titleStory = "<t size='1.5' color='#99ffffff'>Story</t><br/>";
private _textStory = "<t size='1.0' color='#ffffffff'>In NOT GREAT NOT TERRIBLE 1 an exploding nuclear plant unleashed hordes of mutants and zombies.</t><br/><br/>";

// TASK
private _titleTask = "<t size='1.5' color='#99ffffff'>Task</t><br/>";
private _textTask = "<t size='1.0' color='#ffffffff'>Your task is to eliminate the threat by killing cows at neuralgic points on the map and baiting zombies into the area. At the last objective the fuel truck is meant to function as a bomb to kill the horde.</t><br/><br/>";

// FLOODLIGHTS
private _titleFloodlights = "<t size='1.5' color='#99ffffff'>Floodlights and Generator</t><br/>";
private _textFloodlights = "<t size='1.0' color='#ffffffff'>Floodlights need to be connected to the generator and the generator to be turned on to give light. Take a cable from the generator and connect it with ace interact to a floodlight.</t><br/><br/>";

// COWS
private _titleCowBait =  "<t size='1.5' color='#99ffffff'>Cow Bait</t><br/>";
private _textCowBait = "<t size='1.0' color='#ffffffff'>Take a cow from lowered flatbed and serve it to zombies with a circular saw. Circular Saws are inside the cow vehicle.</t><br/><br/>";

// FUEL
private _titleFuel =  "<t size='1.5' color='#99ffffff'>Fuel Truck</t><br/>";
private _textFuel = "<t size='1.0' color='#ffffffff'>Inside the fuel truck are explosives. Those are meant to be placed at the truck at the last objective to kill as many zombies as possible. Beware the explosion radius is many dozen meters.</t><br/><br/>";


[ parseText
  (
    _titleStory +
    _textStory +
    _titleTask +
    _textTask +
    _titleCowBait +
    _textCowBait +
    _titleFloodLights +
    _textFloodLights +
    _titleFuel +
    _textFuel
  )
] call grad_briefing_fnc_briefingScrollView;

