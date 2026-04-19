// Center on player
camX = objPlayer.x - cameraWidth / 2;
camY = objPlayer.y - cameraHeight / 2;

//// Clamp to room bounds
//camX = clamp(camX, 0, room_width - cameraWidth);
//camY = clamp(camY, 0, room_height - cameraHeight);

// Apply
camera_set_view_pos(camera, camX, camY);
