/// @description Create the map for the given room

randomise()

x_count = 4
y_count = 3

chunk_x = 1024/x_count // horizontal size for chunks
chunk_y = 768/y_count // vertical size for chunks

// list out the chunk possibilities for randomization
chunk_types = ds_list_create()
ds_list_add(chunk_types, scrCreateList("room_X1", true, true, true, true))
ds_list_add(chunk_types, scrCreateList("room_T1", false, true, true, true))
ds_list_add(chunk_types, scrCreateList("room_T2", true, true, true, false))
ds_list_add(chunk_types, scrCreateList("room_T3", true, false, true, true))
ds_list_add(chunk_types, scrCreateList("room_T4", true, true, false, true))

// set up grid to track pathing
level_grid = ds_grid_create(x_count, y_count)
ds_grid_set_region(level_grid, 0, 0, x_count, y_count, 0)

// set up the direction stack for path tracking
path_stack = ds_stack_create()

// set start and end index values for path
start_x = 0
start_y = 0
end_x = x_count - 1
end_y = y_count - 1

// run the random path recursion
if (scrRandomPath(level_grid, path_stack, start_x, start_y, end_x, end_y, 1))
{
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
}
else
{
	show_error("path could not be found", true)
}