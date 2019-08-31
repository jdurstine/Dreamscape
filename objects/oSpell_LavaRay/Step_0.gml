/// @description Destroy the spell object after a few steps

if (steps_left > 0)
{
	steps_left -= 1
}
else
{
	instance_destroy()
}