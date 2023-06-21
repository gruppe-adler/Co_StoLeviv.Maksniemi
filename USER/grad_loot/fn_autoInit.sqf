

grad_lootnames = [
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"10",
	"11",
	"12",
	"13",
	"14",
	"15",
	"16",
	"17",
	"18",
	"19",
	"20",
	"21",
	"22",
	"23",
	"24",
	"25",
	"26",
	"27",
	"28",
	"29",
	"30",
	"31",
	"32",
	"33",
	"34",
	"35",
	"36",
	"37",
	"38",
	"39",
	"40",
	"41",
	"42",
	"43",
	"44",
	"45",
	"46",
	"47",
	"48",
	"49",
	"50",
	"51",
	"52",
	"53",
	"54",
	"55",
	"56",
	"57",
	"58",
	"59",
	"60",
	"61",
	"62",
	"63",
	"64"
];

// tombstone loot
private _tombStones = call grad_loot_fnc_getTombStones;


{
	private _tombstone = _x;

	["Item_rhs_weap_m38", getPosATL _x, 1, true] remoteExec ["grad_loot_fnc_createLoot", 0, _x];

	private _actiondummy = "Sign_Sphere10cm_F" createVehicle [0,0,0];
	_actiondummy setPosATL getPosATL _tombstone;

	_tombstone setVariable ["grad_loot_actiondummy", _dummy, true];
	_actiondummy setVariable ["grad_loot_name", grad_lootnames select _foreachindex, true];
	
	[_actiondummy] remoteExec ["grad_loot_fnc_addTombNameAction", 0, _x];
	
} forEach _tombStones;
