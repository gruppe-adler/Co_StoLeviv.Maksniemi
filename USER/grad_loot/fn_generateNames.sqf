
grad_lootnames = [];

while { count grad_lootnames < 900 } do {

	private _firstname = call grad_loot_fnc_getFirstName;
	private _middlename = selectRandom ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
	private _surname = call grad_loot_fnc_getSurname;

	private _combinedName = _firstName + " " + _middleName + ". " + _surname;
	grad_lootnames pushBackUnique _combinedName;

};
