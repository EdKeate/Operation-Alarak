if (isServer) then {
	{
		_x allowDamage false;
	} forEach allPlayers;
	
	{if !(isPlayer _x) then 
	{
		if (side _x == resistance) then {
			_x setDamage 1;
		};
	};
} forEach allUnits;

	[["", "BLACK OUT", 2]] remoteExec ["titleText"];

	[2, 0] remoteExec ["fadeSound"];

	sleep 2;

	[["", "BLACK FADED"]] remoteExec ["titleText"];

	sleep 2;

	[["", "PLAIN"]] remoteExec ["titleText"];

	["vid\Outro.ogv"] remoteExec ["BIS_fnc_playVideo"];

	sleep 30;

	[""] remoteExec ["BIS_fnc_playVideo"];

	[["", "BLACK FADED"]] remoteExec ["titleText"];

	sleep 3;

	["END1", TRUE, 0, false, false] remoteExec ["BIS_fnc_endMission", 0, true];
};