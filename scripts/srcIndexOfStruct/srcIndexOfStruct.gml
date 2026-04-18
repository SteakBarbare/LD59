/// @function                           srcIndexOfStruct(array, indexToFind);
/// @param  {array}     array			Array that we are looking in
/// @param  {any}       indexToFind     Index that we are looking for
/// @param  {string}    field			Field of the struct to look for
/// @description						Script to simulate a .indexOf() in GMS. Doesn't work to find objects or arrays
function srcIndexOfStruct (array, indexToFind, field) {
	for(var currentIndex = 0; currentIndex < array_length(array); currentIndex++) {
		if(array[currentIndex][$field] == indexToFind) {
			return currentIndex;
		}
	}
	return undefined;
}
