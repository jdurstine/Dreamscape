// @description Return whether the given instance is allowed to make a turn
// @param instance_id

var _turn_index = ds_list_find_index(oMainControl.turn_order, argument0)
return (_turn_index == oMainControl.cur_turn && not oMainControl.turn_taken[| _turn_index])