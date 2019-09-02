/// @description Add a path between two points to the chunk_grid
// The start and end parameters are defined in the create event before running this.

// reset any needed objects to their default values
ds_grid_set_region(path_grid, 0, 0, x_count, y_count, 0)
ds_stack_clear(path_stack)

if (scrRandomPath(path_grid, path_stack, start_x, start_y, end_x, end_y, 1))
{
	var _cur_x = end_x
	var _cur_y = end_y
	
	// the end of the path only has one entrance - just take the top
	scrAddToChunkMap(chunk_grid[# _cur_x, _cur_y], "direction" , scrReverseDirection(ds_stack_top(path_stack)))
	
	// traverse the path
	while (true)
	{
		var _directions = array_create(2)
		_directions[0] = ds_stack_pop(path_stack) // to
		_directions[1] = scrReverseDirection(ds_stack_top(path_stack)) // from, path_stack is based off previous chunk
		
		switch (_directions[0])
		{
			case directions.up:
				_cur_y++
				break
			case directions.down:
				_cur_y--
				break
			case directions.left:
				_cur_x++
				break
			case directions.right:
				_cur_x--
				break
		}
		
		scrAddToChunkMap(chunk_grid[# _cur_x, _cur_y], "direction", _directions[0])
		scrAddToChunkMap(chunk_grid[# _cur_x, _cur_y], "direction", _directions[1])
		
		// break loop once we've hit start
		if (ds_stack_size(path_stack) == 1)
		{
			break
		}
	}
	
	// place an appropriate chunk at the start of the path
	_cur_x = start_x
	_cur_y = start_y
	scrAddToChunkMap(chunk_grid[# _cur_x, _cur_y], "direction", ds_stack_top(path_stack))

}
else
{
	show_error("path could not be found", true)
}
