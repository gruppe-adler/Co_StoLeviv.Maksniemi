
// land_gm_euro_misc_clothesline_01
// land_gm_euro_misc_clothesline_02
// ["clothing_1_0","clothing_1_1","clothing_2_0","clothing_2_1","clothing_3_0","clothing_3_1","clothing_4_0","clothing_4_1","clothing_5_0","clothing_5_1"]

if (isServer) then {
	[] spawn {
		waitUntil { time > 2};

		{
			private _clothesLine = _x;
			[_clothesLine, 5] call grad_clothing_fnc_setClothes;
			[_clothesLine] remoteExec ["grad_clothing_fnc_addAction", 0, _clothesLine];
		} forEach allMissionObjects "land_gm_euro_misc_clothesline_01";

		{
			private _clothesLine = _x;
			[_clothesLine, 5] call grad_clothing_fnc_setClothes;
			[_clothesLine] remoteExec ["grad_clothing_fnc_addAction", 0, _clothesLine];
		} forEach allMissionObjects "land_gm_euro_misc_clothesline_02";
		
	};
};