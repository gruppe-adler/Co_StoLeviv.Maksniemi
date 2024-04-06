
// allows for giving out intel
["GRAD_telephone_fakeCallStart", {
	params ["_phone", ["_sound", ""], ["_text", ""]];

	private _inteltype = _text; // store for later

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
			["missionControl_curatorInfo", [player, "segmentintel", _text]] call CBA_fnc_globalEvent;
		};
	};

	if (_text == "customintel") then {
		private _cfgentry = toLower(player getVariable ["GRAD_cfgCustomRoles_displayName", ""]);
		private _indexPlayer = player getVariable ["GRAD_cfgCustomRoles_spawnIndex", 1];
		_text = ([((missionConfigFile >> "cfgCustomIntel") >> _cfgentry) >> ("intel" + (str _indexPlayer)),"briefing","nothing"] call BIS_fnc_returnConfigEntry);
		private _marker = ([((missionConfigFile >> "cfgCustomIntel") >> _cfgentry) >> ("intel" + str (_indexPlayer)),"marker","nothing"] call BIS_fnc_returnConfigEntry);
		
		_marker setMarkerAlphaLocal 1;
		private _mapgrid = mapGridPosition getMarkerPos _marker;
		_text = format [_text, _mapgrid];
		diag_log _text;

		// enable marker
		private _existingBriefing = player getVariable ["GRAD_dynamicIntelPrivate", []];
		private _index = _existingBriefing findIf {(_x select 1) == _text};
		if (_index != -1) then {
			_text = "You already have all infos I can share with you.";
		} else {
			["missionControl_curatorInfo", [player, "customintel", _text]] call CBA_fnc_globalEvent;
		};
	};

	// workaround for missing sound in vehicle acceptance
	if (objectParent player != player) then {
		playSoundUI [_sound, 0.5];
		[player, [_sound, 10]] remoteExec ["say3D", allPlayers select { _x != player}];
	};

	["GARBLED VOICE", _text] spawn grad_tasks_fnc_forceSubtitle;

	if (_inteltype != "customintel" && _inteltype != "segmentintel") then {
		["missionControl_curatorInfo", [player, "", _text]] call CBA_fnc_globalEvent;
	};
	
	[{
		params ["_text", "_inteltype"];
		if (_inteltype == "customintel") then {
			[_text, true] call grad_briefing_fnc_briefingAdded;
		} else {
			[_text, false] call grad_briefing_fnc_briefingAdded;
		};
	}, [_text, _inteltype], 5] call CBA_fnc_waitAndExecute;

}] call CBA_fnc_addEventHandler;
