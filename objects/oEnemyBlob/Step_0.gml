/// @description Main monster behaviour
// You can write your code in this editor

if (oHealth <= 0)
{
	instance_destroy()
}

if (scrCanAct(id))
{
	var _player_check = collision_circle(x + sprite_width/2, y + sprite_height/2, 3*32, oPlayer, false, true)
	
	if (_player_check != noone)
	{
		aggroed = true
	}
	
	if (aggroed)
	{
		to_player_X = oPlayer.x - x
		to_player_Y = oPlayer.y - y
	
		var _direction
	
		if (abs(to_player_X) >= abs(to_player_Y) && to_player_X > 0)
		{
			_direction = "right"
		}
		if (abs(to_player_X) >= abs(to_player_Y) && to_player_X < 0)
		{
			_direction = "left"
		}
		if (abs(to_player_X) < abs(to_player_Y) && to_player_Y < 0)
		{
			_direction = "up"
		}
		if (abs(to_player_X) < abs(to_player_Y) && to_player_Y > 0)
		{
			_direction = "down"
		}
	
		switch (_direction)
		{
			case "up":
				if (scrMovementPossible(x, y - move_speed))
				{
					y -= move_speed;
				}
				else
				{
					scrBasicAttack("up", bbox_left, bbox_top, oMAttack_Basic)
				}
				break
			case "down":
				if (scrMovementPossible(x, y + move_speed))
				{
					y += move_speed;
				}
				else
				{
					scrBasicAttack("down", bbox_left, bbox_top, oMAttack_Basic)
				}
				break
			case "left":
				if (scrMovementPossible(x - move_speed, y))
				{
					x -= move_speed;
				}
				else
				{
					scrBasicAttack("left", bbox_left, bbox_top, oMAttack_Basic)
				}
				break;
			case "right":
				if (scrMovementPossible(x + move_speed, y))
				{
					x += move_speed;
				}
				else
				{
					scrBasicAttack("right", bbox_left, bbox_top, oMAttack_Basic)
				}
				break
		}
	}
	scrTurnOver(id)
}