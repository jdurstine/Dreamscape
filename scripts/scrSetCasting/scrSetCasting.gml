// @description Start casting a spell using oPlayer
// @param1 bbox_left
// @param2 bbox_top
// @param3 depth
// @param4 ability_number

var _bbox_left = argument0
var _bbox_top = argument1
var _depth = argument2
var _ability_number = argument3

var _ability = instance_create_depth(_bbox_left, _bbox_top, _depth, oPlayer.abilities[_ability_number])
				
oPlayer.casting = oPlayer.abilities[_ability_number]

/* 
// 1 added to make oSpell cast_times of 0 be instant
// spells are cast when the cast_timer is 1
*/
oPlayer.cast_timer = _ability.cast_time + 1 
				
oPlayer.cooldown_timers[_ability_number] = _ability.cooldown
				
instance_destroy(_ability)	
