/// @function scrAddToChunkMap(id, )
/// @description Add information to a given property of a chunk map
/// @param {real} id id of the map you want to add information to
/// @param {string} property property name 
/// @param value value to add to given property

var _id = argument0
var _property = argument1
var _value = argument2

switch (_property)
{
	case "direction":
	
		if (!scrIsDirection(_value))
		{
			show_error("Value passed was not a direction.", true)
		}
		
		if(!bool(ds_list_find_index(_id[? "directions"], _value)))
		{
			ds_list_add(_id[? "directions"], _value)
		}
		
		break
	default:
		show_error("No such property exists.", true)
		break
}