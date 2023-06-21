private _allObjects = nearestTerrainObjects [[worldsize/2, worldsize/2], [], worldsize/2];

private _tombstones = [];

{
    if (getModelInfo _x select 0 == "tombstone_08.p3d") then {
        _tombstones pushbackUnique _x;
    };
} forEach _allObjects;

_tombstones