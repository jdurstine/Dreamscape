/// @description Cast spell

if (cooldown <= 0)
{
	cooldown = 2
	
	var _spell_instance = instance_create_depth(x, y, 0, oMSpell_SonicBlast)
	_spell_instance.facing = facing
	
	switch (facing)
	{
		case directions.up:
			_spell_instance.x = x
			_spell_instance.y = y - 32
			break
		case directions.down:
			_spell_instance.x = x
			_spell_instance.y = y + 32
			break
		case directions.left:
			_spell_instance.x = x - 32
			_spell_instance.y = y
			break
		case directions.right:
			_spell_instance.x = x + 32
			_spell_instance.y = y
			break
	}
}