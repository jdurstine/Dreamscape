/// @description Initialize level generation

// base parameters

chunk_name = noone
entrance_up = noone
entrance_down = noone
entrance_left = noone
entrance_right = noone

event_user(0)

if (!is_bool(entrance_up) || !is_bool(entrance_down) || !is_bool(entrance_left) || !is_bool(entrance_right) || !is_string(chunk_name))
{
	show_error(string(id) = " parameters not properly set.", true)
}


// holds chunk
chunk_data = -1;

// symbol used to denote the end of a level
level_separator = "END";

// objects will spawn at these (x, y) intervals
cell_width = 32;
cell_height = 32; 

// load levels from the file
scrImportChunk(chunk_name);

scrLoadChunk(x, y);