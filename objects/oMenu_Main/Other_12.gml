/// @description Handle menu items

if (menu_position == 0)
{
	room_goto(rDungeon)
}
else if (menu_position == 1)
{
	room_goto(rTestDungeon)
}
else if (menu_position == 2)
{
	game_end()
}