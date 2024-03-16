params ["_text"];
[_text] spawn
{
  params ["_text"];
	disableSerialization;

  // CREATE DISPLAY
	private _display = (if (is3DEN) then {findDisplay 313} else {[] call BIS_fnc_displayMission}) createDisplay "RscDisplayEmpty";

  // CREATE SCROLLVIEW
  private _controlGroup = _display ctrlCreate ["RscControlsGroup", -1];
  _controlGroup ctrlSetPosition [0,0,1,1];
  _controlGroup ctrlCommit 0;

  // CREATE TEXT
	private _textControl = _display ctrlCreate ["RscStructuredText", -1, _controlGroup];
	_textControl ctrlSetPosition [0.1,0.1,0.8,1];
	_textControl ctrlSetBackgroundColor [0,0,0,0.8];
  _textControl ctrlSetStructuredText _text;
  _textControl ctrlCommit 0;


};
