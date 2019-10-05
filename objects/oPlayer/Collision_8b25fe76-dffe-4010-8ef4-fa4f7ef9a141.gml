/// @description Player collides with a spell

var _spell_instance = instance_place(bbox_left, bbox_top, oSpell)

if (_spell_instance.creator == self && _spell_instance.status != noone)
{
	var _status_map = global.status_list[| _spell_instance.status]
	if (_status_map[? "TYPE"] == "BUFF")
	{
		scrAddStatus(statuses, _spell_instance.status)
	}
}