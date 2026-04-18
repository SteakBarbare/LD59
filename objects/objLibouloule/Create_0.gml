event_inherited();

daWae = path_add();
moveSpeed = 4;

state = "Idle";
isTriggered = false;
isRoaming = false;
detectSignal = false;

detectionZone = 300;

maximumSearchPath = 500;

midRoomWidth = room_width / 2;
midRoomHeight = room_height / 2;

function createPath(xToGo, yToGo) {
	path_clear_points(daWae);
	mp_grid_path(objGrid.pathGrid, daWae, x, y, xToGo, yToGo, true);
	path_start(daWae, moveSpeed, path_action_stop, false);
	state = "Move";	
}

function isInDistanceForPath(xToGo, yToGo) {
	var p = path_add();
	var playerDetected = false;
	var realDistance = 9999;

	if (mp_grid_path(objGrid.pathGrid, p, x, y, xToGo, yToGo, true)) {
	    realDistance = path_get_length(p);
	    playerDetected = realDistance < detectionZone;
	}

	path_delete(p);	
	return playerDetected
}
