if (distance_to_object(objPlayer) < interactRange && keyboard_check_pressed(ord("R"))) {
    showTuto = !showTuto;
    tutoOpening = showTuto;
	
    if (showTuto) tutoScale = 0;
	else if(!isActivated){ isActivated = true;
		if(createSonar) {
			objSonar.isCarried = true;
			instance_destroy();
		}
	}

}

if (tutoOpening) {
    tutoScale += 0.05;
    if (tutoScale >= 1) {
        tutoScale = 1;
        tutoOpening = false;
    }
}