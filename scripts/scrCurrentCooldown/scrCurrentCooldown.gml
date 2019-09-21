/// @function scrCastingTimer(subsystem_id, spell_id)
/// @description Returns the cooldown of the given spell. If no such spell is in the spell subsystem it return -1.
/// @param subsystem_id instance ID of the spell subsystem you are interested in.
/// @param spell_id object ID of the spell you want the current cooldown of.

var _subsystem_id = argument0
var _spell_id = argument1

ds_list_find_index(_subsystem_id, _spell_id)

