if (playerState == "Death") {
    var centerX = display_get_gui_width() / 2;
    var centerY = display_get_gui_height() / 2;
    var buttonLeft = centerX - 100;
    var buttonTop = centerY + 20;
    var buttonWidth = 200;
    var buttonHeight = 50;
    
    draw_set_alpha(deathScreenAlpha * 0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    if (deathScreenAlpha > 0.5) {
        var textAlpha = (deathScreenAlpha - 0.5) * 2;
        isHoveringButton = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), buttonLeft, buttonTop, buttonLeft + buttonWidth, buttonTop + buttonHeight);
        
        draw_set_alpha(textAlpha);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_red);
        draw_text_transformed(centerX, centerY - 50, "T NUL", 3, 3, 0);
        
        draw_set_color(isHoveringButton ? c_white : c_gray);
        draw_rectangle(buttonLeft, buttonTop, buttonLeft + buttonWidth, buttonTop + buttonHeight, false);
        draw_set_color(c_black);
        draw_text(centerX, buttonTop + buttonHeight / 2, "Restartr");
    }
    
    draw_set_alpha(1);
}