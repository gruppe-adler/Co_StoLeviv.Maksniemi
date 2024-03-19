private _tombStoneP3Ds = [
    "tombstone_01_f.p3d",
    "tombstone_02_f.p3d",
    "tombstone_03_f.p3d",
    "tombstone_04_f.p3d",
    "tombstone_05_f.p3d",
    "tombstone_06_f.p3d",
    "tombstone_07_f.p3d",
    "tombstone_08_f.p3d",
    "tombstone_09_f.p3d",
    "tombstone_10_f.p3d",
    "tombstone_11_f.p3d",
    "tombstone_12_f.p3d",
    "tombstone_13_f.p3d",
    "tombstone_14_f.p3d",
    "tombstone_15_f.p3d",
    "tombstone_16_f.p3d"
];

grad_loot_tomb_cache = objNull;

[{
	params ["_args", "_handle"];
	_args params ["_tombStoneP3Ds"];

	private _cursorObject = cursorObject;
	if (!isNull _cursorObject) then {
		if (((getModelInfo _cursorObject) select 0) in _tombStoneP3Ds) then {
			private _tombstone = (_cursorObject call BIS_fnc_netId);
			private _data = (missionNameSpace getVariable "grad_loot_tombstoneHashes") getOrDefault [_tombstone, []];
            if (count _data < 1) exitWith {}; // on mission start

			_data params ["_name", "_deathdate", "_epitaph", "_loot"];

			private _text = "<t color='#ffffff' size='2.5'>" + _name + "</t><br /><t size='1.95'>" + _deathdate + "<br /></t><t size='1.8'>" + _epitaph + "</t>"; 
			// spawn BIS_fnc_dynamicText;
            // only flicker when looking at a new stone
            if (grad_loot_tomb_cache != _cursorObject) then {
                grad_loot_tomb_cache = _cursorObject;
			    "normal" cutText [_text, "PLAIN", .2, false, true, true];
            };
		};
	};

}, 1, [_tombStoneP3Ds]] call CBA_fnc_addPerFrameHandler;