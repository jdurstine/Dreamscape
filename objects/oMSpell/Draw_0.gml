/// @description Draw sprite with appropriate orientation

switch (facing)
{
	case directions.up:
		draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 0, c_white, 1)
		break
	case directions.down:
		draw_sprite_ext(sprite_index, -1, x + 32, y + 32, 1, 1, 180, c_white, 1)
		break
	case directions.left:
		draw_sprite_ext(sprite_index, -1, x, y + 32, 1, 1, 90, c_white, 1)
		break
	case directions.right:
		draw_sprite_ext(sprite_index, -1, x + 32, y, 1, 1, 270, c_white, 1)
		break
}