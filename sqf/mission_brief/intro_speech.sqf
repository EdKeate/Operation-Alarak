["mission_brief","ASSIGNED"] call BIS_fnc_taskSetState;

sleep 1;

[["", "BLACK OUT", 1]] remoteExec ["titleText", 0];

sleep 1.5;




if !(Squad_Leader isEqualTo objNull) then {
if !(Squad_Leader == vehicle Squad_Leader) then {Squad_Leader action ["Eject", vehicle Squad_Leader];};
Squad_Leader setDir 89+90;
Squad_Leader setPosASL (getPosASL mission_brief_SL_teleport);
};

if !(Assault isEqualTo objNull) then {
if !(Assault == vehicle Assault) then {Assault action ["Eject", vehicle Assault];};
Assault setDir 69+90;
Assault setPosASL (getPosASL mission_brief_AS_teleport);
};

if !(Marksman isEqualTo objNull) then {
if !(Marksman == vehicle Marksman) then {Marksman action ["Eject", vehicle Marksman];};
Marksman setDir 110+90;
Marksman setPosASL (getPosASL mission_brief_MM_teleport);
};

if !(medic isEqualTo objNull) then {
if !(medic == vehicle medic) then {medic action ["Eject", vehicle medic];};
medic setDir 54+90;
medic setPosASL (getPosASL mission_brief_MD_teleport);
};

if !(Auto_Rifleman isEqualTo objNull) then {
if !(Auto_Rifleman == vehicle Auto_Rifleman) then {Auto_Rifleman action ["Eject", vehicle Auto_Rifleman];};
Auto_Rifleman setDir 138+90;
Auto_Rifleman setPosASL (getPosASL mission_brief_AR_teleport);
};

if !(zeus_player isEqualTo objNull) then {
if !(zeus_player == vehicle zeus_player) then {zeus_player action ["Eject", vehicle zeus_player];};
zeus_player setDir 50+90;
zeus_player setPosASL (getPosASL mission_brief_ZEUS_teleport);
};


//lower all weapons


[0, 1, false, true] remoteExec ["BIS_fnc_cinemaBorder", 0];
brief_screen_small setObjectTextureGlobal [0, "img\brief\1.jpg"];
sleep 2;

{
	_x action ["WeaponOnBack", _x];		
}
forEach units group Squad_Leader;

[["", "BLACK IN", 2]] remoteExec ["titleText", 0];

sleep 1.5;

[mission_brief_officer, "mission_brief_1"] remoteExec ["say", 0];
["Liason Officer", "Take your ruddy time then lads?"] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 3;

[mission_brief_officer, "mission_brief_2"] remoteExec ["say", 0];
["Liason Officer", "This is a time sensitive operation, no time for dilly dallying."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 5;

brief_screen_big setObjectTextureGlobal [0, "img\brief\1.jpg"];

[mission_brief_officer, "mission_brief_3"] remoteExec ["say", 0];
["Liason Officer", "Anyways, enough chit-chat, today is your lucky day."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 5;

[[21989,18964,150], [25394,18908,150], 150, "FULL", "B_Heli_Light_01_Armed_F", civilian] call BIS_fnc_ambientFlyby;

[mission_brief_officer, "mission_brief_4"] remoteExec ["say", 0];
["Liason Officer", "About 10 clicks SSW of Outpost Joy is a lovely little town called 'Panagia'"] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 2;

brief_screen_big setObjectTextureGlobal [0, "img\brief\2.jpg"];
brief_screen_small setObjectTextureGlobal [0, "img\brief\2.jpg"];

sleep 5;

[mission_brief_officer, "mission_brief_5"] remoteExec ["say", 0];
["Liason Officer", "Unfortuanately, due to the towns position at the end of the Pyrgos highway, this was a last stand position for Russian Forces."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 9;

brief_screen_big setObjectTextureGlobal [0, "img\brief\3.jpg"];
brief_screen_small setObjectTextureGlobal [0, "img\brief\3.jpg"];

[mission_brief_officer, "mission_brief_6"] remoteExec ["say", 0];
["Liason Officer", "At approximately 0900 hours, IDAP sent a group of surveyors in to start planning restoration for the town."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 9;

[mission_brief_officer, "mission_brief_7"] remoteExec ["say", 0];
["Liason Officer", "After around, 30 minutes of the whole operation going all fine and dandy, we can no longer get in contact with them."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 8;

[mission_brief_officer, "mission_brief_8"] remoteExec ["say", 0];
["Liason Officer", "Then, to add to the whole ruddy problem, power and communication was lost for 'Feres', 'Selakano' and 'Panagia'."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 4;

brief_screen_big setObjectTextureGlobal [0, "img\brief\4.jpg"];
brief_screen_small setObjectTextureGlobal [0, "img\brief\4.jpg"];

sleep 5;

[mission_brief_officer, "mission_brief_9"] remoteExec ["say", 0];
["Liason Officer", "Obviously we can't just send down more aid workers in case they've been mugged or shot, so this is where you come in."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 7;

[mission_brief_officer, "mission_brief_10"] remoteExec ["say", 0];
["Liason Officer", "Get down there and use your whole 'Diplomatic Black Hole' status to sort this situation out."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 3;

[mission_brief_officer, "mission_brief_11"] remoteExec ["say", 0];
["Liason Officer", "Standard rules apply here. Do not fire unless fired upon and play nice. We're guests here remember."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 9;

[mission_brief_officer, "mission_brief_12"] remoteExec ["say", 0];
["Liason Officer", "Our viroligist has also recommended to keep your masks on for this one."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 5;

[mission_brief_officer, "mission_brief_13"] remoteExec ["say", 0];
["Liason Officer", "It is entirely possible that the Atrox virus is still active in that area, that might have even been what got the IDAP surveyors."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 5;

brief_screen_big setObjectTextureGlobal [0, "img\brief\5.jpg"];
brief_screen_small setObjectTextureGlobal [0, "img\brief\5.jpg"];

sleep 5;

mission_start_heli hideObjectGlobal false;
[mission_start_heli, "all"]remoteExec ["enableAI", 0];
[mission_start_heliD, "all"]remoteExec ["enableAI", 0];
[mission_start_heliC, "all"]remoteExec ["enableAI", 0];
[mission_start_heliG1, "all"]remoteExec ["enableAI", 0];
[mission_start_heliG2, "all"]remoteExec ["enableAI", 0];

[mission_brief_officer, "mission_brief_14"] remoteExec ["say", 0];
["Liason Officer", "Anyways, we've got a HELO inbound which is prepped to drop yourselves off at the substation to restore power."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 8;

[mission_brief_officer, "mission_brief_15"] remoteExec ["say", 0];
["Liason Officer", "Then you can work your way into town from the north and sort out that situation."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 1;

brief_screen_big setObjectTextureGlobal [0, "img\brief\6.jpg"];
brief_screen_small setObjectTextureGlobal [0, "img\brief\6.jpg"];

sleep 5;

[mission_brief_officer, "mission_brief_16"] remoteExec ["say", 0];
["Liason Officer", "Have fun, good luck, and remember, don't tick off the locals."] remoteExec ["BIS_fnc_showSubtitle", 0];
sleep 2;

brief_screen_big setObjectTextureGlobal [0, "img\brief\1.jpg"];
brief_screen_small setObjectTextureGlobal [0, "img\brief\1.jpg"];

sleep 4;

["mission_brief","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 1;

[1, 2, false, false] remoteExec ["BIS_fnc_cinemaBorder", 0];

sleep 2;


[ 
 mission_start_heli, 
 "Start Mission", 
 "a3\ui_f\data\igui\cfg\holdactions\holdaction_unloaddevice_ca.paa", 
 "a3\ui_f\data\igui\cfg\holdactions\holdaction_takeoff2_ca.paa", 
 "_this distance _target < 6", 
 "_this distance _target < 6", 
 {
progressVar = 6; 
[format["<t color='#99FF99' size='.5'>Starting Mission:<br />%1 second(s) remaining</t>", progressVar],-1,-0.3,4,0,0,789] remoteExec ["BIS_fnc_dynamicText", 0]; 
 }, 
 {
progressVar = progressVar - 0.25; 
[format["<t color='#99FF99' size='.5'>Starting Mission:<br />%1 second(s) remaining</t>", progressVar],-1,-0.3,4,0,0,789] remoteExec ["BIS_fnc_dynamicText", 0]; 
 }, 
 {
 _cnt = { !alive _x } count allPlayers;
if (_cnt >= 1) then {

[format["<t color='#FF2222' size='.5'>Cannot initialise mission when players are dead</t>", progressVar],-1,-0.3,4,0,0,789] remoteExec ["BIS_fnc_dynamicText", 0]; 

} else { 

[format["<t color='#22FF22' size='.5'>Mission Initialising</t>", progressVar],-1,-0.3,4,0,0,789] remoteExec ["BIS_fnc_dynamicText", 0]; 

["mission_start","SUCCEEDED"] call BIS_fnc_taskSetState;
["Operations_tasks","SUCCEEDED"] call BIS_fnc_taskSetState;

"sqf\substation_infil\substation_teleport.sqf" remoteExec ["execVM",2];
};
 }, 
 {}, 
 [],  
 6,  
 nil,  
 false,  
 false 
] remoteExecCall ["BIS_fnc_holdActionAdd", 0, mission_start_heli];

[true,  
["mission_start", "Operations_tasks"],  
["Board the infil heli to initiate the mission.",  
"Board HELO",  
"heli"],  
[mission_start_heli, true],  
"ASSIGNED",  
1,  
true,  
"heli" 
] call BIS_fnc_taskCreate;

sleep 3.5;

[squad_leader] call BIS_fnc_saveGame;