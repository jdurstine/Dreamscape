/// @description Converts an array of directions into an array of booleans
// @param array of directions

var _directions = argument0
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
	}
}

return _return_array