[] spawn {
	if (hasInterface) then {
		while {uisleep 0.001; true} do {
			if (sa_scan_in_progress == true) then {
				while {sa_scan_in_progress == true} do {
					_EDS_scanningSoundSource = player say3D "radio_noise_3";
					waituntil {not alive _EDS_scanningSoundSource};
				};
			};
		};
	};
};

[] spawn {
	if (hasInterface) then {
		while {uisleep 0.001; true} do {
			if (((currentWeapon player) in ["hgun_esd_01_F","hgun_esd_01_antenna_01_F","hgun_esd_01_antenna_02_F","hgun_esd_01_antenna_03_F"])) then {
				while {((currentWeapon player) in ["hgun_esd_01_F","hgun_esd_01_antenna_01_F","hgun_esd_01_antenna_02_F","hgun_esd_01_antenna_03_F"])} do {
					_EDS_passiveSoundSource = playsound "static_loop";
					waitUntil { isNull _EDS_passiveSoundSource || !((currentWeapon player) in ["hgun_esd_01_F","hgun_esd_01_antenna_01_F","hgun_esd_01_antenna_02_F","hgun_esd_01_antenna_03_F"])};
					deleteVehicle _EDS_passiveSoundSource;
				};
				
			};
		};
	};
};

waitUntil { time >= 10 };
if (hasInterface) then {
	_scrollWheelShit = findDisplay 46 displayAddEventHandler [
	"MouseZchanged",{
	params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"]; 
	if ((currentWeapon player) in ["hgun_esd_01_F","hgun_esd_01_antenna_01_F","hgun_esd_01_antenna_02_F","hgun_esd_01_antenna_03_F"]) then {
	playsound "spectrum_click";
	};
	}
	];
};

if (hasInterface) then {
	_iconDrawingHandler = addMissionEventHandler ["Draw3D", { 
	
	
		if ((currentWeapon player) in ["hgun_esd_01_F","hgun_esd_01_antenna_01_F","hgun_esd_01_antenna_02_F","hgun_esd_01_antenna_03_F"]) then {
		_windowLower = missionNameSpace getVariable "#EM_SelMin";
		_windowHigher = missionNameSpace getVariable "#EM_SelMax";
		
		if (["spectrum_brief_tuning"] call BIS_fnc_taskExists && !("spectrum_brief_tuning" call BIS_fnc_taskCompleted)) then {
			if (_windowLower < 460 && _windowHigher > 460) then {
				["spectrum_brief_tuning","SUCCEEDED"] call BIS_fnc_taskSetState;
			};
		};
		if (["spectrum_brief_selecting"] call BIS_fnc_taskExists && !("spectrum_brief_selecting" call BIS_fnc_taskCompleted)) then {
			if (_windowLower < 555 && _windowHigher > 555) then {
				["spectrum_brief_selecting","SUCCEEDED"] call BIS_fnc_taskSetState;
			};
		};
		
			if (sa_scan_in_progress) then {
			
			if (["spectrum_brief_scanning"] call BIS_fnc_taskExists && !("spectrum_brief_scanning" call BIS_fnc_taskCompleted)) then {
				if (_windowLower < 615 && _windowHigher > 615) then {
					["spectrum_brief_scanning","SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
					
					_allInWindow = [];
						{
							if(_x > _windowLower && _x < _windowHigher) then {
								_allInWindow pushBack _forEachIndex;
							}
						} forEach sa_beaconsFreqs;
						
						
						
						_allInWindowObjects = [];
						{
							_allInWindowObjects pushback (sa_beaconsObjects select _x);
						} forEach _allInWindow;
						_closestSignals = [_allInWindowObjects, [], { player distance _x }, "ASCEND"] call BIS_fnc_sortBy;
						_closestSignalOnScreen = _closestSignals findIf { !(count worldToScreen ASLToAGL getPosASL _x == 0) };
						
				_pos = _closestSignals select _closestSignalOnScreen;
				_size = (linearConversion[ 0, 2500, player distance2D _pos, 1, 0.2, true ]) / 2;
				_progress = (time - floor time);
				_sizeScaler = _size + (1.5 * (time - floor time));
				
				_laggedTime = time - 0.5;
				_laggedProgress = (_laggedTime - floor _laggedTime);
				_laggedSizeScaler = _size + (1.5 * (_laggedTime - floor _laggedTime));
				
				_alphaMultiplier = missionNameSpace getVariable "#EM_Progress";
				
				if ((_pos == spectrum_intro_freq_1 || _pos == spectrum_intro_freq_2) && ["spectrum_brief_activating"] call BIS_fnc_taskExists && !("spectrum_brief_activating" call BIS_fnc_taskCompleted)) then {
					["spectrum_brief_activating","SUCCEEDED"] call BIS_fnc_taskSetState;
				};
				
				
				
				if (["spectrum_brief_tracking"] call BIS_fnc_taskExists && !("spectrum_brief_tracking" call BIS_fnc_taskCompleted)) then {
					if (_windowLower < 460 && _windowHigher > 460 && _progress > 0.8) then {
						["spectrum_brief_tracking","SUCCEEDED"] call BIS_fnc_taskSetState;
					};
				};
				
				drawicon3d [getMissionPath "img\ui\signal_ca.paa",[1,1,1,_alphaMultiplier * (0.75 - _progress * 0.75)],_pos,_sizeScaler,_sizeScaler,0,"",0,0,"RobotoCondensed","",true];	
				drawicon3d [getMissionPath "img\ui\signal_ca.paa",[1,1,1,_alphaMultiplier * (0.75 - _laggedProgress * 0.75)],_pos,_laggedSizeScaler,_laggedSizeScaler,0,"",0,0,"RobotoCondensed","",true];		  
				drawIcon3D ["", [1,1,1,_alphaMultiplier * 0.75], _pos, 0, 0, 0, format ["%1m", round (player distance _pos)], 1, 0.02+(_size)/15, "PuristaMedium", "center", true, 0, 0.02];
			};
		};	  
	}];
};
