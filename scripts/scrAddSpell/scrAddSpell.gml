// @description Add spell to a spells subsystem
// @param0 instance instance id of the spell subsystem to use
// @param1 object object id of the spell to add to the spell subsystem

var _instance = argument0
var _object = argument1

if (_instance.object_index != oSubsystem_Spells)
{
	show_error("scrAddSpell expects object of type oSubsystem_Spells.", true)
}

if (!object_is_ancestor(_object, oSpell))
{
	show_error("scrAddSpell excepts argument1 to be an ancestor of oSpell", true)
}

ds_list_add(_instance.spell_list, _object)
ds_list_add(_instance.cooldown_timers, 0)