daWae = path_add();
moveSpeed = 4;

state = "Idle";
isTriggered = false;
isRoaming = false;

maximumSearchPath = 500;

function createPath(xToGo, yToGo) {
	path_clear_points(daWae);
	mp_grid_path(objGrid.pathGrid, daWae, x, y, xToGo, yToGo, true);
	path_start(daWae, moveSpeed, path_action_stop, false);
	state = "Move";	
}

midRoomWidth = room_width / 2;
midRoomHeight = room_height / 2;
