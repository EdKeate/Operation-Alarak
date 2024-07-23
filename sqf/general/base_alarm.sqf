_base_alarm_destination_1_source = createSoundSource ["Sound_Alarm", position base_alarm_destination_1, [], 0];
_base_alarm_destination_2_source = createSoundSource ["Sound_Alarm", position base_alarm_destination_2, [], 0];

waitUntil { sleep 1; alarm_stop == true };

deleteVehicle _base_alarm_destination_1_source;
deleteVehicle _base_alarm_destination_2_source;