/// @description Manage movement around the menu

switch (keyboard_key)
{
	case vk_escape:
		event_user(4)
		break
	case vk_up:
	case ord("W"):
		event_user(1)
		break
	case vk_down:
	case ord("S"):
		event_user(0)
		break
	case vk_left:
	case ord("A"):
		event_user(1)
		break
	case vk_right:
	case ord("D"):
		event_user(0)
		break
	case vk_enter:
		event_user(2)
		break
	default:
		//we'll play a sound or something later
		break
}