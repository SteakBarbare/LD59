/// @description Insert description here
// You can write your code in this editor

particlesExplosion = false;
particleWormhole = false;
shakeIntensity = 0;


camWidthBase = camera_get_view_width(view_camera[0]);
camHeightBase = camera_get_view_height(view_camera[0]);
camBorderX = camera_get_view_border_x(view_camera[0]);
camBorderY = camera_get_view_border_y(view_camera[0]);

zoomModifier = 1;

audio_play_sound(sndAltarSfx, 1, false);
alarm[0] = game_get_speed(gamespeed_fps) * 1.5;