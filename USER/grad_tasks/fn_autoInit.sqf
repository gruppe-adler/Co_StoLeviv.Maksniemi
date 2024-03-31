

private _taskCommon = ""; // common task everyone gets
private _taskLootTomb = ""; // task for a loot item on cemetery (~25% of players)
private _taskLootHouse = ""; // task for loot in hunters/grandpas/uncles mökki (~10% of players)
private _taskLoot = "";

private _taskObjective1 = ""; // task for getting ammunition from train
private _taskObjective2 = ""; // task for getting ammunition from small military base
private _taskObjective3 = ""; // task for stealing a tank
private _taskObjective4 = ""; // task for sinking ships in harbor
private _taskObjective5 = ""; // task for ambushing convoy/getting ammunition there


// [owner, taskID, description, destination, state, priority, showNotification, type, visibleIn3D] call BIS_fnc_taskCreate



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

	["GARBLED VOICE", _text] spawn grad_tasks_fnc_forceSubtitle;
	
	[{
		[_this] call grad_briefing_fnc_briefingAdded;
	}, _text, 5] call CBA_fnc_waitAndExecute;

	

}] call CBA_fnc_addEventHandler;
