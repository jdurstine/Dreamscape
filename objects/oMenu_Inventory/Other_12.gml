/// @description Attempt to equip or use item

if (ds_list_size(menu_items) == 0)
{
	// do nothing
}
else
{
	var _items = oPlayer.items
	scrEquipItem(_items, _items.inventory[| menu_position])
}
