/// @function								srcArrayIsInArray(arrayToCheck, arrayToFind);
/// @param  {array}        arrayToCheck		Array to loop on
/// @param  {array}        arrayToFind		Array to find in the first one
/// @description
function srcArrayIsInArray(arrayToCheck, arrayToFind) {
	
	for (var currentIndex = 0; currentIndex < array_length(arrayToCheck); currentIndex++) {
		if (array_equals(arrayToCheck[currentIndex], arrayToFind)) {
			show_debug_message("Just there")
			return true;	
		}
	}

	return false;
}