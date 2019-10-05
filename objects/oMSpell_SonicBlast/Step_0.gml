/// @description 

if (hit_something)
{
	instance_destroy()
}

if (scrCanAct(id))
{	
	if (waiting)
	{
		waiting = false
		scrTurnOver(id)
		exit
	}

	switch (facing)
	{
		case directions.up:
			y -= move_speed
			break
		case directions.down:
			y += move_speed
			break
		case directions.left:
			x -= move_speed
			break
		case directions.right:
			x += move_speed
			break
	}
	
	scrTurnOver(id)
}