//////////////////////////////////////////////////////
//	AUTHOR: Kex
//	DATE: 09/7/15
//	VERSION: 1.0
//	FILE: Client\i_client.sqf
//	DESCRIPTION: Client side task distribution
//////////////////////////////////////////////////////

// Start intro sequence
execVM 'Client\intro.sqf';

// wait until intro sequence has started
waitUntil{isNil 'KEX_var_player_ready'};

// Initialize BIS functions
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// inizialize player actions
call compile preprocessFileLineNumbers 'Common\Functions\player_actions.sqf';

// Public variable event handlers
'KEX_var_simulated_list' addPublicVariableEventHandler
{
	// enable and disable simulation of units commanded by server
	// this event handler is part of the hybrid cache system.
	
	private ['_to_enable','_to_disable','_unit'];
	
	_to_enable = _this select 0;
	_to_disable = _this select 1;
	{
		_unit = _x;
		_unit enableSimulation true;
	} forEach _to_enable;
	{
		_unit = _x;
		_unit enableSimulation false;	
	} forEach _to_disable;
};

//music handling
addMusicEventHandler ["MusicStop",{[] execFSM "Client\Ambient\jukebox.fsm"}];

// onEachFrame executions
["uniqueID", "onEachFrame", 
{
	{
		drawIcon3D["\A3\ui_f\data\map\MapControl\hospital_ca.paa", [0.5,0,0,0.7], [visiblePosition _x select 0, visiblePosition _x select 1, (visiblePosition _x select 2) + 2], 1, 1, 0, "Zarg"];
	} forEach allPlayers;
/*	{
		drawIcon3D[_x select 1, [0.5,0,0,0.7], [_x select 2, 1, 1, 0, _x select 0];
	} forEach Task3DMarkerList;*/
}] call BIS_fnc_addStackedEventHandler;

((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",
{
	{
		If (_x in units group _unit) then {_color = [0.3,0.3,1,1]} else {_color = [0,0,1,1]};
		(_this select 0) drawIcon ["iconMan",[0.3,0.3,1,1], visiblePosition _x, 24, 24, direction _x, "Zarg"]
	} forEach allPlayers
}]; 
