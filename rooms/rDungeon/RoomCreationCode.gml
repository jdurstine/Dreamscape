
#region Instance Initialization

instance_create_depth(0, 0, 200, oMainControl)
instance_create_depth(5*32, 5*32, 200, oPlayer)
instance_create_depth(0, 0, 200, oGUIControl)
instance_create_depth(0, 0, 200, oMapGenerator)

#endregion

#region Special Game Objects

instance_create_depth(room_width - 4*32, room_height - 4*32, 200, oGate)
instance_create_depth(room_width - 4*32, 4*32, 200, oKey)

#endregion
