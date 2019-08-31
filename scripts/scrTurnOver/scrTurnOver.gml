// @description Change a given instances turn_taken flag to true
// @param instance_id

var _turn_index = ds_list_find_index(oMainControl.turn_order, argument0)
oMainControl.turn_taken[| _turn_index] = true