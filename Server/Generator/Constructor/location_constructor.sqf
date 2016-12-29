/////////////////////////////////////////////////////////////////////
//	AUTHOR: Kex
//	DATE: 1/3/15
//	VERSION: 1.0
//	FILE: Server\Generator\Constructor\location_constructor.sqf
//	DESCRIPTION: Generates locations defined in location.sqf
/////////////////////////////////////////////////////////////////////
/*
{
	_class	= _x select 0;
	_pos	= _x select 1;
	_dir	= _x select 2;
	_init	= _x select 3;
	// 
	_sim	= _x select 4;
	
	_vehicle = createVehicle [_class, _pos, [], 0, "NONE"];
	_vehicle enableSimulationGlobal _sim;
	_vehicle setDir _dir;
	_vehicle setPos _pos;
	if (_init != "") then
	{
		call compile _init;
	};
	call compile _init;
} forEach permanent_objects;
*/


// for test purpose only
/*
for '_i' from 0 to 100 do
{
	private ['_group','_pos'];
	_group = createGroup east;
	_pos = [(9921-5062)*(random 1)+5062,(21651-15148)*(random 1)+15148,0];
	for '_j' from 0 to 3 do
	{
		private '_unit';
		_unit = _group createUnit ['O_G_Soldier_F', _pos, [], 0, "FORM"];
		_unit enableSimulationGlobal false;
		_unit enableSimulation true;
		(allCurators select 0) addCuratorEditableObjects [[_unit],true];
	};
};

while {true} do
{
	{
		_unit = _x;
		if (!(_unit in allPlayers)) then
		{
			{
				_player = _x;
				if ((_unit distance _player) < 1000) then
				{
					_clientID = owner _player;
					simulation_unit = _unit;
					_clientID publicVariableClient 'simulation_unit';
				};
			} forEach allPlayers;
			_unit enableSimulation true;
		};
	} forEach allUnits;
	uiSleep 5;
};
*/