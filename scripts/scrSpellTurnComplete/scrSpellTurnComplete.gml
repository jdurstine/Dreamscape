/// @description Signal to the spell system that a turn has passed
/// @param instance instance id of the spell subsystem to check

var _instance = argument0

if (_instance.object_index != oSubsystem_Spells)
{
	show_error("scrIsCasting expects object of type oSubsystem_Spells.", true)
}

_instance.cast_timer -= 1
_instance.cast_timer = clamp(_instance.cast_timer, 0, 100)
	
for (var i = 0; i < ds_list_size(_instance.cooldown_timers); i++)
{
	_instance.cooldown_timers[| i] -= 1
	_instance.cooldown_timers[| i] = clamp(_instance.cooldown_timers[| i], 0, 100)
}