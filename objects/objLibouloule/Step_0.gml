event_inherited();

if(isKilling){
	if(image_index >= 54){
		skeleton_animation_set("Walk");
	}else{
		exit;
	}
}

if (!instance_exists(objPlayer)) return;

var click = mouse_check_button_pressed(mb_left);

if (click) {
	createPath(mouse_x, mouse_y)
}

switch (state) {
	case "Idle":
		break;
		
	case "Move":
		
		if(x > prevX){
			image_xscale = 0.3;
		}else{
			image_xscale = -0.3;
		}
		
		prevX = x;
		
		//show_debug_message($"path_position : {path_position}");
		if (path_position >= 1) {
			state = "Idle";
			
			isRoaming = false;
			isTriggered = false;
			detectSignal = false;
			soundTrap = false;
		}
		break;
	
	default:
		state = "Idle";
		break;
}

if (!isTriggered && soundTrapTriggered != noone && !soundTrap) {
	isRoaming = false;
	detectSignal = false;
	soundTrap = false;
	
	path_end();
	moveSpeed = objPlayer.defaultMoveSpeed * 2.5;
	createPath(soundTrapTriggered.x, soundTrapTriggered.y);
	
	soundTrapTriggered = noone;
}

if (detectSignal && canBeTriggerBySignal) {
	if (!instance_exists(objSonar)) return;
	path_end();
	
	moveSpeed = objPlayer.defaultMoveSpeed * 1.6;
	createPath(objSonar.emittedX, objSonar.emittedY);
	
	canBeTriggerBySignal = false;
	alarm[2] = game_get_speed(gamespeed_fps);
}

if (!isRoaming && !isTriggered && !detectSignal) {
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
		if (!place_meeting(determinedX, determinedY, objBasicSolids)) {
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
	var distanceFromPlayer = distance_to_object(objPlayer);
	var playerDetected = distanceFromPlayer < detectionZone && distanceFromPlayer > 0;
	if (playerDetected) {
		if (isInDistanceForPath(objPlayer.x, objPlayer.y)) {
			isTriggered = true;
			isRoaming = false;
			detectSignal = false;
	
			objPlayer.moveSpeed = objPlayer.defaultMoveSpeed * 1.5;
			moveSpeed = objPlayer.defaultMoveSpeed * 1.3;
			createPath(objPlayer.x, objPlayer.y);
		}
	} else if (objPlayer.moveSpeed > objPlayer.defaultMoveSpeed) {
		objPlayer.moveSpeed = objPlayer.defaultMoveSpeed;
		moveSpeed = objPlayer.defaultMoveSpeed;
	}
}

//if (isTriggered) {
//	isTriggered = true;
//	objPlayer.moveSpeed = objPlayer.moveSpeed * 2;
//	moveSpeed = objPlayer.moveSpeed * 1.5;
//}
