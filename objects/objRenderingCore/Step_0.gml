
if(alphaDeath > 0){
	alphaDeath -= 0.02;
}

if(global.AMBIANCE_R != color_get_red(sunAmbiance)){
	global.AMBIANCE_R += sign(color_get_red(sunAmbiance) - global.AMBIANCE_R) * ambianceSpeed;
}
if(global.AMBIANCE_G != sunAmbiance){
	global.AMBIANCE_G += sign(color_get_green(sunAmbiance) - global.AMBIANCE_G) * ambianceSpeed;
}
if(global.AMBIANCE_B != sunAmbiance){
	global.AMBIANCE_B += sign(color_get_blue(sunAmbiance) - global.AMBIANCE_B) * ambianceSpeed;
}

// Progressively change the shadows intensity in case the value is changed during the game
if(shadowsIntensity != shadowsIntensityBase){
	shadowsIntensity += sign(shadowsIntensityBase - shadowsIntensity)*0.5;
}

if(alphaDeath > 1){
	alphaDeath = 1;
}

// Compute each edges from light occluders
vertex_begin(global.shadowBuffer, global.shadowFormat);
with(objRenderable) {
	if(useDepthBuffer)
		event_user(DrawEventId.EDGE);
}
vertex_end(global.shadowBuffer);