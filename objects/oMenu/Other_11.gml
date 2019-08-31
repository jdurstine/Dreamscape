/// @description Move the menu up one

menu_position = menu_position - 1
if (menu_position < 0)
{
	menu_position = ds_list_size(menu_items) - 1
}


