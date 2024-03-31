class grad_roles{
	class common {
		tag = "grad_roles";
		file = "USER\grad_roles";
		
		class autoInit { postInit = 1; };

		class addActionBalloon  { postInit = 1; };
		
		class createMarkerSpawn;
		class distributeSegments { postInit = 1; };

		class initRolesServer { postInit = 1; };
		class initRoleClient;
		
		class initEmergency;
		class initBoatCrew;
		class initEngineer;
		class initTailor;
		class initHacker;
		class initHunter;
		class initTankCrew;

		class initAI;

		
		class spawnBalloon;
		class spawnObjects;
		class spawnObjectsMapper;

		class unitSetLoadout;
	};
};