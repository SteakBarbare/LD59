if (!isActive) exit;

var centerX = display_get_gui_width() / 2;
var centerY = display_get_gui_height() / 2;


if (distance_to_object(objPlayer) < interactRange && !showPaper) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(centerX, display_get_gui_height() - 80, "E - Lire");
}


if (showPaper || paperOpening) {
    var paperWidth = 400;
    var paperHeight = 565 * paperScale;
    
    draw_sprite_stretched(sprTutoPlaceholder, 0, centerX - paperWidth / 2, centerY - paperHeight / 2, paperWidth, paperHeight);
    
    if (paperScale > 0.5) {
        var textAlpha = (paperScale - 0.5) * 2;
        draw_set_alpha(textAlpha);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_black);
		draw_text_transformed(centerX, centerY, string(digitValue), 1.5, 1.5, 0);
        draw_set_alpha(1);
    }
}