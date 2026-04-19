if (!isActive) exit;

other.playerState = "Stagger";
other.isStagger = false;
other.stagTime = effectDuration;
isActive = false;
alarm[0] = game_get_speed(gamespeed_fps) * effectDuration + gamespeed_fps;

if (playSound) {s
	srcPlaySound(sndElectricTrap, false, false, -1, -1, -1, 1)
	playSound = false;
	alarm[1] = game_get_speed(gamespeed_fps)	
}

