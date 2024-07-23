params ["_rv_name"];

_rendevouslistArr = [];
{
if!(_x inarea _rv_name) then {
_rendevouslistArr pushback name _x;
}
} forEach units myFancyGroup;
if !(count _rendevouslistArr == 0) then {
_rendevousListStr = str _rendevouslistArr;
_output = _rendevouslistStr trim ["[]", 0];

format ["Players outside mission area:\n\n%1", _output] remoteExec ["hintsilent", 0];

}else{
format ["Rendevous complete."] remoteExec ["hintsilent", 0];
};

//this && round (time %1) ==1 && rv_1_done == false;

//[rv_1] execVM "sqf\rv_prompt.sqf";

