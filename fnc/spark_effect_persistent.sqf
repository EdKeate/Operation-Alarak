params ["_unit_afect"];



_bbr = boundingBoxReal vehicle _unit_afect;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

_e_car = "#particlesource" createVehicleLocal (getPos _unit_afect);
_e_car setParticleCircle [_maxWidth-0.5,[0,0,0]];
_e_car setParticleRandom [0.2,[0.2,0.2,_maxHeight/2-0.5],[0,0,0],0,0.02,[0,0,0,1],1,0];
_e_car setParticleParams [["\A3\data_f\blesk1",1,0,1],"","SpaceObject",1,0.2,[0,0,0],[0,0,0],0,10,7.9,0,[0.003,0.003],[[1,1,0.1,1],[1,1,1,1]],[0.08], 1, 0, "", "", _unit_afect];
_e_car setDropInterval 0.01;
[_e_car] spawn {_de_sters = _this select 0;waituntil{sleep 0.5;box_touched == true};deleteVehicle _de_sters};

_whisperingSource = _unit_afect say3D "whispering_2";

waituntil{sleep 0.5;box_touched == true};
deleteVehicle _whisperingSource;