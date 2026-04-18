/// @function										srcHexToColor()
/// @param  {string}			hex					Hexadecimal color in RRGGBB format, string
/// @description									Returns an RGB color from a given hexadecimal color code.
/// GMLscripts.com/license
function srcHexToColor(hex) {
    var dec,col;
    dec = srcHexToDec(hex);
    col = (dec & 16711680) >> 16 | (dec & 65280) | (dec & 255) << 16;
    return col;
}