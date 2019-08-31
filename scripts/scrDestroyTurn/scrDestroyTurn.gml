// @description Remove an instance from the turn controller
// @param instance_id
// @param turn_taken

var _turn_index = ds_list_find_index(oMainControl.turn_order, argument0)

ds_list_delete(oMainControl.turn_order, _turn_index)
ds_list_delete(oMainControl.turn_taken, _turn_index)

if (_turn_index > oMainControl.cur_turn)
{
	// do nothing
}

if (_turn_index < oMainControl.cur_turn)
{
	oMainControl.cur_turn -= 1
}