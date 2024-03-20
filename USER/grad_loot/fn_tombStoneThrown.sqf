params ["_p3d", "_positionworld", "_dir"];

private _tombStoneThrown = createSimpleObject [_p3d, [0,0,0], true];
(_tombStoneThrown call BIS_fnc_boundingBoxDimensions) params ["_width", "_depth", "_height"];
_tombStoneThrown setPosWorld [_positionWorld#0, _positionWorld#1, _positionWorld#2 - _depth/2];
_tombStoneThrown setDir _dir;
_tombStoneThrown setVectorUp [0,1,0];
_tombStoneThrown disableCollisionWith player;
