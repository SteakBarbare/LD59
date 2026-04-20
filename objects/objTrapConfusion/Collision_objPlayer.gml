other.isControlsInverted = true;
trapCooldown = game_get_speed(gamespeed_fps) * effectDuration + 30;

if (playSound) {
	srcPlaySound(sndGasTrap, false, false, -1, -1, -1, 1)
	playSound = false;
	alarm[1] = game_get_speed(gamespeed_fps)	
}
