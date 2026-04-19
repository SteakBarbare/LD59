if (distance_to_object(objPlayer) < interactRange && keyboard_check_pressed(ord("A"))) {
    showTuto = !showTuto;
    tutoOpening = showTuto;
    if (showTuto) tutoScale = 0;
}

if (tutoOpening) {
    tutoScale += 0.05;
    if (tutoScale >= 1) {
        tutoScale = 1;
        tutoOpening = false;
    }
}