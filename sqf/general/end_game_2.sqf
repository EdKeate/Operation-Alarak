if (isServer) then {

EDS_Spawn_Flare = {
params ["_pos"];
_azimuth = squad_leader getDir _pos;
_soundPos = [squad_leader, 15, _azimuth] call BIS_fnc_relPos;
_logicCenter = createCenter sideLogic;
_logicGroup = createGroup _logicCenter;
_soundLogic = _logicGroup createUnit ["Logic", _soundPos, [], 0, "NONE"];

[_soundLogic, "EXP_m04_flare"] remoteExec ["say3D", 0];

_soundLogic spawn {
params ["_soundLogic"];
	sleep 10;
	deleteVehicle _soundLogic;
};

sleep 2;


_flarePos = [_pos, random 15, random 360] call BIS_fnc_relPos;
_flare = createVehicle ["F_20mm_Red_Infinite", _flarePos, [], 0, "NONE"];
_flare setPosATL [getPosATL _flare select 0, getPosATL _flare select 1, 150 + (random 75)];
_flare setVelocity [0,0,-0.0001];

[] spawn
{
	[[[],
	{
		private _effect = "#particlesource" createVehicleLocal position _flare;
		_effect setParticleClass "AmmoSmokeParticles2";
		_effect attachto [_flare, [0.6, -0.5, 0.0]];
	}], "call"] call BIS_fnc_mp;
};


//sound spawns and attaches to the flare
_flare spawn {
	params ["_flare"];
	private _sound = createSoundSource ["SoundFlareLoop_F", getPosATL _flare, [], 0];
		
	while {!(isNull _flare)} do {
		_sound setPosATL (getPosATL _flare);
		sleep 0.05;
	};
	deleteVehicle _sound;
};

private _light = createVehicle ["#lightpoint", getPosATL _flare, [], 0, "NONE"];
[_light,[_flare, [0,0,0]]] remoteExec ["lightAttachObject", 0];

// Determine color RGB
_colorArray = [0.25,0,0];

// Configure light
[_light, 2] remoteExec ["setLightBrightness", 0];
[_light, _colorArray] remoteExec ["setLightColor", 0];
[_light, _colorArray] remoteExec ["setLightAmbient", 0];
[_light, [200, 10, 0.0001, 0.05]] remoteExec ["setLightAttenuation", 0];
[_light, false] remoteExec ["setLightDayLight", 0];
[_light, false] remoteExec ["setLightUseFlare", 0];
[_light, 2] remoteExec ["setLightBrightness", 0];

// Pulse light like a flare
private _limit = 1500;
[_light, _limit] remoteExec ["setLightIntensity", 0];

[_light, _limit] spawn {
	params ["_light", "_limit"];
	while {!(isNull _light)} do {
		// Randomize intensity
		private _intensity = _limit - (random 300);
		[_light, _intensity] remoteExec ["setLightIntensity", 0];
	
		// Small delay
		private _time = time + (0.01 + random 0.02);
		waitUntil {time >= _time || { isNull _light }};
	};
};

[_flare, _light] spawn {
params ["_flare", "_light"];
sleep 5;

waituntil {sleep 0.5;  _cnt = { side _x == east } count allUnits; _trgCnt = { side _x == east;  _x inArea fake_escape_rv} count allUnits; _cnt == 0 || (_cnt <= 2 && _trgCnt == 0)};
{deleteVehicle _x} forEach [_flare, _light];

};

};

[true,  
["escape_three", "zombie_tasks"],  
["Eliminate the remaining hostiles and secure the AO",  
"Defend the AO",  
"defend"],  
[heli_exfil_destination, true],  
"ASSIGNED",  
1,  
true,  
"defend" 
] call BIS_fnc_taskCreate;

[fake_heli_missle_spawn] call EDS_Spawn_Flare;




[] spawn {
	sleep 10;
	[0, 0] remoteExec ["fadeMusic"];

	"Music_FreeRoam_Battle_Alien_Loop_01" remoteExec ["playMusic"];

	[30, 1] remoteExec ["fadeMusic"];
};

 missionNamespace setVariable ["EDS_zombie_spawning", false];
waituntil {sleep 5;  _cnt = { side _x == east } count allUnits; _trgCnt = { side _x == east;  _x inArea fake_escape_rv} count allUnits; _cnt == 0 || (_cnt <= 2 && _trgCnt == 0)};

[zombie_spawner_17] call EDS_Spawn_Flare;

sleep 2;

_russians = [getPos zombie_spawner_17, east, (configFile >> "CfgGroups" >> "East" >> "OPF_R_F" >> "SpecOps" >> "O_R_InfSquad")] call BIS_fnc_spawnGroup; 
_russians deleteGroupWhenEmpty true; 
_waypointType = _russians addWaypoint [position heli_exfil_landing, 0];
_waypointType setWaypointType "SAD";
{ 
 //_x doMove position heli_exfil_landing; 
 _x enableGunLights "ForceOn";
} foreach (units _russians);

_QRFgroup = [getpos zombie_spawner_17, 100, "O_T_LSV_02_armed_F", east] call BIS_fnc_spawnVehicle;
_QRFgroupBreakdwon = _QRFgroup select 0;


{ 
 _x doMove position heli_exfil_landing; 
 _x enableGunLights "ForceOn";
 _x setBehaviour "COMBAT";
 _x setCombatBehaviour "COMBAT";
 _x setBehaviourStrong "COMBAT";
 _x forceAddUniform "U_O_R_Gorka_01_Camo_F";

} foreach units _QRFgroupBreakdwon;


waituntil {sleep 5; _cnt = { side _x == east } count allUnits; _trgCnt = { side _x == east;  _x inArea fake_escape_rv} count allUnits; _cnt == 0 || (_cnt <= 2 && _trgCnt == 0)};

[russian_spawn_3] call EDS_Spawn_Flare;

sleep 2;

_russians = [getPos russian_spawn_3, east, (configFile >> "CfgGroups" >> "East" >> "OPF_R_F" >> "SpecOps" >> "O_R_InfSquad")] call BIS_fnc_spawnGroup; 
_russians deleteGroupWhenEmpty true; 
_waypointType = _russians addWaypoint [position heli_exfil_landing, 0];
_waypointType setWaypointType "SAD";
 
{ 
 //_x doMove position heli_exfil_landing; 
 _x enableGunLights "ForceOn";
} foreach (units _russians);

sleep 40;

[russian_spawn_3] call EDS_Spawn_Flare;

_russians = [getPos russian_spawn_3, east, (configFile >> "CfgGroups" >> "East" >> "OPF_R_F" >> "SpecOps" >> "O_R_InfSquad")] call BIS_fnc_spawnGroup; 
_russians deleteGroupWhenEmpty true; 
_waypointType = _russians addWaypoint [position heli_exfil_landing, 0];
_waypointType setWaypointType "SAD";
 
{ 
 //_x doMove position heli_exfil_landing; 
 _x enableGunLights "ForceOn";
} foreach (units _russians);

waituntil {sleep 5; _cnt = { side _x == east } count allUnits; _trgCnt = { side _x == east;  _x inArea fake_escape_rv} count allUnits; _cnt == 0 || (_cnt <= 2 && _trgCnt == 0)};


sleep 2;

["escape_three","SUCCEEDED"] call BIS_fnc_taskSetState;



waituntil {uisleep 0.001; _cnt = { !alive _x } count allPlayers; _cnt == 0};

[5, 0] remoteExec ["fadeMusic"];

sleep 8;

["sqf\general\end_game_3.sqf"] remoteExec ["execVM",2];

};