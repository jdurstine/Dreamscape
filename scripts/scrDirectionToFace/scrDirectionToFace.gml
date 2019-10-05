/// @function scrDirectionToFace(starting_instance, ending_instance)
/// @description Determine the direction starting_instance should face when looking at ending_instance
/// @param starting_instance Instance you want to know the facing direction for
/// @param ending_instance Instance you want starting_instance to face

var _starting_instance = argument0
var _ending_instance = argument1

to_instance_X = _ending_instance.x - _starting_instance.x
to_instance_Y = _ending_instance.y - _starting_instance.y
	
var _direction
	
if (abs(to_instance_X) >= abs(to_instance_Y) && to_instance_X > 0)
{
	_direction = directions.right
}
if (abs(to_instance_X) >= abs(to_instance_Y) && to_instance_X < 0)
{
	_direction = directions.left
}
if (abs(to_instance_X) < abs(to_instance_Y) && to_instance_Y < 0)
{
	_direction = directions.up
}
if (abs(to_instance_X) < abs(to_instance_Y) && to_instance_Y > 0)
{
	_direction = directions.down
}

return _direction