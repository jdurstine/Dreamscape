// @description Find a chunk from given list which fits the given criteria
// @param chunk_list
// @param required_directions boolean array marking required directions true

var _chunk_list = argument0
var _required_directions = argument1

var _boolean_required_directions = scrDirectionsToArray(_required_directions)

while (true)
{
	// get a random chunk
	var _chunk_index = floor(random(ds_list_size(_chunk_list)))
	
	var _check = true
	
	// ensure chunk has all the required directions
	for (var i = 0; i < 4; i++)
	{
		if (_boolean_required_directions[i])
		{
			// inter0 and inter1 used to fix odd assignment issue
			var _inter0 = i + 1
			var _inter1 = _chunk_list[| _chunk_index]
			_check = _inter1[| _inter0] == _boolean_required_directions[i] && _check
		}
	}
	
	if (_check)
	{
		return _chunk_list[| _chunk_index]
	}
}