#region Casting Animation

var _casting_color = c_white

if (spells.casting != noone)
{
	var _casting_color_value = 255
	_casting_color_value = 255*sqr(sin(current_time/750))
	_casting_color = make_colour_rgb(255, _casting_color_value, _casting_color_value)
}

#endregion

#region Directional Draw

switch (facing)
{
	case "up":
		draw_sprite_ext(sPlayer_Up, -1, x, y, 1, 1, 0, _casting_color, 1)
		break
	case "down":
		draw_sprite_ext(sPlayer_Down, -1, x, y, 1, 1, 0, _casting_color, 1)
		break
	case "left":
		draw_sprite_ext(sPlayer_Left, -1, x, y, 1, 1, 0, _casting_color, 1)
		break
	case "right":
		draw_sprite_ext(sPlayer_Right, -1, x, y, 1, 1, 0, _casting_color, 1)
		break
}

#endregion
