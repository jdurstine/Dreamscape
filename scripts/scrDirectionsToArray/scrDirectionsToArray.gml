/// @description Converts an array of directions into an array of booleans
/// @param list of directions

var _directions

// convert to an array format if a list is provided
if (ds_exists(argument0, ds_type_list))
{
	_directions = [] // must have some array in case the list is empty
	for (var i = 0; i < ds_list_size(argument0); i++)
	{
		_directions[i] = argument0[| i]
	}
}
else if (is_array(argument0))
{
	_directions = argument0
}
else
{
	show_error("List or array was not supplied.", true)
}

var _return_array = array_create(4, false)

for (var i = 0; i < array_length_1d(_directions); i++)
{
	switch (_directions[i])
	{
		case directions.up:
			_return_array[0] = true
			break
		case directions.down:
			_return_array[1] = true
			break
		case directions.left:
			_return_array[2] = true
			break
		case directions.right:
			_return_array[3] = true
			break
		default:
			show_error("Non-directional value detected.", true)
			break
	}
}

return _return_array