/// @description Player picks up the item when they collide with it.

var _item_instance = instance_place(bbox_left, bbox_top, oItem)
scrPlaceItemInInventory(items, _item_instance.item_id, _item_instance.count)