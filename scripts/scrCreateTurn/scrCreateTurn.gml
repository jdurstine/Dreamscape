/// @description Insert an object into the turn controller. A position of -1 indicates the end of the turn order.
/// @param instance_id
/// @param position

var _instance_id = argument0
var _pos = argument1

if (_pos == -1)
{
	_pos = ds_list_size(oMainControl.turn_order) - 1
}

if (ds_list_size(oMainControl.turn_order) == 0)
{
	ds_list_add(oMainControl.turn_order, _instance_id)
	ds_list_add(oMainControl.turn_taken, false)
}
else
{
	ds_list_insert(oMainControl.turn_order, _pos, _instance_id)
	ds_list_insert(oMainControl.turn_taken, _pos, false)
}

if (_pos > oMainControl.cur_turn)
{
	// do nothing
}

if (_pos < oMainControl.cur_turn)
{
	oMainControl.cur_turn += 1
}
