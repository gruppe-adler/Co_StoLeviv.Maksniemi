if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_player"];

private _roleAssigned = false;
while { !_roleAssigned } do {
	private _assignmentAvailable = missionNamespace getVariable ["GRAD_roleAssignmentAvailable", true];
	if (_assignmentAvailable) then {
		[_player] call grad_roles_fnc_executeRoleAssignment;
		_roleAssigned = true;
	} else {
		sleep (random 0.5);
	};
};