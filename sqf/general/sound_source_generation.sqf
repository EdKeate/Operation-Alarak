_vanWreck = createSoundSource ["Sound_SmokeWreck1", position idap_van_wreck_target, [], 0];
sleep 0.2;
_vanWreck = createSoundSource ["Sound_SmokeWreck2", position idap_van_wreck_target, [], 0];
sleep 0.2;
_vanWreck = createSoundSource ["Sound_Fire", position idap_van_wreck_target, [], 0];
sleep 0.2;
_lamp_1 = createSoundSource ["Sound_SparklesWreck1", position fickering_lamp_1_snd_source, [], 0];
sleep 0.2;
_lamp_2 = createSoundSource ["Sound_SparklesWreck2", position fickering_lamp_2_snd_source, [], 0];
sleep 0.2;

[] spawn { 
while { uisleep 0.01; true } do { 
private _lampsIn10m = nearestObjects [fickering_lamp, ["Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"], 10];  
{ [_x, selectRandom [true, false]] remoteExec ["BIS_fnc_switchLamp", 0];  } forEach _lampsIn10m; 
  sleep 0.2 + random 0.5;
private _seed = [1,101] call BIS_fnc_randomInt; 
if (_seed >90) then {
[[fickering_lamp, fickering_lamp],"fnc\shorting_effect.sqf"] remoteExec ["execVM", 0];
}; 
};
}; 