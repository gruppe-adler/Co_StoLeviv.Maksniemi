class grad_roles{
	class common {
		tag = "grad_roles";
		file = "USER\grad_roles";
		
		class autoInit { postInit = 1; };
		class initRolesServer { postInit = 1; };
		class initRoleClient { postInit = 1; };
		
		class initEngineer;
		class initTailor;
		class initHacker;
		class initHunter;
		class initTankCrew;
	};
};