

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


{
	
} forEach (playableUnits + switchableUnits);

["Land_PhoneBooth_02_malden_F", "init", {
		private _booth = (_this select 0);

		if (local _booth) then {
			[_booth] remoteExec ["grad_tasks_fnc_addPhoneAction", 0, _booth];
		};
		
	}, true, [], true] call CBA_fnc_addClassEventHandler;
