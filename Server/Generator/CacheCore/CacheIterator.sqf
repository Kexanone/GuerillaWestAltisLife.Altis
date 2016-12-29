////////////////////////////////////////////////////////////////////////////////////////////////////
//	AUTHOR: Kex
//	DATE: 1/4/15
//	VERSION: 1.0
//	FILE: Server\Generator\CacheCore\CacheIterator.sqf
//	DESCRIPTION: Hybrid Cache: - spawn/delete objects on server depending on all player distances
//							   - simulate objects on client depending on client player distance
////////////////////////////////////////////////////////////////////////////////////////////////////

private ['_MaxCacheRadius','_MinCacheRadius','_cache_time_interval','_remoteSettlement','_infrastructure','_current_simulated_server','_old_simulated_server','_current_simulated_client','_old_simulated_clien','_to_enable','_to_disable','_to_spawn','_to_cache'];

// Cache Parameters

// effect have to be tested on dedicated server
_MaxCacheRadius = getObjectViewDistance select 0;
_MinCacheRadius = 100;
_cache_time_interval = 5;

// to make it more clear
_remoteSettlement = 'fakeTown';
_infrastructure = 'Name';

// load cache functions
call compile preprocessFileLineNumbers 'Server\Generator\CacheCore\CacheFunctions.sqf';

// Initialize array of simulated objects for each client
{
	_player = _x;
	_player setVariable ['old_simulated_list', []];
	_player setVariable ['current_simulated_list', []];
} forEach ([] call KEX_fnc_all_players);

While {true} do 
{
	// Initialize array of simulated objects for server
	_current_simulated_server = [];
	{
		_player = _x;
		_owner = owner _player
		
		// enable/disable simulation of generated units on client side from previous loop
		// array of type [BiediArray]
		_old_simulated_client = _player getVariable 'old_simulated_list';
		_curent_simulated_client = _player getVariable 'current_simulated_list';
		_to_enable = [(_curent_simulated_client - _old_simulated_client)] call KEX_fnc_locations_objects;
		_to_disable = [(_old_simulated_client - _curent_simulated_client)] call KEX_fnc_locations_objects;
		KEX_var_simulated_list = [_to_enable,_to_disable];
		// update variables
		_owner publicVariableClient 'KEX_var_simulated_list';
		_player setVariable ['old_simulated_list', _curent_simulated_client];
		
		// determine objects to be generatet
		// array of type [location]
		_current_simulated_client = nearestLocations [position _player, ['Strategic','StrongpointArea','u_installation','NameVillage','NameCity'],MaxCacheRadius];
		_current_simulated_client append nearestLocations [position _player, [remoteSettlement,infrastructure,MinCacheRadius];
		_player setVariable ['current_simulated_list',_current_simulated_client];
		_current_simulated_server append (_current_simulated_client - _current_simulated_server);
	} forEach ([] call KEX_fnc_all_players);
	
	// Determine Objects to handle on server side
	_to_spawn = _current_simulated_client - _old_simulated_server;
	_to_cache = _old_simulated_server - _current_simulated_client;
	
	{
		//write
	} forEach  _to_spawn;
	
	{
		//write
	} forEach _to_cache;
	
	_old_simulated_server = _current_simulated_server;
	uiSleep _cache_time_interval;
};
