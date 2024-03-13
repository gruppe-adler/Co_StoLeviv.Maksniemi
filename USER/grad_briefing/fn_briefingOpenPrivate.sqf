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

// SABOTEUR
private _titleSaboteur =  if ((player getVariable ["missionControl_role", "none"]) == "saboteur") then {
  "<t size='1.5' color='#99ffffff'>Saboteur!</t><br/><br/>" } else { "" };
private _textSaboteur = if ((player getVariable ["missionControl_role", "none"]) == "saboteur") then { "<t size='1.0' color='#ffffffff'>Zombies have rights too! You secretly sympathize with Zombies and their supporting cultist faction. Try to covertly sabotage the mission by deflating tires, sabotaging engines or fuel tanks and shutting off power (ACE Interact). _Wait till the third objective for this!_ Be aware of others watching you. Dont trust anyone, not even your buddy!</t><br/><br/>" } else { "" };

// PTL
private _titlePTL =  if ((player getVariable ["missionControl_role", "none"]) == "ptl") then {
  "<t size='1.5' color='#99ffffff'>PTL</t><br/><br/>" } else { "" };
private _textPTL = if ((player getVariable ["missionControl_role", "none"]) == "ptl") then { "<t size='1.0' color='#ffffffff'>There is a cultist faction that sympathizes with Zombies and might try to sabotage your mission. They might be even inside your forces. Prevent this at all costs and dont trust anyone!</t><br/><br/>" } else { "" };


// CULTIST
private _titleCultist =  if ((player getVariable ["missionControl_role", "none"]) == "mutant") then {
  "<t size='1.5' color='#99ff0000'>Cultist</t><br/><br/>" } else { "" };
private _textCultist= if ((player getVariable ["missionControl_role", "none"]) == "mutant") then { "<t size='1.0' color='#ffffffff'>You are part of the cultist faction now. <br/><br/>You dont need a mask, you can perform a ritual to spawn a horse for travel, zombies or other monsters. You can even teleport. Beware all those actions can be seen and heard and need Mana. Your Mana slowly replenishes automatically. Self Interact to activate NVG.<br/><br/>Prevent those zombie hating invaders from leaving the area alive! Please dont pick up weapons.<br/><br/>If you are bored or just want to spectate, you can do so. Beware there is no way back.</t><br/><br/>" } else { "" };



[ parseText
  (
	_titleCommon +
    _titleSaboteur +
    _textSaboteur +
    _titlePTL +
    _textPTL +
    _titleCultist +
    _textCultist +
    _titleBuddy +
    _textBuddy
  )
] call grad_briefing_fnc_briefingScrollView;
