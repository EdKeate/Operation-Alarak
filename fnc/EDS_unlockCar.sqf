if (hasInterface) then {
	_windowLower = missionNameSpace getVariable "#EM_SelMin";
	_windowHigher = missionNameSpace getVariable "#EM_SelMax";

	_nearestVehicles = nearestObjects [player, ["Car"], 20];
	if !(count _nearestVehicles == 0) then {
		_nearestSingleVehicle = _nearestVehicles select 0;
		_nearestSingleVehicleIndex = sa_beaconsObjects findIf { _x == _nearestSingleVehicle};

		_nearestVehicleFrequency = sa_beaconsFreqs select _nearestSingleVehicleIndex;
		if ((_nearestVehicleFrequency > _windowLower) && (_nearestVehicleFrequency < _windowHigher)) then {
			[_nearestSingleVehicle, "car_unlock"]remoteExec ["say3D"];
			_nearestSingleVehicle setVehicleLock "UNLOCKED";
					if !("take_car" call BIS_fnc_taskCompleted) then {
						["take_car","SUCCEEDED"] call BIS_fnc_taskSetState;
						[["NaturalOrder", "naturalOrderScanner"], 15, "", 20, "", true, false, false, true] remoteExec ["BIS_fnc_advHint", 0]; // default
						
						[true,  
						["locate_joy", "travel_tasks"],  
						["Using your Spectrum Signal device, locate Outpost Joy.",  
						"Locate Outpost Joy",  
						"navigate"],  
						objNull,  
						"ASSIGNED",  
						1,  
						true,  
						"navigate" 
						] call BIS_fnc_taskCreate;
						
					};
		} else {
			["play", _nearestSingleVehicle] remoteExec ["BIS_fnc_carAlarm", 0];
		};
	};
};