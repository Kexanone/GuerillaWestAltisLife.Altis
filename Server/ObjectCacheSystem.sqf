// ElementSynthax = [object type, present (bool), object pos, object dir, AttachList] with AttachListSynthax = [attached object type, relative pos attached object, attached object relative dir]

MapObjectList = [];
FIA_Base_Objects = 
[
	["Land_Bench_F", 1, [7814.6,15171.6,101.65], 182.388, []], 
	["Land_Bench_F", 1, [7816.81,15171.4,101.675], 181.815, []],
	["Land_WoodenTable_large_F", 1, [7815.79,15171.5,101.854], 3.62, [["Land_Can_V2_F",[0.396484,0.9375,0.471474],175.002],["Land_Can_V3_F",[-0.398438,-0.214844,0.470657],176.025],["Land_PortableLongRangeRadio_F",[-0.456543,-0.359375,0.445473],50.2287]]] 	
];
MapObjectList = FIA_Base_Objects;
{
	_obj = (_x select 0) createVehicle [0,0,0];
	_obj enableSimulation false;
	_obj setPosATL (_x select 2);
	_obj setDir (_x select 3);
	_obj enableSimulation false;
	{
		_att = (_x select 0) createVehicle [0,0,0];
		_att enableSimulation false;
		//_att setPosWorld (getPosWorld _obj);
		_att setPosATL (_obj ModelToWorld (_x select 1));
		_att setVectorDirAndUp [[cos (_x select 2), sin (_x select 2), 0],[0,0,1]];
	} forEach (_x select 4);

} forEach MapObjectList;
//playSound 'FD_Start_F';



/*
Number = 3;
AttachList = [];
for [{_i=1}, {_i<=Number}, {_i=_i+1}] do
{
	call compile format ["AttachList = AttachList + [[typeOf A%1, TT WorldToModel (getPosATL A%1), (getDir A%1) - (getDir TT)]];", _i];
};
FIA_Base_Objects = format ["[""%1"", 1, %2, %3, %4], ", typeOf TT, getPosATL TT, getDir TT, AttachList];
copyToClipboard FIA_Base_Objects;



FIA_Base_Objects = format ["[""%1"", 1, %2, %3, []], ", typeOf TT, getPosATL TT, getDir TT];
copyToClipboard FIA_Base_Objects;
*/
