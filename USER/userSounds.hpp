/*
*   Hier können eigene Sounds eingebunden werden.
*   Ist in CfgSounds included.
*/

#include "..\node_modules\grad-leaveNotes\cfgSounds.hpp"
 
class GRAD_garble {
	name = "GRAD_garble";
	// filename, volume, pitch
	sound[] = {"USER\sounds\garble.ogg", 20, 1};
	// subtitle delay in seconds, subtitle text
	titles[] = {0, ""};
};

class GRAD_scissors {
	name = "GRAD_scissors";
	// filename, volume, pitch
	sound[] = {"USER\sounds\scissors.ogg", 20, 1};
	// subtitle delay in seconds, subtitle text
	titles[] = {0, ""};
};