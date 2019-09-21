/// @function scrPlaceItemInInventory(system_instance, item_id, count)
/// @description Places some variable number of item in the players iventory
/// @param system_instance oSubsystem_Items instance to place item in
/// @param itemid id of item to be placed in the inventory
/// @param count Number of item you want to place in inventory

var _system_instance = argument0
var _item_id = argument1
var _count = argument2

if (_system_instance.object_index != oSubsystem_Items)
{
	show_error("scrPlaceItemInInventory expects system_instance to be of type oSubsystem_items.", true)
}

if (!scrValidItem(_item_id))
{
	show_error("item_id is not valid.", true)
}

if (_count < 1)
{
	show_error("Why are you trying to add less than 1 item to the inventory? -_-", true)
}

if (ds_list_find_index(_system_instance.inventory, _item_id) != -1)
{
	// item is already in the inventory, add the counts
	_system_instance.item_counts[? _item_id] += _count
}
else
{
	// item is not in the inventory, create new entries
	ds_list_add(_system_instance.inventory, _item_id)
	_system_instance.item_counts[? _item_id] = _count
}
