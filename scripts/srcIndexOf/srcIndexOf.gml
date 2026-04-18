/// @function                           srcIndexOf(array, indexToFind);
/// @param  {array}    array			Array that we are looking in
/// @param  {any}      indexToFind      Index that we are looking for
/// @description						Script to simulate a .indexOf() in GMS. Doesn't work to find objects or arrays
function srcIndexOf (array, indexToFind) {
	for(var currentIndex = 0; currentIndex < array_length(array); currentIndex++) {
		if(array[currentIndex] == indexToFind) {
			return currentIndex;
		}
	}
	return undefined
}
