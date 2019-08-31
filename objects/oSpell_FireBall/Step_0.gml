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
		case "up":
			y -= move_speed
			break
		case "down":
			y += move_speed
			break
		case "left":
			x -= move_speed
			break
		case "right":
			x += move_speed
			break
	}
	
	scrTurnOver(id)
}
