uPixelW = shader_get_uniform(shdOutline, "pixel1Width");
uPixelH = shader_get_uniform(shdOutline, "pixel1Height");
texelW = texture_get_texel_width(sprite_get_texture(sprFakeTexture, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprFakeTexture, 0));
outlineColor = shader_get_uniform(shdOutline, "uOutlineColor");
echoAlpha = shader_get_uniform(shdOutline, "echo_alpha");

setOutline = false;
outlineAlpha = 0;
outlineIncreasing = true;

isKilling = false;

daWae = path_add();
moveSpeed = 4;

state = "Idle";
isTriggered = false;
isRoaming = false;
detectSignal = false;
canBeTriggerBySignal = true;
soundTrapTriggered = noone;

canCheck = true;

detectionZone = 1000;
realPathZone = 800;

maximumSearchPath = 1000;

midRoomWidth = room_width / 2;
midRoomHeight = room_height / 2;

function createPath(xToGo, yToGo) {
	path_clear_points(daWae);
	mp_grid_path(objGrid.pathGrid, daWae, x, y, xToGo, yToGo, true);
	path_start(daWae, moveSpeed, path_action_stop, false);
	state = "Move";	
}

function isInDistanceForPath(xToGo, yToGo) {
	// Save memory to not calcul useless paths
	if (!canCheck && !isTriggered) return false
	
	var p = path_add();
	var playerDetected = false;
	var realDistance = 9999;

	if (mp_grid_path(objGrid.pathGrid, p, x, y, xToGo, yToGo, true)) {
	    realDistance = path_get_length(p);
	    playerDetected = realDistance < realPathZone;
	}

	path_delete(p);	
	
	if (!playerDetected) {
		canCheck = false;
		alarm[1] = game_get_speed(gamespeed_fps) / 4;
	}
	
	return playerDetected
}

skeleton_animation_set("Walk");
image_xscale = 0.3;
image_yscale = 0.3;

prevX = x;
prevY = y;