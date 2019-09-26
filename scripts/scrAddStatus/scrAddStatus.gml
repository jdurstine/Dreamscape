/// @function scrAddStatus(system_instance, status_id)
/// @description Add status to a status subsystem
/// @param system_instance instance id of the status subsystem to use
/// @param status_id status id of the status to add to the status subsystem

var _system_instance = argument0
var _status_id = argument1

if (_system_instance.object_index != oSubsystem_Status)
{
	show_error("scrAddStatus expects system_instance to be of type oSubsystem_Status.", true)
}

if (!scrValidStatus(_status_id))
{
	show_error("status_id is not valid.", true)
}

var _status_index = ds_list_find_index(_system_instance.status_list, _status_id)
var _status_map = global.status_list[| _status_id]

if (_status_index != -1)
{
	// the status is already applied - reapply it by setting it to max duration
	ds_list_set(_system_instance.status_timers, _status_index, _status_map[? "DURATION"])
}
else
{
	// the status isn't applied yet - add the status and its timer for tracking
	ds_list_add(_system_instance.status_list, _status_id)
	ds_list_add(_system_instance.status_timers, _status_map[? "DURATION"])
}