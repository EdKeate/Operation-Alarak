if (isServer) then {


[15, 0] remoteExec ["fadeMusic"];


substation_heli_fake hideObjectGlobal false; 
[substation_heli_fake, "all"]remoteExec ["enableAI", 0]; 
[substation_heli_fakeD, "all"]remoteExec ["enableAI", 0]; 

[true,  
["escape_two", "zombie_tasks"],  
["Await HELO exfil.",  
"Await Exfil",  
"heli"],  
[heli_exfil_destination, true],  
"ASSIGNED",  
1,  
true,  
"heli" 
] call BIS_fnc_taskCreate;

[[20505,4632,350], [20515,13532,350], 450, "FULL", "O_Plane_Fighter_02_Stealth_F", civilian] call BIS_fnc_ambientFlyby;

waituntil { uisleep 0.001; substation_heli_fake inArea fake_escape_rv };

missionNamespace setVariable ["EDS_zombie_spawning", false];

//kills any russian stragglers
{if !(isPlayer _x) then 
	{
		if (side _x == resistance) then {
			_x doMove position fake_heli_missle_spawn; 
		};
	};
} forEach allUnits;

["escape_two", [substation_heli_fake, true]] call BIS_fnc_taskSetDestination;

sleep 8;

[] spawn {
	[getPosASLVisual fake_heli_missle_spawn, "Sh_105mm_APFSDS_T_Green", substation_heli_fake, 200, false, [0,0,0.25]] spawn BIS_fnc_exp_camp_guidedProjectile;
	sleep 2.3;
	[getPosASLVisual fake_heli_missle_spawn, "Sh_105mm_APFSDS_T_Green", substation_heli_fake, 200, false, [0,0,0.25]] spawn BIS_fnc_exp_camp_guidedProjectile;
	sleep 2.1;
	[getPosASLVisual fake_heli_missle_spawn, "Sh_105mm_APFSDS_T_Green", substation_heli_fake, 200, false, [0,0,0.25]] spawn BIS_fnc_exp_camp_guidedProjectile;
	sleep 4.6;
	substation_heli_fake allowDamage true;
	substation_heli_fake setdamage 1;
};

substation_heli_fake allowDamage true;
substation_heli_fake setHitPointDamage ["HitVRotor", 0.95];

[] spawn
{
	waituntil {uisleep 0.001; !alive substation_heli_fake};

	// Damage smoke from chopper
	[[[],
	{
		private _effect = "#particlesource" createVehicleLocal position substation_heli_fake;
		_effect setParticleClass "AmmoSmokeParticles2";
		_effect attachto [substation_heli_fake, [0.6, -0.5, 0.0]];
	}], "call"] call BIS_fnc_mp;

	// Camera shake
	[[[], {addCamShake [5, 1.5, 20]}], "call"] call BIS_fnc_mp;
};

_russians = [getPos substation_teleport_zeus, east, (configFile >> "CfgGroups" >> "East" >> "OPF_R_F" >> "SpecOps" >> "O_R_InfSquad")] call BIS_fnc_spawnGroup; 
_russians deleteGroupWhenEmpty true; 
 _waypointType = _russians addWaypoint [position heli_exfil_landing, 0];
_waypointType setWaypointType "SAD";

{ 
 //_x doMove position heli_exfil_landing; 
 _x enableGunLights "ForceOn";
} foreach (units _russians);

sleep 8;

substation_heli_fakeD doMove position spectrum_intro_freq_1; 

sleep 5;

[[20505,4632,350], [20515,13532,350], 450, "FULL", "O_Plane_Fighter_02_Stealth_F", civilian] call BIS_fnc_ambientFlyby;

["escape_two","CANCELED"] call BIS_fnc_taskSetState;

["sqf\general\end_game_2.sqf"] remoteExec ["execVM",2];

sleep 2;

[squad_leader] call BIS_fnc_saveGame;
};