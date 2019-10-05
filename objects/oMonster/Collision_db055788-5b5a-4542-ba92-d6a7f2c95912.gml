/// @description On collision with an attack

var attack_hit = instance_place(bbox_left, bbox_top, oAttack)
if (ds_list_find_index(attack_hit.hit_list, id) < 0)
{
	oHealth -= attack_hit.damage
	ds_list_add(attack_hit.hit_list, id)
}