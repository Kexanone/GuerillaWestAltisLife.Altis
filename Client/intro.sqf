//////////////////////////////////////////////////////
//	AUTHOR: Kex
//	DATE: 1/1/16
//	VERSION: 1.0
//	FILE: Client\intro.sqf
//	DESCRIPTION: Player intro scene
//////////////////////////////////////////////////////


//intro quotation
["\A3\missions_f_epa\video\B_out2_quotation.ogv", ""] call BIS_fnc_quotations;

//prepate arsenal
waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
["Preload"] call BIS_fnc_arsenal;

// send server a message
KEX_var_player_ready = true;
publicVariableServer 'KEX_var_player_ready';

// intro quote finished => open arsenal
waitUntil {!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")};
30 fadeMusic 0.1;
cutText ['', 'BLACK OUT', 0.5];
uiSleep 1;
playMusic ['LeadTrack01a_F_EPB',6];
["Open",true] spawn BIS_fnc_arsenal;
cutText ['', 'BLACK IN', 0.3];
