params ["_positionTomb", "_positionPlayer"];

systemchat (str _positionTomb + " " + str _positionPlayer);

private _skeletonClass = selectRandom [
	"Land_HumanSkeleton_F",
	"Land_HumanSkull_F"
];

private _decalClass = selectRandom [
	"Land_Decal_RoadEdge_Dirt_07_F",
	"Land_Decal_RoadEdge_Dirt_02_F",
	"Land_Decal_RoadEdge_Dirt_06_F",
	"Land_Decal_RoadEdge_Dirt_09_F"
];

private _craterClass = "Land_ShellCrater_01_F";

private _positionFX = (_positionTomb getPos [(_positionPlayer distance _positionTomb)/2, _positionPlayer getDir _positionTomb]);
_positionFX set [2, _positionTomb select 2];

private _skeleton = _skeletonClass createVehicle [_positionFX#0, _positionFX#1, (_positionFX#2) - 0.2 - random 0.1];
_skeleton setDir (random 360);

private _decal = _decalClass createVehicle _positionFX;
_decal setDir (random 360);

private _crater = _craterClass createVehicle [_positionFX#0, _positionFX#1, (_positionFX#2) - 0.1 - random 0.1];
_crater setDir (random 360);
