
// land_gm_euro_misc_clothesline_01
// land_gm_euro_misc_clothesline_02
// ["clothing_1_0","clothing_1_1","clothing_2_0","clothing_2_1","clothing_3_0","clothing_3_1","clothing_4_0","clothing_4_1","clothing_5_0","clothing_5_1"]

[] spawn {
	waitUntil { time > 2};
	["land_gm_euro_misc_clothesline_01", "init", {
		private _clothesLine = (_this select 0);

		if (local _clothesLine) then {
			[_clothesLine, 5] call grad_clothing_fnc_setClothes;
			[_clothesLine] remoteExec ["grad_clothing_fnc_addAction", 0, _clothesLine];
		};
		
	}, true, [], true] call CBA_fnc_addClassEventHandler;


	["land_gm_euro_misc_clothesline_02", "init", {
		private _clothesLine = (_this select 0);

		if (local _clothesLine) then {
			[_clothesLine, 5] call grad_clothing_fnc_setClothes;
			[_clothesLine] remoteExec ["grad_clothing_fnc_addAction", 0, _clothesLine];
		};
	}, true, [], true] call CBA_fnc_addClassEventHandler;
};