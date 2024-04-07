
private _dates = [];

while { count _dates < 900 } do {

	private _daybirth = [1,30] call BIS_fnc_randomInt;
	private _monthbirth = [1,12] call BIS_fnc_randomInt;

	private _min = 1880;
	private _mid = 1950;
	private _max = 2010;
	private _yearbirth = round (random [_min, _mid, _max]);

	private _daydeath = [1,30] call BIS_fnc_randomInt;
	private _monthdeath = [1,12] call BIS_fnc_randomInt;
	private _yeardeath = round (random [_yearbirth, _yearbirth + 45, _yearbirth + 90]) min 2010;

	// we dont want to calculate real dates really
	if (_yearbirth == _yeardeath) then {
		_yeardeath = _yeardeath + 1;
	};

	private _string = str _daybirth + "." + str _monthbirth + "." + str _yearbirth + " - " + str _daydeath + "." + str _monthdeath + "." + str _yeardeath;

	_dates pushBackUnique _string;

};

_dates
