private _daybirth = [1,30] call BIS_fnc_randomInt;
private _monthbirth = [1,12] call BIS_fnc_randomInt;
private _yearbirth = [1924,2022] call BIS_fnc_randomInt;

private _daydeath = [1,30] call BIS_fnc_randomInt;
private _monthdeath = [1,12] call BIS_fnc_randomInt;
private _yeardeath = [1924,2022] call BIS_fnc_randomInt;

if (_yearbirth > _yeardeath) then {
	private _birthnew = _yeardeath;
	_yearbirth = _birthnew;
	_yeardeath = _yearbirth;
};

// we dont want to calculate real dates really
if (_yearbirth == _yeardeath) then {
	_yeardeath = _yeardeath + 1;
};

private _string = str _daybirth + "." + str _monthbirth + "." + str _yearbirth + " - " + str _daydeath + "." + str _monthdeath + "." + str _yeardeath;

_string