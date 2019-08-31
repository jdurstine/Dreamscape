/// @function scrLoadChunk();
/// @description Generates a given chunk by creating instances of its objects
/// @param x x value to create instance at
/// @param y y value to create instance at
/// @return {boolean} Truthy; whether the level was successfully generated

// temporary array for the specific level
var level_array = chunk_data;
var _x = argument0
var _y = argument1

// iterate over every array index, row by row, column by column
for (var i = 0; i < array_height_2d(level_array); i++)
{ 
    for (var j = 0; j < array_length_2d(level_array, i); j++)
	{ 
        
        // read the string at the array indices
        var character = level_array[i, j];
        
        // lookup the object associated with the character
        var object = scrChunkLookup(character);

        // ensure the object is defined
        if (object == undefined) continue;
        
        // create the instance at given coordinates
        instance_create_depth(i * cell_width + _x, j * cell_height + _y, depth, object);
    }
}

return true;