//////////////////////////////////////////////////////////////////////////
//	AUTHOR: Kex
//	DATE: 7/9/15
//	VERSION: 1.0
//	FILE: init.sqf
//	DESCRIPTION: General init; task distribution to corresponding machine
//////////////////////////////////////////////////////////////////////////

// Init: distribute tasks respective site

If (isServer) then
{
	If (isDedicated) then
	{
		// dedicated server
		[] execVM 'Server\i_server.sqf';
		diag_log 'You are a dedicated server!';
	} else {
		// player == host
		[] execVM 'Server\i_server.sqf';
		[player] execVM 'Client\i_client.sqf';
		diag_log 'You are the host!';	
	};
} else {
	If (hasInterface) then
	{
		// other players and JIP
		[player] execVM 'Client\i_client.sqf';
		diag_log 'You are a client!';
	} else {
		// headless client NOT IMPLEMENTED YET!
		diag_log 'HC IS NOT IMPLEMENTED YET!';
		/*
		[] execVM 'HC\i_HC.sqf';
		HC = true;
		publicVariableServer "HC";
		diag_log 'You are a headless client!';
		*/
	};
};
// codes for Server and Client
[] execVM 'Common\i_common.sqf';