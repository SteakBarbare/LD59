// Center on player
camX = objPlayer.x - cameraWidth / 2;
camY = objPlayer.y - cameraHeight / 2;

// Apply
camera_set_view_pos(camera, camX, camY);
