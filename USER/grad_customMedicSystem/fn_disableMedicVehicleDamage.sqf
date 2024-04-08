params ["_vehicle"];

_vehicle addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];

	if ((_unit getHitPointDamage _hitPoint) + _damage > 0.88) then {
		_unit setHitpointDamage [_hitPoint, 0.88, false];
		_damage = 0;
	} else {
		_damage
	};
	_damage
}];
