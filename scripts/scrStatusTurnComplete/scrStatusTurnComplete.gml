/// @description Signal to the status system that a turn has passed
/// @param instance instance id of the spell subsystem to check

var _instance = argument0

if (_instance.object_index != oSubsystem_Status)
{
	show_error("scrStatusTurnComplete expects object of type oSubsystem_Status.", true)
}
	
for (var i = 0; i < ds_list_size(_instance.status_timers); i++)
{
	_instance.status_timers[| i] -= 1
	_instance.status_timers[| i] = clamp(_instance.status_timers[| i], 0, 999)
	if (_instance.status_timers[| i] <= 0)
	{
		ds_list_delete(_instance.status_list, i)
		ds_list_delete(_instance.status_timers, i)
		i -= 1
	}
}