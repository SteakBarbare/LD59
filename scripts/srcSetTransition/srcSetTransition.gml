/// @function											srcSetTransition(isOutro, destination, lerpSpeed)
/// @param  {bool}				isOutro					True to go to a destination and fade in, false to fade out
/// @param  {string}			destination				String containing the name of the room to go
/// @param  {real}				lerpSpeed				[OPT] Speed of the transition
/// @description										Creates a black fade out / in and can redirect to a given room
function srcSetTransition(isOutro, destination, lerpSpeed = 0.1){
	var newTransition = instance_create_depth(0, 0, -y - 1000, objTransition);
	newTransition.isOutro = isOutro;
	if(isOutro){
		newTransition.currentAlpha = 0;
	}else{
		newTransition.currentAlpha = 2;
	}
	newTransition.destination = destination;
	newTransition.lerpSpeed = lerpSpeed;
}