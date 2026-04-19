/// @description Insert description here
// You can write your code in this editor

if(isOutro){
	currentAlpha = lerp(currentAlpha, 1, lerpSpeed);
	if(currentAlpha >= 1){
		if(destination == "Ded"){
			game_end();
		}else{
			room_goto(asset_get_index(destination));
		}
	}
}else{
	currentAlpha = lerp(currentAlpha, 0, lerpSpeed);
	if(currentAlpha <= 0){
		instance_destroy();
	}
}