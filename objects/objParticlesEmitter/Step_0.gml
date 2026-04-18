/// @description Particle Disappearing

if(isDisappearing){
	alphaValue = lerp(alphaValue, 0, 0.1);
	image_alpha = alphaValue;
	if(alphaValue <= 0.1){
		instance_destroy();
	}
}