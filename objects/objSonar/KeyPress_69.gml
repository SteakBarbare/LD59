if (objPlayer.canUseSonar) {
	if (timeUsed < maximumUseWithoutCarrying) {
		emitSignal = true;
		timeUsed++
	}
}

srcPlaySound(sndPing, false, false, -1, -1, -1, 1)
