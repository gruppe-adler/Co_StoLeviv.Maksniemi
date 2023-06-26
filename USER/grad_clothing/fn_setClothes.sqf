params ["_clothesLine", "_count"];

_clothesLine setVariable ["grad_clothing_clothesLeft", _count, true];

{
	if ((_count-1) >= _forEachIndex) then {
		_clothesLine animate [_x, 0];
	} else {
		_clothesLine animate [_x, 1];
	};
} forEach [
	"clothing_1_0","clothing_2_0","clothing_3_0","clothing_4_0","clothing_5_0"
];

{
		_clothesLine animate [_x, 0];
} forEach [
	"clothing_1_1","clothing_2_1","clothing_3_1","clothing_4_1","clothing_5_1"
];