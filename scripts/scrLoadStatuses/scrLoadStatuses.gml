/// @function scrLoadStatuses()
/// @description Loads all statuses into the global status list (global list of maps)
/// @return {boolean}

var _file_name = working_directory + "\\" + "statuslist" +".txt";

if (file_exists(_file_name))
{
	var _file = file_text_open_read(_file_name)
	global.status_list = ds_list_create()
	
	while (!file_text_eof(_file))
	{
		var _line = file_text_read_string(_file)
		
		if (string_pos("BEGIN", _line) != 0)
		{
			var _temp_map = ds_map_create()
			
			while (true)
			{
				file_text_readln(_file)
				_line = file_text_read_string(_file)
			
				if (string_pos("ATR, ", _line) != 0)
				{
					// we don't care about the ATR, part now - remove it
					_line = string_delete(_line, 1, 5)
				
					// extract the attribute names and values
					var _comma_index = string_pos(",", _line)
					var _atr_name = string_copy(_line, 1, _comma_index - 1)
					var _atr_value = string_copy(_line, _comma_index + 2, string_length(_line) - (_comma_index + 1))
	
					// add attribute and associated value to map
					_temp_map[? _atr_name] = _atr_value
				}
				else if (string_pos("END", _line) != 0)
				{
					// we're finished with the item, add it to the global item list
					ds_list_add(global.status_list, _temp_map)
					break
				}
				else
				{
					show_error("Status entry with \"" + _line + "\" not properly formed.", true)
				}
			}
		}
		
		file_text_readln(_file)
	}
	
	return true
}
else
{
	return false
}
