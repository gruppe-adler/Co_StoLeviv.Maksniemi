class engineer {
    role = "Engineer";
    briefing = "You can repair any vehicle with your golden hands.";
    code = "(_this select 0) setVariable ['ACE_isEngineer', 2, true];";
};

class necromancer {
    role = "Necromancer";
    briefing = "You are a weirdo. Why? You are convinced you are a medium an you can speak to the dead.";
    code = "(_this select 0) call grad_necromancing_fnc_initNecro;";
};

class emergency {
    role = "Emergency Doctor";
    briefing = "You are a neutral party and cannot carry weapons. <br/><br/>The most important thing is: Russians won't open fire on you.";
    code = "(_this select 0) call grad_customMedicSystem_fnc_initMedic;";
};

