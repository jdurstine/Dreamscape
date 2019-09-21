/// @function scrCreateItem(item_id, x, y, depth)
/// @description Create an item at the specified location and depth.
/// @param item_id item_id of item you want to create.
/// @param x x value to create item at.
/// @param y y value to create item at.
/// @param depth depth to create item at.
/// @param count Amount of item to be placed in item object.

var _item_id = argument0
var _x = argument1
var _y = argument2
var _depth = argument3
var _count = argument4

var _oItem_instance = instance_create_depth(_x, _y, _depth, oItem)

// set item attributes
_oItem_instance.item_id = _item_id
_oItem_instance.item_icon = asset_get_index("sItem_" + string(_item_id) + "_Icon")
_oItem_instance.item_anim = asset_get_index("sItem_" + string(_item_id) + "_Anim")
_oItem_instance.count = _count

_oItem_instance.sprite_index = _oItem_instance.item_anim