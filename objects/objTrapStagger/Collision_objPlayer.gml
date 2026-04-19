if (!isActive) exit;

other.playerState = "Stagger";
other.isStagger = false;
other.stagTime = effectDuration;
isActive = false;
alarm[0] = game_get_speed(gamespeed_fps) * effectDuration + gamespeed_fps;

srcPlaySound(sndElectricTrap, false, false, -1, -1, -1, 1);
