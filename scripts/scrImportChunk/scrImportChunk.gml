/// @function scrImportChunk(room_name)
/// @description Loads ascii levels from a text document into memory
/// @param {string} room_name The name of the room
/// @return {boolean} Truthy; whether the level file was read correctly

var file_name = working_directory + "\\" + argument0 +".txt";

// check if the file exists
if (file_exists(file_name))
{
    // open file
    var file = file_text_open_read(file_name); 
    
    // create a temporary array to store the level's data
    var temp_level_array = -1;

    // the row counter of the level-specific data
    var level_row = 0;
    
    // repeat this code block until the end of the file is reached
    while (!file_text_eof(file))
	{ 
        
        // get the current line of text in the file
        var line = file_text_read_string(file);
        
        // the line of text contains level data
        if (line != level_separator)
		{
            
            // read the line backwards and insert each character into the array
            for(var i = string_length(line) - 1; i >= 0; i--)
			{
                temp_level_array[i, level_row] = string_char_at(line, i+1);
            }
            
            // increase the row
            level_row++;
        }
		else
		{            
            // save the temporary chunk data
            chunk_data = temp_level_array;
            temp_level_array = -1;
            
            level_row = 0;
        }
        
        file_text_readln(file);
    }
    
    file_text_close(file);
}
else 
{
    show_error("Cannot locate " + string(file_name) + "!", true);
    return false;
}

return true;