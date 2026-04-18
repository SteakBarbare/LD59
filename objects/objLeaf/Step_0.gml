depth = -bbox_bottom;
x -= hsp;
y += vsp;
if(rotationVar <= 0){
	image_angle += 90;
	rotationVar = 5;
}else{
	rotationVar -= 1;
}

if( (x > cameraViewX + windowWidth + 200) || (x <cameraViewX -200) || (y > cameraViewY + windowHeight + 400) || (y < cameraViewY - 800) ){
	instance_destroy();
}

if(image_alpha < 1){
	image_alpha += 0.02;
}
hsp = baseHsp;
vsp = 1;