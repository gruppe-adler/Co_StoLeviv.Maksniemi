
// allows for giving out intel
["GRAD_telephone_fakeCallAccept", {
	params ["_phone", ["_sound", ""], ["_text", ""]];

	if (_text == "segmentintel") then {
		private _segment = player getVariable ["GRAD_roles_segment", 0];
		_text = getText(((missionConfigFile >> "cfgCustomTasks") select _segment) >> "briefing");
		private _marker = getText(((missionConfigFile >> "cfgCustomTasks") select _segment) >> "marker");
		_marker setMarkerAlphaLocal 1;
		private _mapgrid = mapGridPosition getMarkerPos _marker;
		_text = format [_text, _mapgrid];
		diag_log _text;

		// enable marker
		private _existingBriefing = player getVariable ["GRAD_dynamicIntelPublic", []];
		private _index = _existingBriefing findIf {(_x select 1) == _text};
		if (_index != -1) then {
			_text = "You already have all infos I can share with you.";
		} else {
			["missionControl_curatorInfo", [player, "segmentintel"]] call CBA_fnc_serverEvent;
		};
	};

	// workaround for missing sound in vehicle acceptance
	if (objectParent player != player) then {
		playSound [_sound, true, 0];
	};

	["GARBLED VOICE", _text] spawn grad_tasks_fnc_forceSubtitle;
	
	[{
		[_this] call grad_briefing_fnc_briefingAdded;
	}, _text, 5] call CBA_fnc_waitAndExecute;

	

}] call CBA_fnc_addEventHandler;
