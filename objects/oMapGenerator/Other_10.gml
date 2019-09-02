/// @description Create a room

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

chunk_name = noone