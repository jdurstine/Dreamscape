#region Directional Draw

switch (facing)
{
	case directions.up:
		draw_sprite(asset_get_index(sprite_root + "_Up"), -1, x, y)
		break
	case directions.down:
		draw_sprite(asset_get_index(sprite_root + "_Down"), -1, x, y)
		break
	case directions.left:
		draw_sprite(asset_get_index(sprite_root + "_Left"), -1, x, y)
		break
	case directions.right:
		draw_sprite(asset_get_index(sprite_root + "_Right"), -1, x, y)
		break
}

#endregion