/// @function scrAddSpell(system_instance, spell_object)
/// @description Add spell to a spells subsystem
/// @param system_instance instance id of the spell subsystem to use
/// @param spell_object object id of the spell to add to the spell subsystem

var _system_instance = argument0
var _spell_object = argument1

if (_system_instance.object_index != oSubsystem_Spells)
{
	show_error("scrAddSpell expects system_instance to be of type oSubsystem_Spells.", true)
}

if (!object_is_ancestor(_spell_object, oSpell))
{
	show_error("scrAddSpell expects spell_object to be an ancestor of oSpell", true)
}

ds_list_add(_system_instance.spell_list, _spell_object)
ds_list_add(_system_instance.cooldown_timers, 0)