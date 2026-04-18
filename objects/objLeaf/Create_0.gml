event_inherited()
if(instance_exists(objWormQueen) && objWormQueen.phase == 2){
	sprite_index = sprMutantLeaf;
}
size = random_range(1, 2);
image_xscale = size;
image_yscale = size;
image_angle = random(360);
image_alpha = 0;

rotationVar = 0;

hsp = ceil(random_range(0.4, 1.5));
vsp = 1;
baseHsp = hsp;

// Camera
cameraViewX = camera_get_view_x(view_camera[0]);
cameraViewY = camera_get_view_y(view_camera[0]);
windowWidth = window_get_width();
windowHeight = window_get_height();