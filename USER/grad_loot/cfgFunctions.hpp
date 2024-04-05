class grad_loot {
	class common {
		tag = "grad_loot";
		file = "USER\grad_loot";
		
		class addDigActionAny;
		class addDigActionTomb;
		class addOpenBoxActionUnderwater { postInit = 1; };
		class addTombNameAction;
		class addWeaponToCrate;
		
		class autoInit { postInit = 1; };
        
		class createLoot;
		class createMarker;
		class createMarkerMeeting;

		class destroyActionDummy;

		class getRandomDivingKey;
		
		class digFinishFX;
		class digFinishLoot;
		class digFinishLootAny;
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