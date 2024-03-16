class cfgRoles {

    class engineer {
        role = "Engineer";
        briefing = "You can repair any vehicle with your golden hands.";
        code = "_this setVariable ['ACE_isEngineer', 2, true];";
        spawn = "mrk_spawn_engineer";
    };

    class emergency {
        role = "Emergency Doctor";
        briefing = "You are a neutral party and cannot carry weapons. <br/><br/>The most important thing is: Russians won't open fire on you.";
        code = "_this call grad_customMedicSystem_fnc_initMedic;";
        spawn = "mrk_spawn_emergency";
    };

    class hunter {
        role = "Hunter";
        briefing = "You know the location of a bolt action rifle and you can imitate animal sounds for communication over long distances. You are invaluable in early game.";
        code = "";
        spawn = "mrk_spawn_hunter";
    };

    class tailor {
        role = "Tailor";
        briefing = "You are a tailor. You can disguise your friends so enemies wont recognize them again after they became sus.";
        code = "";
        spawn = "mrk_spawn_tailor";
    };

    class tankcrew {
        role = "Tank Crew";
        briefing = "You have been driving tanks in the past. You can drive as well as shoot them.";
        code = "";
        spawn = "mrk_spawn_tankcrew";
    };

    class hacker {
        role = "Hacker";
        briefing = "You are able to hack any keypad and computer.";
        code = "";
        spawn = "mrk_spawn_hacker";
    };

};