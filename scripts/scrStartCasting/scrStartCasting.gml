// @description Start casting a spell from the given spell subsystem instance
// @param0 instance instance id of the spell subsystem to use
// @param1 spell_number the number of the spell you want to cast

var _instance = argument0
var _spell_number = argument1

if (_instance.object_index != oSubsystem_Spells)
{
	show_error("scrStartCasting expects object of type oSubsystem_Spells.", true)
}

// only cast the spell if it's not on cooldown
if (_instance.cooldown_timers[| _spell_number] == 0)
{
	// set which spell we are currently casting
	_instance.casting = _instance.spell_list[| _spell_number]

	// set cooldown timer for chosen spell
	// must create an instance to retrieve it's variables
	var _spell = instance_create_depth(0, 0, 200, _instance.casting)
	_instance.cooldown_timers[| _spell_number] = _spell.cooldown + 1
	
	// 1 added to make oSpell cast_times of 0 be instant
	// spells are cast when the cast_timer is 1
	_instance.cast_timer = _spell.cast_time + 1 

	instance_destroy(_spell)	
}