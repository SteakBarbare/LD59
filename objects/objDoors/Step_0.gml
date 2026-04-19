if (distance_to_object(objPlayer) < 200) {
	image_speed = 1;
	if (playSound) {
		srcPlaySound(sndDoor, false, false, -1, -1, -1, 1)
		playSound = false;
	}
	if (image_index >= image_number - 1) {
		image_index = image_number - 1;
	}
} else if (image_index > 0) {
	image_speed = -1;
} else {
	playSound = true;
	image_speed = 0;	
}
