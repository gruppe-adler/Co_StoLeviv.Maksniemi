private _allObjects = nearestTerrainObjects [[worldsize/2, worldsize/2], ["HIDE"], worldsize/2];

private _tombstones = [];
private _tombStoneP3Ds = [
    "tombstone_01_f.p3d",
    "tombstone_02_f.p3d",
    "tombstone_03_f.p3d",
    "tombstone_04_f.p3d",
    "tombstone_05_f.p3d",
    "tombstone_06_f.p3d",
    "tombstone_07_f.p3d",
    "tombstone_08_f.p3d",
    "tombstone_10_f.p3d",
    "tombstone_11_f.p3d",
    "tombstone_12_f.p3d",
    "tombstone_13_f.p3d",
    "tombstone_14_f.p3d",
    "tombstone_15_f.p3d",
    "tombstone_16_f.p3d"
];

{
    private _p3d = getModelInfo _x select 0;
    if (_p3d in _tombStoneP3Ds) then {
        _tombstones pushbackUnique _x;
    };
} forEach _allObjects;

_tombstones