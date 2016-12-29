//////////////////////////////////////////////////////
//	AUTHOR: Kex
//	DATE: 1/3/16
//	VERSION: 1.0
//	FILE: Server\i_server.sqf 
//  DESCRIPTION: server side task distribution
//////////////////////////////////////////////////////

// load FIA base
call compile preprocessFileLineNumbers "Server\Generator\Storage\permanent_map_objects.sqf";

// wait unitl the first player starts with intro quote
waitUntil {! isNil 'KEX_var_player_ready'};

// environment parameters
setTimeMultiplier 12;

// inizialize player actions
call compile preprocessFileLineNumbers 'Common\Functions\player_actions.sqf';

// generate FIA base
call compile preprocessFileLineNumbers "Server\Generator\Constructor\base_constructor.sqf";

// activate BIS functions
["Initialize"] call BIS_fnc_dynamicGroups;
[] call BIS_fnc_reviveInit;


// client are now allowed to exit the intro Arsenal
KEX_server_init_done = true;
publicVariable 'KEX_server_init_done';

// load and generate Locations
//call compile preprocessFileLineNumbers "Server\Generator\Storage\location_seed.sqf";
//[] execVM "Server\Generator\Constructor\location_constructor.sqf";

/*

//////////////////////////////////////////////////////
// Compile Server Functions
//////////////////////////////////////////////////////

call compile preprocessFileLineNumbers "server\ServerFunctions.sqf";

//////////////////////////////////////////////////////
// generate Server Lists (arrays)
//////////////////////////////////////////////////////

[] execVM "server\ServerLists.sqf";
WaitUntil {!isNil "ListsInitDone"};



//////////////////////////////////////////////////////
// Spawn Base Objects
//////////////////////////////////////////////////////

["D", [1282, 24336, 16], 0] spawn func_createAmmoBox;
["E", [1280, 24334, 16], 1] spawn func_createAmmoBox;

*/

