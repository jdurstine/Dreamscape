/// @description Take our turn and check for death

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
		
		var _del_x = oPlayer.x - x
		var _del_y = oPlayer.y - y
		
		if (distance_to_object(oPlayer) <= 2*global.tilesize)
		{
			// we're inside shooting range, wait for the player to be in los to shoot
			if (_del_x == 0 || _del_y == 0)
			{
				// shoot
				cooldown -= 1
				clamp(cooldown, 0, 2)
				event_user(15)
			}
			else
			{
				// wait
			}
		}
		else
		{
			// we're outside of shooting range, move towards the player
			switch (_direction)
			{
				case directions.up:
					if (_del_x >= 0 && scrMovementPossible(x - 2*global.tilesize,  y - 2*global.tilesize))
					{ 
						x += 2*global.tilesize
						y -= 2*global.tilesize
					}
					else if (_del_x < 0 && scrMovementPossible(x + 2*global.tilesize,  y - 2*global.tilesize))
					{
						x -= 2*global.tilesize
						y -= 2*global.tilesize						
					}
					break
				case directions.down:
					if (_del_x >= 0 && scrMovementPossible(x - 2*global.tilesize,  y + 2*global.tilesize))
					{
						x += 2*global.tilesize
						y += 2*global.tilesize
					}
					else if (_del_x < 0 && scrMovementPossible(x + 2*global.tilesize,  y + 2*global.tilesize))
					{
						x -= 2*global.tilesize
						y += 2*global.tilesize						
					}
					break
				case directions.left:
					if (_del_y >= 0 && scrMovementPossible(x - 2*global.tilesize,  y - 2*global.tilesize))
					{
						x -= 2*global.tilesize
						y += 2*global.tilesize
					}
					else if (_del_y < 0 && scrMovementPossible(x - 2*global.tilesize,  y + 2*global.tilesize))
					{
						x -= 2*global.tilesize
						y -= 2*global.tilesize						
					}
					break			
				case directions.right:
					if (_del_y >= 0 && scrMovementPossible(x + 2*global.tilesize,  y - 2*global.tilesize))
					{
						x += 2*global.tilesize
						y += 2*global.tilesize
					}
					else if (_del_y < 0 && scrMovementPossible(x + 2*global.tilesize,  y + 2*global.tilesize))
					{
						x += 2*global.tilesize
						y -= 2*global.tilesize						
					}
					break							
			}
		}
	}	
	scrTurnOver(id)
}