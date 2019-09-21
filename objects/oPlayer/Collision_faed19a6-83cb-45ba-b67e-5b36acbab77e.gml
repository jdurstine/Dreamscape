/// @description Player collides with a monsters attack

var _attack_hit = instance_place(bbox_left, bbox_top, oMAttack)
if (ds_list_find_index(_attack_hit.hit_list, id) < 0)
{
	player_health -= _attack_hit.damage
	ds_list_add(_attack_hit.hit_list, id)
}