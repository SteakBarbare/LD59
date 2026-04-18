/// @function										srcCopyArray()
/// @param  {array}			arrayToCopy				Array we take the data from
/// @description									Copy an array to another (avoid pointer problem)
function srcCopyArray (arrayToCopy) {
	var arrayCopied = [];
	
	// Error handler
	var notArray = typeof(arrayToCopy) != "array";
	var noData = array_length(arrayToCopy) <= 0;
	if (notArray || noData) {
		if (notArray) show_debug_message($"Parameter given is not an array");
		if (noData) show_debug_message($"Parameter has no data to copy");
		return arrayCopied;
	}
	
	// Copying array
	for (var indexElement = 0; indexElement < array_length(arrayToCopy); indexElement++) {
		if (typeof(arrayToCopy[indexElement]) == "array") {
			var arrayToPush = [];
			for (var itemIndex = 0; itemIndex < array_length(arrayToCopy[indexElement]); itemIndex++) {
				array_push(arrayToPush, arrayToCopy[indexElement][itemIndex]);
			}
			array_push(arrayCopied, arrayToPush);
		} else {
			array_push(arrayCopied, arrayToCopy[indexElement]);
		}
	}

	return arrayCopied;
}
