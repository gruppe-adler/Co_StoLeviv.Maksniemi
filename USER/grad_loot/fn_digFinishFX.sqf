params ["_p3d", "_actionDummy", "_positionPlayer"];

private _positiontomb = getPos _actionDummy;

private _tombStoneThrown = createSimpleObject [_p3d, [0,0,0]];
_tombStoneThrown setPosASL getPosASL player;
_tombStoneThrown setVectorDirAndUp [[0,1,0], [1,0,0]];
_actionDummy setPos getPos player;

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
_positionFX set [2, 0];

private _skeleton = _skeletonClass createVehicle [0,0,0];
_skeleton setDir (random 360);
_skeleton setPosATL [_positionFX#0, _positionFX#1, (_positionFX#2) - 0.2 - random 0.1];

private _decal = _decalClass createVehicle [0,0,0];
_decal setDir (random 360);
_decal setPosATL _positionFX;

private _crater = _craterClass createVehicle [0,0,0];
_crater setDir (random 360);
_crater setPosATL [_positionFX#0, _positionFX#1, (_positionFX#2) - 0.1 - random 0.1];

