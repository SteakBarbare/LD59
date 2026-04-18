/// @function								src2DIndexOf(array, indexToFind, subArrayIndex);
/// @param  {array}		array				Array that we are looking in
/// @param  {any}		indexToFind			Index that we are looking for
/// @param  {real}		subArrayIndex		Index of the sub-array to check
/// @description							Script to simulate a .indexOf() in GMS. Updated for 2D arrays
function src2DIndexOf(array, indexToFind, subArrayIndex) {
	for(var currentIndex = 0; currentIndex < array_length(array); currentIndex++) {
		if(array[currentIndex][subArrayIndex] == indexToFind) {
			return currentIndex;
		}
	}
	return undefined;
}
