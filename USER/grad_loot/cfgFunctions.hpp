class grad_loot {
	class common {
		tag = "grad_loot";
		file = "USER\grad_loot";
		
		class addDigAction;
		class addTombNameAction;
		
		class autoInit { postInit = 1; };
        
		class createLoot;
		class createMarker;
		class createMarkerMeeting;

		class destroyActionDummy;
		
		class digFinishFX;
		class digFinishLoot;
		class digFX;
		
		class generateNames;
		class getDateRange;
		class getEpitaph;
		class getFirstName;
		class getSurname;
		class getTombStones;

		class tombScanner { postInit = 1; };
		class tombStoneThrown;
		
	};
	
};