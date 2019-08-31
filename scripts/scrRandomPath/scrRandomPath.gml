/// @description Set a random path through a grid
/// @param room_map Grid filled with 0s representing the room
/// @param temp_map Grid representing the current traversal
/// @param path_stack Stack representing the path taken to the end
/// @param start_x x value of the paths start
/// @param start_y y value of the path start
/// @param end_x x value of the paths end
/// @param end_y y value of the paths end
/// @param path_type Interger representing the path

var _room_map = argument0
var _path_stack = argument1
var _cur_x = argument2 // cur is also the start of the path when first called
var _cur_y = argument3 // cur is also the start of the path when first called
var _end_x = argument4
var _end_y = argument5
var _path_type = argument6

var _temp_map = ds_grid_create(ds_grid_width(_room_map), ds_grid_height(_room_map))
ds_grid_copy(_temp_map, _room_map)

var _return = scrRunRandomPath(_room_map, _temp_map, _path_stack, _cur_x, _cur_y, _end_x, _end_y, _path_type)

ds_grid_destroy(_temp_map)

return _return