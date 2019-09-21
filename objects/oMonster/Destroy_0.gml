/// @description Do any necessary clean up and spawn loot.

scrDestroyTurn(id)

if (random(100.0) < drop_chance)
{
	var _item_id = drop_list[floor(random(array_length_1d(drop_list)))]
	scrCreateItem(_item_id, x, y, depth, 1)
}