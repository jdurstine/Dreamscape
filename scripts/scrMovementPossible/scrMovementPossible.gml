// @description Check to see if movement is possible in a certain direction.
// @param x1
// @param y1

var _x1 = argument0 + 8 //top left x value
var _y1 = argument1 + 8//top left y value

var _collision_list = ds_list_create()
ds_list_clear(_collision_list)

collision_rectangle_list(_x1, _y1, _x1 + 16, _y1 + 16, all, false, true, _collision_list, false)

// loop through collided instance and compare against each collidable object
// if a collidable object is found break out of the loop

var _collided = noone
for (var i = 0; i < ds_list_size(_collision_list); i++)
{
	for (var j = 0; j < ds_list_size(global.collidables); j++)
	{
		// find the instances object and check if it is a child of a collidable object
		if (object_is_ancestor(_collision_list[| i].object_index, global.collidables[| j]))
		{
			_collided = false
			break
		}
	}
	
	if (_collided != noone) // if set to something we no longer need to loop
	{
		break
	}
}

if (_collided == noone)
{
	_collided = true
}

ds_list_destroy(_collision_list)

return _collided
