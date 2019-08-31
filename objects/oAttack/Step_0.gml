/// @description Insert description here
// You can write your code in this editor

if move_interval > 0
{
	move_interval -= 1
}

if (move_interval <= 0)
{
	instance_destroy()
}