params ["_marker"];

private _keypads = nearestObjects [getMarkerPos _marker, ["land_gm_euro_furniture_telephone_02"], 250];
private _keysDiving = [];
{
	if (_x getVariable ["GRAD_divingKeypad", false]) then {
		_keysDiving pushBackUnique _x;
	};
} forEach _keypads;

if (count _keysDiving < 1) exitWith { "0000" };

private _randomKey = (selectRandom _keysDiving) getVariable ["AF_KP_keycode", "1111"];

_randomKey