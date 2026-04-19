// Center on player
camX = objPlayer.x - display_get_width();
camY = objPlayer.y - display_get_height();

// Apply
camera_set_view_pos(camera, camX, camY);
