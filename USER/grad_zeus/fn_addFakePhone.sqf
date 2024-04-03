params ["_phone"];

_phone setVariable ["grad_telephone_fakeanswersound", ["GRAD_hotline"], true];
[_phone, false, "6666969", "XXX Hotline", "all", true, getpos _phone, false, true] call grad_telephone_fnc_addPhone;