/// @description Add items from the players inventory into the menu

var _items = oPlayer.items
for (var i = 0; i < ds_list_size(_items.inventory); i++)
{
	var _item_id = _items.inventory[| i]
	
	var _count_string = string(_items.item_counts[? _item_id])
	
	var _item = global.item_list[| _item_id]
	var _item_name = _item[? "NAME"]
	
	ds_list_add(menu_items, _item_name + " : " + _count_string)
}
