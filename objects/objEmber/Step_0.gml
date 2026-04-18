depth = -bbox_bottom;
x -= hsp;
y += vsp;
if(rotationVar <= 0){
	image_angle += emberRotation;
	emberRotation -= 0.2;
	rotationVar = 5;
}else{
	rotationVar -= 1;
}

if( (x > camera_get_view_x(view_camera[0]) + window_get_width() + 200) || (x < camera_get_view_x(view_camera[0]) -200) || (y > camera_get_view_y(view_camera[0]) + window_get_height() + 400) || (y < camera_get_view_y(view_camera[0]) - 800) ){
	instance_destroy();
}

if(image_alpha < 1 && !isDisappearing){
	image_alpha += 0.02;
}else if(isDisappearing){
	if(image_alpha > 0){
		image_alpha -= 0.02;
	}else{
		instance_destroy();
	}
}
hsp = hsp * 0.99 * sign(random_range(-1, 100));
vsp = vsp * 0.99 * sign(random_range(-1, 100));

if(!isDisappearing){
	if(random(1000) > (disappearingChance)){
		isDisappearing = true;
	}else{
		disappearingChance -= 0.5;
	}
}

if(isCorrupted){
	image_blend = c_blue;
}

emberAlpha = image_alpha;