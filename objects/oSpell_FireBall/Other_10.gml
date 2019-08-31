/// @description

facing = oPlayer.facing

switch (facing)
{
	case "up":
		x = oPlayer.x
		y = oPlayer.y - 32
		break
	case "down":
		x = oPlayer.x
		y = oPlayer.y + 32
		break
	case "left":
		x = oPlayer.x - 32
		y = oPlayer.y
		break
	case "right":
		x = oPlayer.x + 32
		y = oPlayer.y
		break
}