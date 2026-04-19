// Center on player
camX = objPlayer.x - display_get_width();
camY = objPlayer.y - display_get_height();

camSonarX = objSonar.x - display_get_width();
camSonarY = objSonar.y - display_get_height();
secondCameraOn = keyboard_check(vk_space) && instance_exists(objSonar) && !objSonar.isCarried;
if (secondCameraOn && !instance_exists(objLightSonar)) {
	instance_create_depth(objSonar.x, objSonar.y, depth, objLightSonar);
} else if(!secondCameraOn && instance_exists(objLightSonar)) {
	instance_destroy(objLightSonar);
	with (objLightTemplate) {
		if (sonarLight) {
			instance_destroy();	
		}
	}
}

// Apply
camera_set_view_pos(cameraSonar, camSonarX, camSonarY);
camera_set_view_pos(camera, camX, camY);


if(shadowAlpha != targetShadowAlpha){
	shadowAlpha += (sign(targetShadowAlpha - shadowAlpha) * 0.01);
}

if(room == rmIntro && !allDocRetrieved){
	allDocRetrieved = true;
	with(objTuto){
		if(!isActivated){
			objCore.allDocRetrieved = false
		}
	}
	
	if(allDocRetrieved){
		targetShadowAlpha = 1;
	}
}