if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

// ["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

if (!(player getVariable ["isMedical",false])) then {
    [player] execVM "INC_undercover\Scripts\initUCR.sqf";
};
