/// @description Create the map for the given room

randomise()

#region Room and Chunk Setup

// set the pixel sizes for chunks
chunk_x = 32*8 
chunk_y = 32*8

// calculate the amount of chunks based off of room and chunk pixel sizes
x_count = room_width/chunk_x 
y_count = room_height/chunk_y  

// list out the chunk possibilities for randomization
chunk_types = ds_list_create()
ds_list_add(chunk_types, scrCreateList("room_X1", true, true, true, true))
ds_list_add(chunk_types, scrCreateList("room_T1", false, true, true, true))
ds_list_add(chunk_types, scrCreateList("room_T2", true, true, true, false))
ds_list_add(chunk_types, scrCreateList("room_T3", true, false, true, true))
ds_list_add(chunk_types, scrCreateList("room_T4", true, true, false, true))

#endregion

#region Define Paths

#region Initialize

// set up grid which holds chunk information for each chunk
chunk_grid = ds_grid_create(x_count, y_count)
for (var i  = 0; i < ds_grid_width(chunk_grid); i++)
{
	for (var j = 0; j < ds_grid_height(chunk_grid); j++)
	{
		chunk_grid[# i,  j] = scrChunkMapFactory()
	}
}

// set up grid to track pathing
path_grid = ds_grid_create(x_count, y_count)
ds_grid_set_region(path_grid, 0, 0, x_count, y_count, 0)

// set up the direction stack for path tracking
path_stack = ds_stack_create()

#endregion

// set start and end index values for path
start_x = 0
start_y = 0
end_x = x_count - 1
end_y = y_count - 1

// define the path on the chunk grid
event_user(1)

#endregion

#region Place Chunks

for (var i = 0; i < x_count; i++)
{
	for (var j = 0; j < y_count; j++)
	{
		x = i*chunk_x
		y = j*chunk_y
		
		var chunk_map = chunk_grid[# i, j]
		var _chunk = scrFindGoodChunk(chunk_types, chunk_map[? "directions"])
		chunk_name = _chunk[| 0]
		
		event_user(0)	
	}
}

#endregion

/* copy of logic
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
*/