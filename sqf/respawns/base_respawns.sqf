armoury_respawn = [missionNamespace,armoury_respawn_destination,"Outpost Joy: Armoury"] call BIS_fnc_addRespawnPosition;
shootHouse_respawn = [missionNamespace,shootHouse_respawn_destination,"Outpost Joy: Shoot House"] call BIS_fnc_addRespawnPosition;
hangars_respawn = [missionNamespace,hangars_respawn_destination,"Outpost Joy: Hangars"] call BIS_fnc_addRespawnPosition;

waituntil {sleep 10; _alivePlayers = allPlayers select {alive _x}; private _inArea = _alivePlayers inAreaArray outpostJoy_trg;	_count = count _inArea; _count == 0};

[missionNamespace, armoury_respawn] call BIS_fnc_removeRespawnPosition;
[missionNamespace, shootHouse_respawn] call BIS_fnc_removeRespawnPosition;
[missionNamespace, hangars_respawn] call BIS_fnc_removeRespawnPosition;