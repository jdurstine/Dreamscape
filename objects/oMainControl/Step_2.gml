/// @description Manage the end of each instances turn

var _list_size = ds_list_size(oMainControl.turn_order)

if (_list_size = 0)
{
	// there are no turns to manage
	exit
}

if (cur_turn >= _list_size - 1 && turn_taken[| _list_size - 1])
{
	oMainControl.cur_turn = 0
	for (var i = 0; i < _list_size; i++)
	{
		turn_taken[| i] = false
	}
	exit
}


if(turn_taken[| cur_turn])
{
	cur_turn += 1
	exit
}