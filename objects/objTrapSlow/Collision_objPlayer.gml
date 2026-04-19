if (!other.isSlow) {
	other.isSlow = true;
	other.moveSpeed = other.defaultMoveSpeed / 3;
	other.alarm[1] = game_get_speed(gamespeed_fps) * 2;
}

srcPlaySound(sndSlipperyTrap, false, false, -1, -1, -1, 1)
