class cfgRoles {

    class engineer {
        role = "Engineer";
        briefing = "You can repair any vehicle with your golden hands. You can drive boats too.";
        code = "(_this select 0) setVariable ['ACE_isEngineer', 2, true];";
    };

    class emergency {
        role = "Emergency Doctor";
        briefing = "You are a neutral party and cannot carry weapons. <br/><br/>The most important thing is: Russians won't open fire on you.";
        code = "(_this select 0) call grad_customMedicSystem_fnc_initMedic;";
    };

    class hunter {
        role = "Hunter";
        briefing = "You know the location of a bolt action rifle and you can imitate animal sounds for communication over long distances. You are invaluable in early game.";
        code = "";
    };

    class tailor {
        role = "Tailor";
        briefing = "You are a tailor. You can disguise your friends so enemies wont recognize them again after they became sus.";
        code = "";
    };

    class tankcrew {
        role = "Tank Crew";
        briefing = "You have been driving tanks in the past. You can drive as well as shoot them.";
        code = "";
    };

    class radionerd {
        role = "Radio Nerd";
        briefing = "You are a hobby radio dude. Your communication abilities are invaluable.";
        code = "";
    };

    class explosive {
        role = "Explosive Dude";
        briefing = "You can plant and defuse explosives.";
        code = "";
    };

};