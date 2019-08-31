/// @description Place chunks on a path between two points - the path will always be traversible
/// @param end_x x value of the end of the path
/// @param end_y y value of the end of the path
/// @param room_map Grid listing the overall layout of the map
/// @param path_stack A stack of directions taken from the start to the end of the path

var _x


var _cur_x = end_x*chunk_x
var _cur_y = end_y*chunk_y
	
// place chunk based off of top of stack at end of path
x = _cur_x
y = _cur_y
	
var _directions
_directions[0] = scrReverseDirection(ds_stack_top(path_stack))
var _chunk = scrFindGoodChunk(chunk_types, _directions)
chunk_name = _chunk[| 0]
event_user(0)
	
// traverse the path placing blocks as we go
while (true)
{
	var _directions = array_create(2)
	_directions[0] = ds_stack_pop(path_stack) // to
	_directions[1] = scrReverseDirection(ds_stack_top(path_stack)) // from, path_stack is based off previous chunk
		
	switch (_directions[0])
	{
		case directions.up:
			_cur_y += chunk_y
			break
		case directions.down:
			_cur_y -= chunk_y
			break
		case directions.left:
			_cur_x += chunk_x
			break
		case directions.right:
			_cur_x -= chunk_x
			break
	}
		
	x = _cur_x
	y = _cur_y
		
	var _chunk = scrFindGoodChunk(chunk_types, _directions)
	chunk_name = _chunk[| 0]
	event_user(0)	
		
	// break loop once we've hit start
	if (ds_stack_size(path_stack) == 1)
	{
		break
	}
}
	
// place an appropriate chunk at the start of the path
x = start_x
y = start_y
	
var _directions
_directions[0] = ds_stack_top(path_stack)
var _chunk = scrFindGoodChunk(chunk_types, _directions)
chunk_name = _chunk[| 0]
event_user(0)
