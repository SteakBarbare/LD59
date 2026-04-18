/// @function                           srcGridDebug(gridToShow);
/// @param  {grid}    gridToShow		Grid to show as a debug message
/// @description						Show the given grid in the Output window
function srcGridDebug(gridToShow){
	for( var i = 0; i < ds_grid_height(gridToShow); ++i){
	    var str = "";
	    for( var j = 0; j < ds_grid_width( gridToShow); ++j){
	       str += string(gridToShow[# j, i]) + "\t\t";
	    }
	    show_debug_message(str);
	}
}
