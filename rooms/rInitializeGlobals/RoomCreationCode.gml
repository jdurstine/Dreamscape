/// Initialize global values

global.collidables = ds_list_create()
ds_list_add(global.collidables, oPlayerParent, oMonster,  oTerrainCollidable)


enum directions {
	up
	,down
	,left
	,right
}

global.paused = false

#region Hotkeys
global.pause = vk_escape
global.skipturn = vk_space
global.ability1 = ord("Q")
global.ability2 = ord("W")
global.ability3 = ord("E")
global.ability4 = ord("R")
global.up = vk_up
global.down = vk_down
global.left = vk_left
global.right = vk_right
#endregion

room_goto(rMainMenu)
