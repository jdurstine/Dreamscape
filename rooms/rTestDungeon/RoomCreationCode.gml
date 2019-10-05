
#region Instance Initialization

instance_create_depth(0, 0, 200, oMainControl)
instance_create_depth(5*global.tilesize, 5*global.tilesize, 200, oPlayer)
instance_create_depth(0, 0, 200, oGUIControl)
// instance_create_depth(0, 0, 200, oMapGenerator)

#endregion

#region Special Game Objects

// instance_create_depth(room_width - 4*global.tilesize, room_height - 4*global.tilesize, 200, oGate)
// instance_create_depth(room_width - 4*global.tilesize, 4*global.tilesize, 200, oKey)

#endregion

#region Test Objects

instance_create_depth(10*global.tilesize, 10*global.tilesize, 200, oMonster_Bat)

#endregion
