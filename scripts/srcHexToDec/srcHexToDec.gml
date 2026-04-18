/// @function									srcHexToColor()
/// @param  {string}			hex				Hexadecimal digits
/// @description								Returns an integer converted from an hexadecimal string.
/// GMLscripts.com/license  
function srcHexToDec(hex) {
    var dec = 0;
     
    var dig = "0123456789ABCDEF";
    var len = string_length(hex);
    for (var pos = 1; pos <= len; pos += 1) {
        dec = dec << 4 | (string_pos(string_char_at(hex, pos), dig) - 1);
    }
     
    return dec;
}