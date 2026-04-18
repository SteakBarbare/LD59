/// @function                           srcFindValueInArray(array, valueToFind);
/// @param  {array}    array			Array that we are looking in
/// @param  {any}      valueToFind      Value that we are looking for
/// @description						Script to simulate a .find() in GMS. Doesn't work to find objects or arrays
function srcFindValueInArray(array, valueToFind) {
	for(var currentIndex = 0; currentIndex < array_length(array); currentIndex++) {
		if(array[currentIndex] == valueToFind) {
			return array[currentIndex];
		}
	}
	return undefined
}