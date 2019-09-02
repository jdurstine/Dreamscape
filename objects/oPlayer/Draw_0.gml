#region Directional Draw

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

#endregion

#region Casting Animation


if (spells.casting != noone)
{
	if (!casting_anim_started)
	{
		casting_anim_started = true
		casting_anim_last = current_time
	}
	
	var _dx = (sprite_get_width(sCasting) - oPlayer.sprite_width)/2
	if (current_time - casting_anim_last > casting_anim_wait)
	{
		casting_anim_last = current_time
		instance_create_depth(x - _dx, y - _dx, depth - 1, oCastingAnim)
	}
	
}
else if (casting_anim_started)
{
	casting_anim_started = false
}

#endregion