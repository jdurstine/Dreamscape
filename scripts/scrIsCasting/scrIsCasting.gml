// @description Tell caller whether subsystem is currently casting spell
// @param instance instance id of the spell subsystem to check

var _instance = argument0

if (_instance.object_index != oSubsystem_Spells)
{
	show_error("scrIsCasting expects object of type oSubsystem_Spells.", true)
}

if (_instance.casting != noone)
{
	return true
}
else
{
	return false
}




