/// @description Draw the GUI

#region Player Healthbar

var _health_scale = oPlayer.player_health/oPlayer.player_health_max
_health_scale = clamp(_health_scale, 0, 1)

draw_sprite_ext(hp_fill, -1, player_healthbar_x, player_healthbar_y + sprite_get_height(hp_outline), 1, -_health_scale, 0, c_white, 1)
draw_sprite(hp_outline, -1, player_healthbar_x, player_healthbar_y)

#endregion

#region Ability Buttons
var _spells = oPlayer.spells
var _spell_list = _spells.spell_list
var _spell_count = ds_list_size(_spell_list)
var _spell_icon = noone


for (var i = 0; i < _spell_count; i++)
{
	draw_sprite(sAbilityButton, -1, ability_button_anchor_x + 32*i, ability_button_anchor_y)
	
	_spell_icon = object_get_sprite(_spell_list[| i])
	if (_spell_icon)
	{
		draw_sprite_ext(_spell_icon,
			-1,
			ability_button_anchor_x + 3 + 32*i,
			ability_button_anchor_y + 3,
			26/sprite_get_width(_spell_icon),
			26/sprite_get_height(_spell_icon),
			0,
			c_white,
			1)
	}
}
#endregion

#region Cooldown Mask
var _spell_instance
var _cooldown_timers = _spells.cooldown_timers
var _cooldown = noone
var _cooldown_scale = noone

for (var i = 0; i < _spell_count; i++)
{
	_spell_instance = instance_create_layer(0, 0, layer_get_id("GUI"), _spell_list[| i])
	_cooldown = _spell_instance.cooldown
	_cooldown_scale = _cooldown_timers[| i]/_cooldown
	instance_destroy(_spell_instance)
	
	draw_sprite_ext(sAbilityButtonFill,
		-1,
		ability_button_anchor_x + 32*i,
		ability_button_anchor_y + 32,
		1,
		-_cooldown_scale,
		0,
		c_white,
		0.5)
}
#endregion

#region Show Current Level

draw_set_halign(fa_right)
draw_text_color(level_text_x, level_text_y, "level " + string(global.level), c_white, c_white, c_white, c_white, 1)

#endregion