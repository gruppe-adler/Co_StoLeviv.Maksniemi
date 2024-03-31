class cfgCustomRoles {
    class engineer {
        role = "Engineer";
        briefing = "You can repair any vehicle with your golden hands.";
        code = "_this setVariable ['ACE_isEngineer', 2, true];";
        spawn = "mrk_spawn_engineer";
        uniform[] = {"UK3CB_ION_B_U_SF_Uniform_SHIRT_01_WDL","UK3CB_ION_B_U_SF_Uniform_SHIRT_05_WDL", "UK3CB_ION_B_U_SF_Uniform_Short_Shirt_04_WDL","UK3CB_ION_B_U_SF_Uniform_Short_Shirt_05_WDL","UK3CB_ION_B_U_SF_Uniform_Short_Shirt_06_WDL","UK3CB_ION_B_U_SF_Uniform_Short_Shirt_08_WDL"};
        headgear[] = {"H_Bandanna_blu", "H_Bandanna_gry", "vn_b_bandana_03", "H_Bandanna_sgg", "rhssaf_bandana_smb"};
    };

    class hunter {
        role = "Hunter";
        briefing = "You know the location of a bolt action rifle and a pumpgun in your hunting hut.";
        code = "";
        spawn = "mrk_spawn_hunter";
        uniform[] = {"UK3CB_ADC_C_Hunter_U_05", "UK3CB_ADC_C_Hunter_U_10","UK3CB_ADC_C_Hunter_U_06", "UK3CB_ADC_C_Hunter_U_07", "U_C_HunterBody_grn"};
        headgear[] = {"vn_o_boonie_vc_01_01", "vn_b_boonie_01_01", "vn_b_boonie_04_09", "vn_b_boonie_03_01", "rhssaf_booniehat_woodland"};
    };

    class tailor {
        role = "Tailor";
        briefing = "You are a tailor. You can disguise your friends so enemies wont recognize them again after they became sus.";
        code = "";
        spawn = "mrk_spawn_tailor";
        uniform[] = {"U_C_FormalSuit_01_blue_F", "U_C_FormalSuit_01_tshirt_gray_F", "U_C_FormalSuit_01_khaki_F", "UK3CB_CHC_C_U_BODYG_01", "UK3CB_CHC_C_U_FUNC_02", "UK3CB_CHC_C_U_POLITIC_03"};
        headgear[] = {"H_Hat_Safari_sand_F", "H_Hat_Safari_olive_F", "UK3CB_H_Profiteer_Cap_01", "UK3CB_H_Cap_Back_ION_BLK"};
    };

    class tankcrew {
        role = "Tankcrew";
        briefing = "You have been driving tanks in the past. You can drive as well as shoot them.";
        code = "";
        spawn = "mrk_spawn_tankcrew";
        uniform[] = {"UK3CB_CHC_C_U_Overall_02", "UK3CB_CHC_C_U_Overall_04", "UK3CB_CHC_C_U_Overall_03", "UK3CB_CHC_C_U_Overall_01", "UK3CB_CHC_C_U_Overall_05"};
        headgear[] = {"UK3CB_H_Bandanna_Camo", "UK3CB_H_Beanie_02_BLK", "UK3CB_H_Woolhat_CBR", "UK3CB_H_Beanie_02_GRY", "UK3CB_H_Bandanna_Brown_Check"};
    };

    class boatcrew {
        role = "boatcrew";
        briefing = "Your house is on an island. Naturally you can drive boats - which others cannot.";
        code = "";
        spawn = "mrk_spawn_boatcrew";
        uniform[] = {"gm_gc_civ_uniform_man_04_80_blu", "gm_gc_civ_uniform_man_04_80_gry", "UK3CB_U_KZS_DOWN_KHK"};
        headgear[] = {"UK3CB_H_Woolhat_CBR", "UK3CB_H_Beanie_02_GRY", "rhs_beanie_green", "gm_ge_headgear_hat_beanie_blk"};
    };

    class hacker {
        role = "Hacker";
        briefing = "You are able to hack any keypad and computer. You can switch on your hacky NVG goggles with self interact";
        code = "";
        spawn = "mrk_spawn_hacker";
        uniform[] = {"U_C_E_LooterJacket_01_F", "U_I_L_Uniform_01_tshirt_black_F", "U_I_L_Uniform_01_tshirt_skull_F", "U_I_L_Uniform_01_tshirt_sport_F"};
        headgear[] = {"vn_b_headband_04", "vn_c_headband_01", "vn_b_headband_01", "vn_o_pl_cap_02_02", "vn_o_pl_cap_02_01"};
    };
};

class cfgRoleEmergency {
    class emergency {
        role = "Emergency";
        briefing = "You are a neutral party and cannot carry weapons. <br/><br/>The most important thing is: Russians won't open fire on you. You are tasked with reviving players and helping them without interfering in combat.";
        briefingPrivate = "";
        code = "_this call grad_customMedicSystem_fnc_initMedic;";
        spawn = "mrk_spawn_emergency";
        uniform[] = {"UK3CB_CHC_C_U_DOC_01"};
        headgear[] = {"UK3CB_H_Beanie_02_Win", "UK3CB_H_Cap_Back_ION_WHI", "UK3CB_H_Cap_Earpiece_ION_WHI", "gm_xx_headgear_headwrap_01_wht"};
    };
};
