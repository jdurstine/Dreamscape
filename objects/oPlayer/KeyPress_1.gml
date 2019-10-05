// @description Main Player Code

if (global.paused)
{
	exit
}

var _valid_input = false

switch (keyboard_key)
{
	#region Hotkey Gate
	// gate to ensure we're only acting on valid inputs
	case global.inventory:
		global.paused = true
		instance_create_depth(0, 0, depth, oMenu_Inventory)
		break
	case global.skipturn:
	case global.up:
	case global.down:
	case global.left:
	case global.right:
	case global.ability1:
	case global.ability2:
	case global.ability3:
	case global.ability4:
		_valid_input = true
		break
	#endregion
}

if (scrCanAct(id) && global.paused == false && _valid_input == true)
{
	if (!scrIsCasting(spells))
	{
		#region Input Functionality
		switch (keyboard_key)
		{
			case global.up:
				if (scrMovementPossible(x, y - move_speed))
				{
					y -= move_speed;
				}
				else
				{
					scrBasicAttack("up", bbox_left, bbox_top, basic_attack)
				}
				facing = "up"
				break
			case global.down:
				if (scrMovementPossible(x, y + move_speed))
				{
				
					y += move_speed;
				}
				else
				{
					scrBasicAttack("down", bbox_left, bbox_top, basic_attack)
				}
				facing ="down"
				break
			case global.left:
				if (scrMovementPossible(x - move_speed, y))
				{
					x -= move_speed;
				}
				else
				{
					scrBasicAttack("left", bbox_left, bbox_top, basic_attack)
			
				}
				facing = "left"
				break;
			case global.right:
				if (scrMovementPossible(x + move_speed, y))
				{
					x += move_speed;
				}
				else
				{
					scrBasicAttack("right", bbox_left, bbox_top, basic_attack)
				}
				facing = "right"
				break
			case global.ability1:
				scrStartCasting(spells, 0)
				break
			case global.ability2:
				scrStartCasting(spells, 1)
				break
			case global.ability3:
				scrStartCasting(spells, 2)	
				break
			case global.ability4:
				scrStartCasting(spells, 3)				
				break
		}
		#endregion
	}
	
	#region Casting Functionality
	
	if (scrIsCasting(spells))
	{
		scrAttemptToCast(spells, self)
	}
	
	scrSpellTurnComplete(spells)
	
	#endregion	
	
	#region Status Functionality
	
	oPlayer.player_health -= scrStatusDamage(statuses)
	
	scrStatusTurnComplete(statuses)
	
	#endregion
	
	scrTurnOver(id)
}

