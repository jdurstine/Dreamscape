/// @function scrAttemptToCast(subsystem_instance, casting_agent)
/// @description Attempt to cast the current spell
/// @param subsystem_instance instance id of the spell subsystem to check
/// @param _casting_agent Agent which is casting the spell

var _subsystem_instance = argument0
var _casting_agent = argument1

if (_subsystem_instance.object_index != oSubsystem_Spells)
{
	show_error("scrIsCasting expects object of type oSubsystem_Spells.", true)
}

if (_subsystem_instance.cast_timer == 1)
{
	var _casted = instance_create_depth(0, 0, 200, _subsystem_instance.casting)
	
	with (_casted)
	{
		creator = _casting_agent
		event_user(0)
	}
			
	_subsystem_instance.casting = noone
}