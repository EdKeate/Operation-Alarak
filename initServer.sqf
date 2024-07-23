rv_1_done = false;
site_investigated = 0;
box_touched = false;
alarm_stop = false;
body_investigated = false;
wendigo_sounds_quiet = true;
civs_investigated = 0;
russian_base setVariable ["bis_disabled_Door_3", 1, true];
["sqf\respawns\base_respawns.sqf"] remoteExec ["execVM", 2];
/*
	initServer.sqf lines of code 
	By @kasteelharry
*/


///////////////////////////////////
///                             ///
///    EDITABLE VARIABLE        ///
///                             ///
///////////////////////////////////

// EMP
_EMPvariable = ominous_box; //Sets the variable names of the EMP's here
_jammerNames = _EMPvariable; //Makes the EMP the same source as the TFAR jammer
_EMP_Range = 1000; //Range of the EMP blast and jamming afterwards
_jammerRadius = _EMP_Range; //Sets jammer radius the same as EMP radius
_jammerStrength = 100; //Strength of the jammer, max is 100

// REMOVE USERPLACED MARKERS 
// Will be run after emp blast
_AllowedToDrawGroup = ["GroupName1", "GroupName2", "etc..."];

///////////////////////////////////
///                             ///
///         DO NOT EDIT         ///
///                             ///
///////////////////////////////////

// EMP + Jammer
missionNamespace setVariable ["EMP", _EMPvariable, true];
missionNamespace setVariable ["EMP_Range", _EMP_Range, true];
missionNamespace setVariable ["Jammers", _jammerNames, true];
missionNamespace setVariable ["JammerRadius", _jammerRadius, true];
missionNamespace setVariable ["JammerStrength", _JammerStrength, true];

// Remove Markers
missionNamespace setVariable ["WhiteListedIDs", [], true];
missionNamespace setVariable ["DisableMapRestrictor", true, true];
missionNameSpace setVariable ["WhitelistedGroup",_AllowedToDrawGroup, true];

[] spawn kast_fnc_KeepMapClean;

/*
    Will work from version 1.96 and onwards:
*/ 
onPlayerConnected 
{
    missionNamespace setVariable [_name, _idstr, true];
};

[] spawn {
	while { uisleep 0.001; true } do {
		playSound3D ["a3\Sounds_F_Decade\Assets\Props\LinkTerminal_01_node_1_F\Link_Terminal01_Loop.wss", server_sound_source, false, getPosASL server_sound_source, 0.1];
		sleep 10;
	};
};

[] spawn {
	while { uisleep 0.001; true } do {
		[keyboard_sound_source, "keyboard_typing"] remoteExec ["say3D", 0];
		sleep 25;
	};
};