switch (facing)
{
	case "up":
		draw_sprite_ext(sPlayer, -1, x, y, 1, 1, 0, c_white, 1)
		break
	case "down":
		draw_sprite_ext(sPlayer, -1, x + 32, y + 32, 1, 1, 180, c_white, 1)
		break
	case "left":
		draw_sprite_ext(sPlayer, -1, x, y + 32, 1, 1, 90, c_white, 1)
		break
	case "right":
		draw_sprite_ext(sPlayer, -1, x + 32, y, 1, 1, 270, c_white, 1)
		break
}