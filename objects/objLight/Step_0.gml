if(followedEntity != noone && instance_exists(followedEntity)) {
	x = followedEntity.x
	y = followedEntity.y
}

radius += ((targetRadius + random_range(flickerMin, flickerMax)) - radius) * radiusSpeed

if(radius <= 0){
	instance_destroy();
} 

if(lightColor != targetColor) {
	var redDistance = color_get_red(targetColor) - color_get_red(lightColor) ;
	var greenDistance = color_get_green(targetColor) - color_get_green(lightColor);
	var blueDistance = color_get_blue(targetColor) - color_get_blue(lightColor);
	
	lightColor = make_color_rgb(max(color_get_red(lightColor) + sign(redDistance) * colorSpeed, 0), 
		max(color_get_green(lightColor) + sign(greenDistance) * colorSpeed, 0),
		max(color_get_blue(lightColor) + sign(blueDistance) * colorSpeed, 0));
}



