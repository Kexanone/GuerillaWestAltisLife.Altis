KEX_fnc_all_players =
{
	// returns all players clients except HC
	allPlayers - entities 'HeadlessClient_F';
};
KEX_fnc_usefull_seat =
{
	_seat = _this select 0;
	[[_seat, ['sit on chair','Client\Actions\KEX_fnc_sit.sqf',[],1.5, true, false,'','isNil "Sit" and _this distance _target < 2']],'addAction',true,true] call BIS_fnc_MP;
};