/// @description Spell creation code

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

var _break_test = noone
var _new_x = x
var _new_y = y
var _new_instance = noone
while (true)
{
	switch (facing)
	{
		case "up":
			_new_y -= 32
			break
		case "down":
			_new_y += 32
			break
		case "left":
			_new_x -= 32
			break
		case "right":
			_new_x += 32
			break		
	}
	
	_break_test = _new_x < 0|| _new_y < 0 || _new_x + 32 > room_width || _new_y + 32 > room_height
	if (_break_test) // if the upcoming instances bbox will be out of the room stop
	{
		break
	}
	
	_new_instance = instance_copy(true)
	_new_instance.facing = facing
	_new_instance.x = _new_x
	_new_instance.y = _new_y
}