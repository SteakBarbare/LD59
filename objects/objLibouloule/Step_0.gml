if (!instance_exists(objPlayer)) return;

var click = mouse_check_button_pressed(mb_left);

if (click) {
	createPath(mouse_x, mouse_y)
}

switch (state) {
	case "Idle":
		break;
		
	case "Move":
		if (path_position >= 1) {
			state = "Idle";
			
			if (isRoaming) {
				isRoaming = false;	
			}
		}
		break;
	
	default:
		state = "Idle";
		break;
}

if (!isRoaming && !isTriggered) {	
	var floorX = objPlayer.x < midRoomWidth ? 0 : midRoomWidth;
	var floorY = objPlayer.y < midRoomHeight ? 0 : midRoomHeight;
	var ceilX = floorX == 0 ? midRoomWidth : room_width;
	var ceilY = floorY == 0 ? midRoomHeight : room_height;
	var determinedX = 0;
	var determinedY = 0;
	
	var validPosition = false;
	repeat(maximumSearchPath) {
		determinedX = irandom_range(floorX, ceilX);
		determinedY = irandom_range(floorY, ceilY);
		if (!place_meeting(determinedX, determinedY, objEnvironmentTemplate)) {
			validPosition = true;
			break;
		}
	}
	
	if (validPosition) {
		createPath(determinedX, determinedY);
		isRoaming = true;
	}
}


//if (!isTriggered) {
//	mp_grid_path(objGrid.pathGrid, daWae, x, y, mouse_x, mouse_y, true);
//	path_start(daWae, moveSpeed, path_action_stop, false);
//}



//if (isTriggered) {
//	isTriggered = true;
//	objPlayer.moveSpeed = objPlayer.moveSpeed * 2;
//	moveSpeed = objPlayer.moveSpeed * 1.5;
//}
