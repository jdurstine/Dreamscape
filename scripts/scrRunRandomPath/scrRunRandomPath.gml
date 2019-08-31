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
var _temp_map = argument1 // copy of current path
var _path_stack = argument2
var _cur_x = argument3 // cur is also the start of the path when first called
var _cur_y = argument4 // cur is also the start of the path when first called
var _end_x = argument5
var _end_y = argument6
var _path_type = argument7

if (_cur_x < 0 || _cur_y < 0)
{
	show_message("weirdchamp")
}

// set the current node as visited
ds_grid_set(_temp_map, _cur_x, _cur_y, 1)

// we've reached the end - our path is complete
if (_cur_x == _end_x && _cur_y == _end_y)
{
	ds_grid_set(_room_map, _cur_x, _cur_y, _path_type)
	return true
}

var _direction = floor(random(4))
var _next_x = noone
var _next_y = noone
var _rotations = 0

while (true)
{	
	// we've checked every adjacent node without finding the end, break out to continue recursion at a previous point
	if (_rotations > 3)
	{
		return false
	}
	
	_direction = (_direction + _rotations) mod 4
	
	switch (_direction)
	{
		case directions.up:
			_next_x = _cur_x
			_next_y = _cur_y - 1
			break
		case directions.down:
			_next_x = _cur_x
			_next_y = _cur_y + 1
			break
		case directions.left:
			_next_x = _cur_x - 1
			_next_y = _cur_y
			break
		case directions.right:
			_next_x = _cur_x + 1
			_next_y = _cur_y
			break
	}
	
	// the move should always be in the bounds of the grid
	if (scrOutOfBounds(_temp_map, _next_x, _next_y))
	{
		_rotations += 1
		continue
	}
	
	// the move should be to an unvisited node
	if (ds_grid_get(_temp_map, _next_x, _next_y) != 0)
	{
		_rotations += 1
		continue
	}
	
	ds_stack_push(_path_stack, _direction)
	if (scrRunRandomPath(_room_map, _temp_map, _path_stack, _next_x, _next_y, _end_x, _end_y, _path_type))
	{
		ds_grid_set(_room_map, _cur_x, _cur_y, _path_type)
		return true
	}
	else
	{
		ds_stack_pop(_path_stack)
		continue
	}
}