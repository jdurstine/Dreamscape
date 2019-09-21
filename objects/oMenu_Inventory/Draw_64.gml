/// @description Draw the inventory in a small box

// draw the background shape
draw_set_colour(c_black)
draw_rectangle(menu_x, menu_y, menu_x + 200, menu_y + 300, false)

// inherit the parent event
event_inherited()

