if (!instance_exists(objPlayer)) return;

var click = mouse_check_button_pressed(mb_left);

if (click) {
	createPath(mouse_x, mouse_y)
}

switch (state) {
	case "Idle":
		break;
		
	case "Move":
		show_debug_message($"path_position : {path_position}");
	
		if (path_position >= 1) {
			state = "Idle";
			
			isRoaming = false;
			isTriggered = false;
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

if (!isTriggered && (state == "Idle" || isRoaming)) {
	var playerDetected = distance_to_object(objPlayer) < detectionZone;
	if (playerDetected) {
		isTriggered = true;
		isRoaming = false;
	
		objPlayer.moveSpeed = objPlayer.baseMoveSpeed * 1.5;
		moveSpeed = objPlayer.baseMoveSpeed * 1.3;
		createPath(objPlayer.x, objPlayer.y);
	} else {
		objPlayer.moveSpeed = objPlayer.baseMoveSpeed;
		moveSpeed = objPlayer.baseMoveSpeed;
	}
}



//if (isTriggered) {
//	isTriggered = true;
//	objPlayer.moveSpeed = objPlayer.moveSpeed * 2;
//	moveSpeed = objPlayer.moveSpeed * 1.5;
//}
