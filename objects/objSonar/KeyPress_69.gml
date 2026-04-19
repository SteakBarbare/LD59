if (objPlayer.canUseSonar) {
	if (timeUsed < maximumUseWithoutCarrying) {
		emitSignal = true;
		timeUsed++
	}
}
