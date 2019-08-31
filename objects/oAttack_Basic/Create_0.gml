/// @description Insert description here

event_inherited()

damage = 10

var _buff = instance_find(oBuff_FireWeapon, instance_number(oBuff_FireWeapon) - 1)

if (_buff != noone)
{
	if (_buff.layer == layer_get_id("GUI"))
	{
		// pass
	}
	else
	{
		damage += _buff.damage
	}
}