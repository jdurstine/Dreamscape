/// @description Initalize instance of object

facing = "up"

has_key = false

move_speed = 32

player_health_max = 100
player_health = global.player_health

basic_attack = oAttack_Basic

spells = instance_create_depth(0, 0, 200, oSubsystem_Spells)
scrAddSpell(spells, oSpell_FireNova)
scrAddSpell(spells, oSpell_FireBall)
scrAddSpell(spells, oSpell_LavaRay)

//scrAddSpell(spells, oBuff_FireWeapon)

/* defunct until buff system added
buffs = ds_list_create()
ds_list_clear(buffs)
*/

items = instance_create_depth(0, 0, 200, oSubsystem_Items)

scrCreateTurn(id, 0)

#region Casting Animation Initialization

casting_anim_started = false
casting_anim_wait = 10*(sprite_get_number(image_number)/sprite_get_speed(sprite_index))*1000

#endregion