var moveRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
var moveLeft = keyboard_check(vk_left) or keyboard_check(ord("A")) or keyboard_check(ord("Q"));
var moveDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
var moveUp = keyboard_check(vk_up) or keyboard_check(ord("Z")) or keyboard_check(ord("W"));

if (moveUp) {
	y -= moveSpeed	
}
if (moveDown) {
	y += moveSpeed	
}
if (moveRight) {
	x += moveSpeed	
}
if (moveLeft) {
	x -= moveSpeed	
}

switch (playerState) {
	case "Idle":
		break;
	
	case "Walk":
	
		break;
	
	case "Sprint":
	
		break;
	
	case "Stagger":
		if (!isStagger) {
			alarm[0] = game_get_speed(gamespeed_fps * stagTime);
			isStagger = true;
		}
		break;
		
	
	case "Death":
	
		break;
		
	default:
		playerState = "Idle";
		break;
	
}

