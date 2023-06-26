params ["_clothesLine"];

private _action = ["Pick up new clothing", "Pick up new clothing", "", {
    
	private _clothingCount = _target getVariable ["grad_clothing_clothesLeft", 0];
	[_target, _clothingCount-1] call grad_clothing_fnc_setClothes;

	private _uniform = selectRandom [
		"gm_gc_civ_uniform_man_01_80_blk",
		"gm_gc_civ_uniform_man_01_80_blu",
		"gm_gc_civ_uniform_man_02_80_brn",
		"gm_ge_civ_uniform_blouse_80_gry",
		"gm_gc_civ_uniform_man_03_80_blu",
		"gm_gc_civ_uniform_man_03_80_grn",
		"gm_gc_civ_uniform_man_03_80_gry",
		"gm_gc_civ_uniform_man_04_80_gry",
		"gm_gc_civ_uniform_man_04_80_blu",
		"gm_xx_army_uniform_fighter_03_brn",
		"gm_xx_army_uniform_fighter_03_blk"
	];

	private _hasLoW = (1325500 in (getDLCs 1));
	
	if (_hasLoW) then {
		if (random 1 > 0.5) then {
			_uniform = selectRandom [
				"U_C_FormalSuit_01_black_F",
				"U_C_FormalSuit_01_blue_F",
				"U_C_FormalSuit_01_gray_F",
				"U_C_FormalSuit_01_khaki_F",
				"U_C_FormalSuit_01_tshirt_black_F",
				"U_C_FormalSuit_01_tshirt_gray_F",
				"U_C_ArtTShirt_01_v6_F",
				"U_C_ArtTShirt_01_v1_F",
				"U_C_ArtTShirt_01_v2_F",
				"U_C_ArtTShirt_01_v4_F",
				"U_C_ArtTShirt_01_v5_F",
				"U_C_ArtTShirt_01_v3_F"
			];
		};
	};

	player addUniform _uniform;
}, {
	private _clothingCount = _target getVariable ["grad_clothing_clothesLeft", 0];
	_clothingCount > 0
}, {}, [], [0,0,1.5]] call ace_interact_menu_fnc_createAction;

[_clothesLine, 0, [], _action, true] call ace_interact_menu_fnc_addActionToObject;
