var click = mouse_check_button_pressed(mb_left);

if (click) {
	mp_grid_path(objGrid.pathGrid, daWae, x, y, mouse_x, mouse_y, true);
	path_start(daWae, 4, path_action_stop, false);
}
