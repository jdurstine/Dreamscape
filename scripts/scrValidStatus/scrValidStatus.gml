/// @function scrValidStatus(status_id)
/// @description Returns true if status is valid, false if not
/// @param status_id ID of the status you want to check the validity of

if (argument0 >= ds_list_size(global.status_list) or argument0 < 0)
{
	return false
}
else
{
	return true
}