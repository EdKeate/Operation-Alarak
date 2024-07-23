if (isServer) then {
	while {sleep 1; true} do {
	_waitTime = 25;
	_variation = 25;
	_volume = 2;
		playSound3D [getMissionPath "snd\general\wendigo_1.ogg", wendigo_source_1, false, getPosASL wendigo_source_1, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		playSound3D [getMissionPath "snd\general\wendigo_2.ogg", wendigo_source_2, false, getPosASL wendigo_source_2, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		playSound3D [getMissionPath "snd\general\wendigo_3.ogg", wendigo_source_3, false, getPosASL wendigo_source_3, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		playSound3D [getMissionPath "snd\general\wendigo_4.ogg", wendigo_source_1, false, getPosASL wendigo_source_4, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		playSound3D [getMissionPath "snd\general\wendigo_5.ogg", wendigo_source_2, false, getPosASL wendigo_source_1, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		playSound3D [getMissionPath "snd\general\wendigo_1.ogg", wendigo_source_3, false, getPosASL wendigo_source_2, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		playSound3D [getMissionPath "snd\general\wendigo_2.ogg", wendigo_source_1, false, getPosASL wendigo_source_3, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		playSound3D [getMissionPath "snd\general\wendigo_3.ogg", wendigo_source_2, false, getPosASL wendigo_source_4, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		playSound3D [getMissionPath "snd\general\wendigo_4.ogg", wendigo_source_3, false, getPosASL wendigo_source_1, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		playSound3D [getMissionPath "snd\general\wendigo_5.ogg", wendigo_source_1, false, getPosASL wendigo_source_2, _volume, 1, 1000];
		sleep (_waitTime + (random _variation));
		
	};
};