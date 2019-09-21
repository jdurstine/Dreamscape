/// @function scrEquipItem(system_instance, item_id)
/// @description Equip an item - returns the result of attempting to equip. 1: succeeded, -1: item not allowed to be equipped.
/// @param system_instance Instance of an oSubsystem_Items
/// @param item_id item_id you want to equipment

var _system_instance = argument0
var _item_id = argument1

var _item = global.item_list[| _item_id]
var _slot = _item[? "TYPE"]

if (_system_instance.object_index != oSubsystem_Items)
{
	show_error("scrEquipItem expects system_instance to be of type oSubsystem_Items.", true)
}

if (!scrValidItem(_item_id))
{
	show_error("item_id is not valid.", true)
}

if (!ds_map_exists(_system_instance.equipment, _slot))
{
	// item is not equippable
	return -1
}
else if (_system_instance.equipment[? _slot] == noone)
{
	// no item is equipped, just put it on
	scrRemoveItemFromInventory(_system_instance, _item_id, 1)
	_system_instance.equipment[? _slot] = _item_id
	
	return 1
}
else
{
	// item is already in slot, place slotted item in inventory, equip item we want
	scrPlaceItemInInventory(_system_instance, _system_instance.equipment[? _slot], 1)
	scrRemoveItemFromInventory(_system_instance, _item_id, 1)
	_system_instance.equipment[? _slot] = _item_id
	
	return 1
}
