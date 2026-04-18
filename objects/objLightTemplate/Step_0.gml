/// @description Insert description here
// You can write your code in this editor

if(followedEntity != noone){
	x = followedEntity.x;
	y = followedEntity.y;
}

if(isDisappearing){
	alphaLight -= 0.01;
	if(alphaLight <= 0){
		instance_destroy();
	}
}