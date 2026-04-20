if (!instance_exists(objLibouloule)) return

objLibouloule.soundTrap = true;

if (playSound) {
	srcPlaySound(sndNoiseTrap, false, false, -1, -1, -1, 1)
	playSound = false;
	alarm[1] = game_get_speed(gamespeed_fps)	
}
