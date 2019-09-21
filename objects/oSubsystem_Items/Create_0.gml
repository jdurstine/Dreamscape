/// @description Initialize the item subsystem

inventory = ds_list_create()
item_counts = ds_map_create()

equipment = ds_map_create()
equipment[? "Relic"] = noone
