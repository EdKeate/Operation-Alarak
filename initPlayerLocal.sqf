//These lines need to be placed in initPlayerLocal.sqf.

///////////////////////////////////
///                             ///
///         DO NOT EDIT         ///
///                             ///
///////////////////////////////////
params ["_player", "_didJIP"];
//Removes the markers in the local channels
[] spawn kast_fnc_KeepMapClean;



if !(_didJIP) then {

0 fadeSound 0;



titleText ["", "BLACK FADED", 0];

//delays video start until loading screen done.
waitUntil {
	//If there are no current loading screens
	if ( missionnamespace getvariable ["BIS_fnc_startLoadingScreen_ids",[]] isEqualTo [] ) then {
		//Continue
		true
	}else{
		//Otherwise log current loading screens to RPT
		diag_log str ( missionnamespace getvariable ["BIS_fnc_startLoadingScreen_ids",[]] );
		false
	};
};
//meant to sync the video for people
waitUntil { time >= 4 };


titleText ["", "BLACK IN", 0];
private _video = ["vid\intro.ogv"] call BIS_fnc_playVideo;
titleText ["", "BLACK FADED"];
_player setDir 90;

mission_ambience_heli hideObjectGlobal false; 
[mission_ambience_heli, "all"]remoteExec ["enableAI", 0]; 
[mission_ambience_heliD, "all"]remoteExec ["enableAI", 0]; 
[mission_ambience_heliC, "all"]remoteExec ["enableAI", 0]; 

{
_x switchMove "Acts_welcomeOnHUB01_PlayerWalk_5";
} forEach allPlayers;
sleep 2;
[0, 1, false, true] remoteExec ["BIS_fnc_cinemaBorder", _player];

sleep 4;

2 fadeSound 1;

titleText ["", "BLACK FADED"];
_player setDir 90;
titleText ["", "BLACK IN", 4];
sleep 2;

playMusic "LeadTrack01_F_EPA";

[["18:15", 4, 4], ["Objective: Attend Equipment Brief", 3, 3], ["Attend Mission Briefing", 3, 5, 8]] spawn BIS_fnc_EXP_camp_SITREP;  
sleep 6;

[1, 2, false, false] remoteExec ["BIS_fnc_cinemaBorder", _player];

sleep 2;

["<t color='#FFFFFF' size='0.8' font='PuristaSemibold'>OUTPOST JOY: ALTIS</t>",0,0,4,1,0,789] spawn BIS_fnc_dynamicText;

sleep 3;
if (("spectrum_brief" call BIS_fnc_taskState) != "ASSIGNED") then {
["spectrum_brief","ASSIGNED"] call BIS_fnc_taskSetState;
};

sleep 2;

bargate_entrance_1 animate ["Door_1_rot", 1];

if (hasInterface) then {
	_iconDrawingHandlertemp = addMissionEventHandler ["Draw3D", { 
						
				_pos = demo_spectrum_hudson;
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


sleep 10;

[["NaturalOrder", "naturalOrderArmoury"], 15, "", 35, "", true, false, false, true] remoteExec ["BIS_fnc_advHint", _player]; // default
};
}