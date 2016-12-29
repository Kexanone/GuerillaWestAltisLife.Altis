
private ['_unit','_id','_seat','_dir'];
_unit = _this select 1;
_id = _this select 2;
//hint 'hi';

if (isNil 'sit') then
{
	_seat = _this select 0;
	_dir = (getDir _seat)+180;
	
	[[_seat, _id],'removeAction',true,true] call BIS_fnc_MP;
	_unit switchMove 'HubSittingChairB_idle1';
	_unit setPos (_seat modelToWorld [0,-0.1,-0.5]);
	[_unit,_dir] spawn {_unit = _this select 0; _dir = _this select 1; while {!isNil 'sit'} do {_unit setDir _dir; uiSleep 0.01;};};
	_unit setVariable ['Seat',_seat];
	_unit addAction ['Leave seat','Client\Actions\KEX_fnc_sit.sqf',false];
	sit = true;
} else {
	_seat = _unit getVariable 'Seat';
	_unit getVariable 'Seat';
	_unit setVariable ['Seat',nil];
	_unit removeAction _id;
	_unit switchMove '';
	_unit setPos (_seat modelToWorld [0,0.8,-0.5]);
	sit = nil;
	[_seat] call KEX_fnc_usefull_seat;
};
