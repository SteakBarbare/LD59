event_inherited();

if (code == "") {
	code = objDigiCodeManager.digit1 + objDigiCodeManager.digit2 + objDigiCodeManager.digit3;	
}

if (distance_to_object(objPlayer) < 500) {
	objPlayer.canUseSonar = false;
	
	if (inputPrevent <= 0 && keyboard_check(vk_anykey)) {
		var key = keyboard_lastchar;
		if (key != "") {
		    if (ord(key) >= 32 && ord(key) <= 126) {
		        inputTextByPlayer += key;
		    }
		}

		if (keyboard_check_pressed(vk_backspace)) {
		    if (string_length(inputTextByPlayer) > 0) {
		        inputTextByPlayer = string_delete(inputTextByPlayer, string_length(inputTextByPlayer), 1);
		    }
		}

		if (keyboard_check_pressed(vk_enter)) {
		    if (inputTextByPlayer == code) {
				objPlayer.gameIsWin = true;
			}
		}
		
		inputPrevent = game_get_speed(gamespeed_fps) / 8;
	}
} else {
	objPlayer.canUseSonar = true;	
}

if (inputPrevent > 0) {
	inputPrevent--;	
}

