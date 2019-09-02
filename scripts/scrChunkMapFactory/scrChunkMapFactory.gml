/// @function scrChunkMapFactor()
/// @description Factory function producing maps for chunk abstraction grid

var attribute_names = ["directions"]

var chunk_map = ds_map_create()

for (var i = 0; i < array_length_1d(attribute_names); i++)
{
	var temp_map = ds_list_create()
	ds_map_add(chunk_map, attribute_names[i], temp_map)
}

return chunk_map