/// @function scrStatusDamage(system_instance)
/// @description Returns the damage applied by the current state of the status system
/// @param system_instance Status subsystem instance to be checked

var _system_instance = argument0

if (_system_instance.object_index != oSubsystem_Status)
{
	show_error("scrAddStatus expects system_instance to be of type oSubsystem_Status.", true)
}

var _damage = 0
for (var i = 0; i < ds_list_size(_system_instance.status_list); i++)
{
	var _status_id = _system_instance.status_list[| i]
	var _status = global.status_list[| _status_id]
	if (ds_map_exists(_status, "DAMAGE") && _status[? "TYPE"] == "DEBUFF")
	{
		_damage += _status[? "DAMAGE"]
	}
}

return _damage