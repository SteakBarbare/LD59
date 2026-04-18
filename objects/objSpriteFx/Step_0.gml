if(isHeavy && sprite_index != sprHeavyImpactFx){
	sprite_index = sprHeavyImpactFx;
}

if(image_index >= image_number - 1){
	instance_destroy();
}
if(image_index >= 5){
	alphaLightingTest = 0.5;
}else if(image_index >= 4){
	alphaLightingTest = 0.75;
}
if(lightIntensity < 1.4){
	lightIntensity += 0.4;
}else{
	lightIntensity -= 0.03;
}

if(image_index >= 3){
	lightAlpha -= 0.1;
}

if(lightAlpha2 > 0){
	lightAlpha2 -= 0.1;
}

depth = -bbox_bottom-100;