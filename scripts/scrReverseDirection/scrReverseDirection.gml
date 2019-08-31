/// @description Reverse the direction
/// @param direction Direction to reverse

var _direction = argument0

switch (_direction)
{
	case directions.up:
		return directions.down
	case directions.down:
		return directions.up
	case directions.left:
		return directions.right
	case directions.right:
		return directions.left
}