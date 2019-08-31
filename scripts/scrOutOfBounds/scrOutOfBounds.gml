/// @description Check to see if given coordinate are inside the grid
// @param grid The grid to check
// @param x_value The x value of the coordiante to check
// @param y_value The y value of the coordinate to check

var _grid = argument0
var _x_value = argument1
var _y_value = argument2

var _size_x = ds_grid_width(_grid)
var _size_y = ds_grid_height(_grid)

if ( _x_value < 0 || _x_value > _size_x - 1 || _y_value < 0 || _y_value > _size_y - 1)
{
	return true
}
else
{
	return false
}