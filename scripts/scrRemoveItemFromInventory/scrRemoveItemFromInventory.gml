/// @function scrRemoveItemFromInventory(system_instance, item_id count)
/// @description Remove one of an item from the inventory.
/// @param system_instance Instance ID of the items subsystem of interest.
/// @param item_id item_id of the item you want to remove from the inventory.
/// @param count Amount of the item you want to remove from the inventory.

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
	show_error("Why are you trying to remove less than 1 item from the inventory? -_-", true)
}

_system_instance.item_counts[? _item_id] -= _count

if (_system_instance.item_counts[? _item_id] <=  0)
{
	var _inventory_index = ds_list_find_index(_system_instance.inventory, _item_id)
	ds_list_delete(_system_instance.inventory, _inventory_index)
	ds_map_delete(_system_instance.item_counts, _item_id)
}