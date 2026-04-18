/// @function						srcJsonReader(language, folder, textName);
/// @param  {string}	language	Current language of the game
/// @param  {string}	folder		folder to search (root is localization)
/// @param  {string}	textName	Index of the messages to read
/// @description					Pick the messages depending on the game current language option
function srcJsonReader(language, folder, textName) {

	var dataFile, jsonFile;

	dataFile = "";
	jsonFile = file_text_open_read(language + "\\" + folder + "\\" + textName + ".json");
	if(jsonFile != -1)
	{
		// Read through the Json file and save the text in the dataFile variable
		while (!file_text_eof(jsonFile)) {
			dataFile += file_text_read_string(jsonFile);
			file_text_readln(jsonFile);
		}

		// Close the Json file
		file_text_close(jsonFile);
		var ds_map = json_decode(dataFile);
		if(ds_map != -1) return ds_map;
		else show_debug_message("ERROR AT srcJsonReader :: CAN'T DECODE JSON (json_decode(dataFile))");
	}
	else
	{
		show_debug_message("ERROR AT srcJsonReader :: FILE NOT FOUND");
		return -1;
	}


}