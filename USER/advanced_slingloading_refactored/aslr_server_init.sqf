
if(isServer) then {
	
	// Adds support for exile network calls (Only used when running exile) //
	
	ASLR_SUPPORTED_REMOTEEXECSERVER_FUNCTIONS = ["ASLR_Hide_Object_Global"];

	ExileServer_AdvancedSlingLoading_network_AdvancedSlingLoadingRemoteExecServer = {
		params ["_sessionId", "_messageParameters",["_isCall",false]];
		_messageParameters params ["_params","_functionName"];
		if(_functionName in ASLR_SUPPORTED_REMOTEEXECSERVER_FUNCTIONS) then {
			if(_isCall) then {
				_params call (missionNamespace getVariable [_functionName,{}]);
			} else {
				_params spawn (missionNamespace getVariable [_functionName,{}]);
			};
		};
	};
	
	ASLR_SUPPORTED_REMOTEEXECCLIENT_FUNCTIONS = ["ASLR_Pickup_Ropes","ASLR_Deploy_Ropes_Index","ASLR_Rope_Set_Mass","ASLR_Extend_Ropes","ASLR_Shorten_Ropes","ASLR_Release_Cargo","ASLR_Retract_Ropes","ASLR_Deploy_Ropes","ASLR_Hint","ASLR_Attach_Ropes","ASLR_Drop_Ropes"];
	
	ExileServer_AdvancedSlingLoading_network_AdvancedSlingLoadingRemoteExecClient = {
		params ["_sessionId", "_messageParameters"];
		_messageParameters params ["_params","_functionName","_target",["_isCall",false]];
		if(_functionName in ASLR_SUPPORTED_REMOTEEXECCLIENT_FUNCTIONS) then {
			if(_isCall) then {
				_params remoteExecCall [_functionName, _target];
			} else {
				_params remoteExec [_functionName, _target];
			};
		};
	};

	diag_log "aslr server loaded";	
};

