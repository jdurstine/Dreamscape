/// @description Manage movement around the menu

switch (keyboard_key)
{
	case global.back:
		event_user(4)
		break
	case global.up:
		event_user(1)
		break
	case global.down:
		event_user(0)
		break
	case global.left:
		event_user(1)
		break
	case global.right:
		event_user(0)
		break
	case global.accept:
		event_user(2)
		break
	default:
		// we'll play a sound or something later
		break
}