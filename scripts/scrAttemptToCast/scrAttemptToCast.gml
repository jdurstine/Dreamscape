/// @description Attempt to cast the current spell
/// @param instance instance id of the spell subsystem to check

var _instance = argument0

if (_instance.object_index != oSubsystem_Spells)
{
	show_error("scrIsCasting expects object of type oSubsystem_Spells.", true)
}

if (_instance.cast_timer == 1)
{
	var _casted = instance_create_depth(0, 0, 200, _instance.casting)
	
	with (_casted)
	{
		event_user(0)
	}
	
	/* defunct until buffs added back
	if (object_is_ancestor(_instance.casting, oBuff))
	{
		ds_list_add(buffs, _casted)
	}
	*/
			
	_instance.casting = noone
}