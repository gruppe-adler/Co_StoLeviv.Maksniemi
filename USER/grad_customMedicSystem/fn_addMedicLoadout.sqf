params ["_player"];

removeAllWeapons _player;
removeBackpack _player;
{ _player removeMagazine _x } forEach magazines _player;
removeAllItems _player;

_player addUniform "UK3CB_CHC_C_U_DOC_01";
_player addHeadgear selectRandom ["UK3CB_H_Bandanna_Win", "gm_xx_headgear_headwrap_01_wht"];
_player addBackpack "UK3CB_CHC_C_B_MED";
_player addItem "ItemCompass";
_player addItem "ItemMap";
_player addItem "ItemWatch";