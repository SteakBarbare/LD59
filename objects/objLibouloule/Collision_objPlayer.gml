other.playerState = "Death";

if(x > other.x){
	other.image_xscale = 0.3;
}else{
	other.image_xscale = -0.3;
}

if(!isKilling){
	isKilling = true;
	skeleton_animation_set("Kill");
	image_index = 0;
	path_end();
}

