depth = -bbox_bottom -10000;

var moveRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
var moveLeft = keyboard_check(vk_left) or keyboard_check(ord("A")) or keyboard_check(ord("Q"));
var moveDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
var moveUp = keyboard_check(vk_up) or keyboard_check(ord("Z")) or keyboard_check(ord("W"));
var carrySonar = keyboard_check(ord("F"));

if (isControlsInverted) {
    var temp = moveRight;
    moveRight = moveLeft;
    moveLeft = temp;
    temp = moveUp;
    moveUp = moveDown;
    moveDown = temp;
}

//

if (keyboard_check_pressed(vk_escape)) {
    isPaused = !isPaused;
    game_set_speed(isPaused ? 0 : 60, gamespeed_fps);
}

if (isPaused) exit;

//

if (playerState != "Stagger") {
    if (moveUp) {
        //var currentSolid = collision_rectangle(bbox_left, bbox_top - moveSpeed, bbox_right, bbox_bottom, objBasicSolids, true, true);
		var currentSolid = instance_position(x, y - moveSpeed, objBasicSolids);
        if (!currentSolid || (currentSolid && !currentSolid.haveColision)) {
			y -= moveSpeed;
		}
    }
	if (moveDown) {
	   //var currentSolid = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom + moveSpeed, objBasicSolids, true, true);
	   var currentSolid = instance_position(x, y + moveSpeed, objBasicSolids);
	    if (!currentSolid || (currentSolid && !currentSolid.haveColision)) {
			y += moveSpeed;
		}
	}
    if (moveRight) {
        //var currentSolid = collision_rectangle(bbox_left, bbox_top, bbox_right + moveSpeed, bbox_bottom, objBasicSolids, true, true);
		var currentSolid = instance_position(x + moveSpeed, y, objBasicSolids);
        if (!currentSolid || (currentSolid && !currentSolid.haveColision)) {
			x += moveSpeed;
		}
    }
    if (moveLeft) {
        //var currentSolid = collision_rectangle(bbox_left - moveSpeed, bbox_top, bbox_right, bbox_bottom, objBasicSolids, true, true);
		var currentSolid = instance_position(x - moveSpeed, y, objBasicSolids);
		if (!currentSolid || (currentSolid && !currentSolid.haveColision)) {
			x -= moveSpeed;
		}
    }
}

if (keyboard_check(vk_space) && instance_exists(objSonar) && !objSonar.isCarried) {
    var cameraW = 700; 
    var cameraH = 700; 
	cameraX = objSonar.x - cameraW / 2;
	cameraY = objSonar.y - cameraH / 2;
	
    camera_set_view_pos(view_camera[1], cameraX, cameraY);
    view_visible[1] = true;
} else {
    view_visible[1] = false;
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
            alarm[0] = game_get_speed(gamespeed_fps) * stagTime;
            isStagger = true;
        }
        break;
    
	case "Death":
	    if (deathScreenAlpha < 1) deathScreenAlpha += 0.05;
    
	    if (isHoveringButton && mouse_check_button_pressed(mb_left)) {
	        room_restart();
	    }
	    break;
    
    default:
        playerState = "Idle";
        break;
}

// SONAR
if (carrySonar && inputPrevent <= 0) {
	if (!instance_exists(objSonar)) return
	with (objSonar) {
		if (place_meeting(x, y, objPlayer)) {
			isCarried = !isCarried
		}
	}
	inputPrevent = game_get_speed(gamespeed_fps) / 6;
}

// Managing input
if (inputPrevent > 0) {
	inputPrevent -= 1;	
}
