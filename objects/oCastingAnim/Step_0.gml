/// @description Destroy the animation if the duration has passed

if (current_time - start_time >= duration)
{
	instance_destroy()
}