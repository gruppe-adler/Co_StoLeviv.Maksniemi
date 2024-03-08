class engineer {
    role = "Engineer";
    briefing = "You can repair any vehicle with your golden hands.";
    code = "(_this select 0) setVariable ['ACE_isEngineer', 2, true];";
};

class emergency {
    role = "Emergency Doctor";
    briefing = "You are a neutral party and cannot carry weapons. <br/><br/>The most important thing is: Russians won't open fire on you.";
    code = "(_this select 0) call grad_customMedicSystem_fnc_initMedic;";
};

class hunter {
    role = "Hunter";
    briefing = "You know the location of a bolt action rifle. You are invaluable in early game.";
    code = "";
};

class tailor {
    role = "Tailor";
    briefing = "You are a tailor. Your special ability is to sow guillie suites out of 3 enemy uniforms";
    code = "";
};

class tankcrew {
    role = "Tank Crew";
    briefing = "You have been driving tanks in the past. You can drive as well as shoot them";
    code = "";
};
