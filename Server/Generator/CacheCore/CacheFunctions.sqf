/////////////////////////////////////////////////////////////////////
//	AUTHOR: Kex
//	DATE: 1/3/15
//	VERSION: 1.0
//	FILE: Server\Generator\CacheCore\CoreFunctions.sqf
//	DESCRIPTION: Functions used in the cache
/////////////////////////////////////////////////////////////////////

KEX_fnc_locations_objects =
{
	private ['_locations','location','objects','_output'];
	// takes list of locations and returns list of all units of that location
	_locations = _this select 0;
	_output = [];
	{
		_location = _x;
		_units = _location getVariable 'SpawnedUnits';
		_output append _units;
	} forEach _locations;
	_output
};