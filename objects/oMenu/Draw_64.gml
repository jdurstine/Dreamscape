/// @description Draw the menu

draw_set_halign(fa_left)
for (var i = 0; i < ds_list_size(menu_items); i++)
{
	if (menu_position == i)
	{
		draw_text_color(menu_x, menu_y + i*spacing, menu_items[| i], c_red, c_red, c_red, c_red, 1)
	}
	else
	{
		draw_text(menu_x, menu_y + i*spacing, menu_items[| i])
	}
}