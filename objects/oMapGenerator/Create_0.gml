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

// set up the direction stack for path tracking
path_stack = ds_stack_create()

#endregion

#region Door Path

// set the path start and end
start_x = 0
start_y = 0
end_x = x_count - 1
end_y = y_count - 1

// define the path on the chunk grid
event_user(1)

#endregion

#region Key Path

// set the path start and end
start_x = 0
start_y = 0
end_x = x_count - 1
end_y = 0

// define the path on the chunk grid
event_user(1)

#endregion

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