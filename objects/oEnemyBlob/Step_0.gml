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
		var _direction = scrDirectionToFace(id, oPlayer)
		facing = _direction
		
		switch (_direction)
		{
			case directions.up:
				if (scrMovementPossible(x, y - move_speed))
				{
					y -= move_speed;
				}
				else
				{
					scrBasicAttack("up", bbox_left, bbox_top, oMAttack_Basic)
				}
				break
			case directions.down:
				if (scrMovementPossible(x, y + move_speed))
				{
					y += move_speed;
				}
				else
				{
					scrBasicAttack("down", bbox_left, bbox_top, oMAttack_Basic)
				}
				break
			case directions.left:
				if (scrMovementPossible(x - move_speed, y))
				{
					x -= move_speed;
				}
				else
				{
					scrBasicAttack("left", bbox_left, bbox_top, oMAttack_Basic)
				}
				break;
			case directions.right:
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