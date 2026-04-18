event_inherited()

if (trapCooldown > 0) {
    trapCooldown--;
    if (trapCooldown == 0) {
        with (objPlayer) {
            isControlsInverted = false;
        }
    }
}