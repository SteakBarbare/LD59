// Initial float
if(floatingSpeed > 0.01 && !targetingPlayer){
	move_towards_point(initialPointX, initialPointY, floatingSpeed);
	y -= floatingSpeed / 1.5;
	floatingSpeed -= floatingSpeed / 4;
}else if(!targetingPlayer){
	targetingPlayer = true;
}

// After a short delay, target the player at exponential speed
if(targetingPlayer){
	if(isPicked){
		depth = target.depth + 1;
		if(image_alpha <= 0.1){
			image_alpha = 0.1;
			image_xscale /= 1.15;
			image_yscale = image_xscale;
			if(image_xscale <= 0.1){
				instance_destroy();
			}
		}else{
			image_alpha -= 0.1;
			image_xscale += 0.15*image_alpha;
			image_yscale = image_xscale;
		}
	}else{
		move_towards_point(target.x, target.y, floatingSpeed);
		floatingSpeed += floatingSpeed / 4;
		if(floatingSpeed > 10){
			floatingSpeed = 10;
		}
	}	
}

if(isPicked){
	x = target.x + 4;
	y = target.y;
}

// Size variation
if(!isPicked){
	image_xscale += sign(random_range(-1, 1)) * 0.1;

	if(image_xscale <= 0.1){
		image_xscale = 0.1;
	}else if(image_xscale >= 1){
		image_xscale = 1;
	}

	image_yscale = image_xscale;
}

if( (distance_to_object(target) < 10) && targetingPlayer && !isPicked){
	isPicked = true;
}