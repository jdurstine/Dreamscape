/// @function scrValidItem(item_id)
/// @description Returns true if item is valid, false if not
/// @param item_id ID of the item you want to check the validity of

if (argument0 >= ds_list_size(global.item_list) or argument0 < 0)
{
	return false
}
else
{
	return true
}