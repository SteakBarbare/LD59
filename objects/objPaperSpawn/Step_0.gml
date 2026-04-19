event_inherited();

if (!isActive) exit;

if (!isInitialized && digitIndex > 0) {
    var manager = instance_find(objDigiCodeManager, 0);
    digitValue = variable_instance_get(manager, "digit" + string(digitIndex));
    isInitialized = true;
}

if (distance_to_object(objPlayer) < interactRange && keyboard_check_pressed(ord("R"))) {
    showPaper = !showPaper;
    paperOpening = showPaper;
	if(digitIndex > 0){
		var manager = instance_find(objDigiCodeManager, 0);
		manager.foundWords[digitIndex - 1] = digitValue;
	}
    if (showPaper) paperScale = 0;
}

if (paperOpening) {
    paperScale += 0.05;
    if (paperScale >= 1) {
        paperScale = 1;
        paperOpening = false;
    }
}