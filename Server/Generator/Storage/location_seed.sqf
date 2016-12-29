///////////////////////////////////////////////////////////
//	AUTHOR: Kex
//	DATE: 1/3/16
//	VERSION: 1.0
//	FILE: Server\Generator\Storage\location_seed.sqf 
//	DESCRIPTION: Seed for location_constructor.sqf
///////////////////////////////////////////////////////////

/*
Code structure:

Type of Locations:
	- SpecificLocation 	=> defined via map marker (for hideouts, AAF bases)
	- Checkpoints		=> Random generated on roads
	- TownLocations		=> Random generated in villages and towns (for clinics, gas serivce, civ ambient)
	- RemoteLocations	=> Random generated in remote settlements (for civ ambient)

SpecificLocation =
[
	[
		MarkerName,
		RadialSize,
		[
			fix Objects and Units in format AbsBiediArray,
			... 
		],
		[
			random Objects in format RelBiediArray,
			...
		],
		PatrolInfo
	],
	...
];

*/

SpecificLocation =
[
];

Checkpoints =
[
];

TownLocations =
[
];

RemoteLocations =
[
];