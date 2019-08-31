// @description Use basic attack in specified direction
// @param orientation
// @param x1
// @param y1
// @param attack

var _orientation = argument0
var _x1 = argument1
var _y1 = argument2
var _attack = argument3
var _instance_id

switch (_orientation)
{
	case "up":
		_instance_id = instance_create_depth(_x1, _y1 - 32, depth - 1, _attack)
		_instance_id.image_angle = 0
		break
	case "down":
		_instance_id = instance_create_depth(_x1 + 32, _y1 + 64, depth - 1, _attack)
		_instance_id.image_angle = 180
		break
	case "left":
		_instance_id = instance_create_depth(_x1 - 32, _y1 + 32, depth - 1, _attack)
		_instance_id.image_angle = 90
		break
	case "right":
		_instance_id = instance_create_depth(_x1 + 64, _y1, depth - 1, _attack)
		_instance_id.image_angle = 270
		break
	default:
		show_error("_orientation not given", false)
		return 0
}

return _instance_id
