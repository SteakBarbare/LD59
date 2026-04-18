/// @description Insert description here
// You can write your code in this editor

particlesExplosion = true;

instance_create_depth(x, y, -y-1000, objWhiteFlash);

zoomModifier = 1;
camera_set_view_size(view_camera[0], round(camWidthBase*zoomModifier), round(camHeightBase*zoomModifier));
camera_set_view_border(view_camera[0], round(camBorderX*zoomModifier), round(camBorderY*zoomModifier));


part_type_color2(global.wormholeExplosion, fxColourExt, fxColourInt);
part_particles_create(global.particlesSys, x, y, global.wormholeExplosion, 100);