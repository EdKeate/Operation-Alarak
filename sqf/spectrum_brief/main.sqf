[3, 0] remoteExec ["fadeMusic"];


[demo_spectrum_hudson, "spectrum_brief_2_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "You here for a 101?"] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 2;

[demo_spectrum_hudson, "spectrum_brief_3_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Okay, let's get started, grab the device off the table there."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 4;

if (alive demo_spectrum_device) then {
	[true,  //who to show to. True = all
	["spectrum_brief_retrieving", "spectrum_brief"],  //task_id, parent_id
	["Retrieve the device from the desk.",  //detailed description of task
	"Retrieve Device",  //title of task
	"interact"],  //icon
	[demo_spectrum_device, true], //destination 
	"ASSIGNED",  //state
	1,  //auto-assign priority
	false,  //notification Bool
	"interact" 
	] call BIS_fnc_taskCreate;
};

waituntil {uisleep 0.001; _cnt = { _x hasWeapon "hgun_esd_01_F" || _x hasWeapon "hgun_esd_01_antenna_01_F" || _x hasWeapon "hgun_esd_01_antenna_02_F" || _x hasWeapon "hgun_esd_01_antenna_03_F"} count allPlayers; _cnt >= 1};


if (["spectrum_brief_retrieving"] call BIS_fnc_taskExists) then {
	["spectrum_brief_retrieving","SUCCEEDED"] call BIS_fnc_taskSetState;
} else {
	[true,  //who to show to. True = all
	["spectrum_brief_retrieving", "spectrum_brief"],  //task_id, parent_id
	["Retrieve the device from the desk.",  //detailed description of task
	"Retrieve Device",  //title of task
	"interact"],  //icon
	objNull, //destination 
	"SUCCEEDED",  //state
	1,  //auto-assign priority
	false,  //notification Bool
	"interact" 
	] call BIS_fnc_taskCreate;
};

sleep 0.5;

[demo_spectrum_hudson, "spectrum_brief_4_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Good, that device is called a Modular Electromagnetic Spectrum Device with an integrated Analyser."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 7;

[demo_spectrum_hudson, "spectrum_brief_5_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Or, as we sparkies like to call it, a Spectrum Analyser."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 3.5;

[demo_spectrum_hudson, "spectrum_brief_6_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "This one here is a newer version, capable of scanning frequencies from 20 thousand hertz up to a whole giga hertz."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 8;

[demo_spectrum_hudson, "spectrum_brief_7_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "It covers essentially every frequency from short wave radio to encrypted mil spec frequencies."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 7;

[demo_spectrum_hudson, "spectrum_brief_8_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Let's give it a spin then."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 2;

[demo_spectrum_hudson, "spectrum_brief_9_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Aim in with the device and adjust to one of the high amplitude signals to the South."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 2;

		[true,  //who to show to. True = all
		["spectrum_brief_selecting", "spectrum_brief"],  //task_id, parent_id
		["Aim your Spectrum analyser toward the Power Plant to the south and tune the analyser to the frequency being emitted.",  //detailed description of task
		"Locate Frequency",  //title of task
		"intel"],  //icon
		[spectrum_intro_freq_1, true], //destination 
		"ASSIGNED",  //state
		1,  //auto-assign priority
		false,  //notification Bool
		"intel" 
		] call BIS_fnc_taskCreate;

sleep 2;

[["NaturalOrder", "naturalOrderScanner"], 15, "", 65, "", true, true, false, true] remoteExec ["BIS_fnc_advHint", 0]; // default

//task is completed in spectrum_deviceSounds.sqf
waituntil {uisleep 0.001; ["spectrum_brief_selecting"] call BIS_fnc_taskExists && "spectrum_brief_selecting" call BIS_fnc_taskCompleted};

sleep 2;

[demo_spectrum_hudson, "spectrum_brief_10_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Okay, now pull the trigger on the analyser and it will show you the rough location for the emitter."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 6;

		[true,  //who to show to. True = all
		["spectrum_brief_activating", "spectrum_brief"],  //task_id, parent_id
		["With your Spectrum Analyser tuned to the correct frequency, activate it by pulling the trigger and aiming in the targets general direction.",  //detailed description of task
		"Activate Analyser",  //title of task
		"target"],  //icon
		[spectrum_intro_freq_1, true], //destination 
		"ASSIGNED",  //state
		1,  //auto-assign priority
		false,  //notification Bool
		"target" 
		] call BIS_fnc_taskCreate;

sleep 0.5;
		
waituntil {uisleep 0.001; ["spectrum_brief_activating"] call BIS_fnc_taskExists && "spectrum_brief_activating" call BIS_fnc_taskCompleted};

sleep 2;

[demo_spectrum_hudson, "spectrum_brief_11_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "See that weird circle on your Heads Up Display? That's the Analyser picking up the Kalochori power plant."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 7.5;

[demo_spectrum_hudson, "spectrum_brief_add_0_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "There's a few big power plants in Altis, they all communicate via radio, so their amplitude is massive."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 7;

[demo_spectrum_hudson, "spectrum_brief_add_1_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Let's try something a little closer. "] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 2;

[demo_spectrum_hudson, "spectrum_brief_add_2_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "See that tower to the left. Give it a scan."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 3;

		[true,  //who to show to. True = all
		["spectrum_brief_scanning", "spectrum_brief"],  //task_id, parent_id
		["Tune the scanner to the towers frequency and activate.",  //detailed description of task
		"Scan Tower",  //title of task
		"intel"],  //icon
		[demo_spectrum_beacon, true], //destination 
		"ASSIGNED",  //state
		1,  //auto-assign priority
		false,  //notification Bool
		"intel" 
		] call BIS_fnc_taskCreate;

waituntil {uisleep 0.001; ["spectrum_brief_scanning"] call BIS_fnc_taskExists && "spectrum_brief_scanning" call BIS_fnc_taskCompleted};

sleep 2.5;

[demo_spectrum_speaker, "in2a"] remoteExec ["say3D", 0];
sleep 0.5;
[demo_spectrum_speaker, "spectrum_brief_12_Sarge"] remoteExec ["say3D", 0];
["ANGEL 1-5", "ANGEL 1-5, requesting clearance at pad 3."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 4;
[demo_spectrum_speaker, "out2a"] remoteExec ["say3D", 0];

sleep 2;

[demo_spectrum_hudson, "spectrum_brief_13_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Hear that? Got some target practice going overhead."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 3.5;

[demo_spectrum_hudson, "spectrum_brief_14_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Prepare the scanner on a aviation Mil-spec frequency, around 460MHz."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 6;

		[true,  //who to show to. True = all
		["spectrum_brief_tuning", "spectrum_brief"],  //task_id, parent_id
		["Tune the Spectrum Analyser to the frequency 460MHz.",  //detailed description of task
		"Tune Analyser",  //title of task
		"intel"],  //icon
		objNull, //destination 
		"ASSIGNED",  //state
		1,  //auto-assign priority
		false,  //notification Bool
		"intel" 
		] call BIS_fnc_taskCreate;
		
waituntil {uisleep 0.001; ["spectrum_brief_tuning"] call BIS_fnc_taskExists && "spectrum_brief_tuning" call BIS_fnc_taskCompleted};

sleep 2;

[demo_spectrum_speaker, "in2a"] remoteExec ["say3D", 0];
sleep 0.5;
[demo_spectrum_speaker, "spectrum_brief_15_Sarge"] remoteExec ["say3D", 0];
["ANGEL 1-5", "Clearance confirmed, cargo inbound"] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 3;
[demo_spectrum_speaker, "out2a"] remoteExec ["say3D", 0];

spectrum_intro_heli_1 hideObjectGlobal false;
[spectrum_intro_heli_1, "all"]remoteExec ["enableAI", 0];
[spectrum_intro_heli_1D, "all"]remoteExec ["enableAI", 0];
[spectrum_intro_heli_1C, "all"]remoteExec ["enableAI", 0];
[spectrum_intro_heli_1G1, "all"]remoteExec ["enableAI", 0];
[spectrum_intro_heli_1G2, "all"]remoteExec ["enableAI", 0];

sleep 6;

	[true,  //who to show to. True = all
	["spectrum_brief_tracking", "spectrum_brief"],  //task_id, parent_id
	["Track the signal being emitted by the Heli going overhead",  //detailed description of task
	"Track Helicopter",  //title of task
	"heli"],  //icon
	[spectrum_intro_heli_1, true], //destination 
	"ASSIGNED",  //state
	1,  //auto-assign priority
	false,  //notification Bool
	"heli" 
	] call BIS_fnc_taskCreate;
	
_future = time + 30;	
waituntil {uisleep 0.001; (["spectrum_brief_tuning"] call BIS_fnc_taskExists && "spectrum_brief_tuning" call BIS_fnc_taskCompleted && (demo_spectrum_hudson distance spectrum_intro_heli_1) < 500) || time >= _future};	

sleep 5;

["in2a"] remoteExec ["playSound", 0];
sleep 0.5;
["summons_end"] remoteExec ["playSound", 0];
["CROSSROADS", "Foxhound 1-1 report to Liason Officer, Foxhound 1-1 to Liason Officer."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 7;
["out2a"] remoteExec ["playSound", 0];

[demo_spectrum_hudson, "spectrum_brief_16_Hudson"] remoteExec ["say", 0];
["Specialist Hudson", "Hmm, looks like you're needed elsewhere. Keep that Analyser for now, you can always grab a spare from one of the armouries."] remoteExec ["BIS_fnc_showSubtitle", 0];

sleep 8.5;

["spectrum_brief","SUCCEEDED"] call BIS_fnc_taskSetState;
["mission_brief","ASSIGNED"] call BIS_fnc_taskSetState;

EDS_fnc_pulsingMarker = {
	if (hasInterface) then {
		_iconDrawingHandlertemp = addMissionEventHandler ["Draw3D", { 
							
					_pos = mission_brief_officer;
					_size = 0.5;
					_progress = (time - floor time);
					_sizeScaler = _size + (1.5 * (time - floor time));
					
					_laggedTime = time - 0.5;
					_laggedProgress = (_laggedTime - floor _laggedTime);
					_laggedSizeScaler = _size + (1.5 * (_laggedTime - floor _laggedTime));
					
					_alphaMultiplier = 1;
					
					if (["spectrum_brief_tracking"] call BIS_fnc_taskExists && !("spectrum_brief_tracking" call BIS_fnc_taskCompleted)) then {
						if (_windowLower < 460 && _windowHigher > 460 && _progress > 0.8) then {
							["spectrum_brief_tracking","SUCCEEDED"] call BIS_fnc_taskSetState;
						};
					};
					
					drawicon3d [getMissionPath "img\ui\signal_ca.paa",[1,1,1,_alphaMultiplier * (0.9 - _progress * 0.9)],_pos,_sizeScaler,_sizeScaler,0,"",0,0,"RobotoCondensed","",true];	
					drawicon3d [getMissionPath "img\ui\signal_ca.paa",[1,1,1,_alphaMultiplier * (0.9 - _laggedProgress * 0.9)],_pos,_laggedSizeScaler,_laggedSizeScaler,0,"",0,0,"RobotoCondensed","",true];
		}];
	sleep 10;
	removeMissionEventHandler ["Draw3D", _iconDrawingHandlertemp];
};
};
remoteExec ["EDS_fnc_pulsingMarker", 0];

[3, 5] remoteExec ["fadeMusic"];

sleep 3.5;

[squad_leader] call BIS_fnc_saveGame;