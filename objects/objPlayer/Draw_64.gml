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

//

if (isPaused) {
    var centerX = display_get_gui_width() / 2;
    var centerY = display_get_gui_height() / 2;
    
    // fond semi transparent
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    
    // titre
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text_transformed(centerX, centerY - 80, "PAUSE", 3, 3, 0);
    

    var continueLeft = centerX - 100;
    var continueTop = centerY;
    var buttonWidth = 200;
    var buttonHeight = 50;
    var isHoveringContinue = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), continueLeft, continueTop, continueLeft + buttonWidth, continueTop + buttonHeight);
    
    draw_set_color(isHoveringContinue ? c_white : c_gray);
    draw_rectangle(continueLeft, continueTop, continueLeft + buttonWidth, continueTop + buttonHeight, true);
    draw_set_color(isHoveringContinue ? c_white : c_gray);
    draw_text(centerX, continueTop + buttonHeight / 2, "Continuer");
    
   
    var quitLeft = centerX - 100;
    var quitTop = centerY + 70;
    var isHoveringQuit = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), quitLeft, quitTop, quitLeft + buttonWidth, quitTop + buttonHeight);
    
    draw_set_color(isHoveringQuit ? c_red : c_gray);
    draw_rectangle(quitLeft, quitTop, quitLeft + buttonWidth, quitTop + buttonHeight, true);
    draw_set_color(isHoveringQuit ? c_red : c_gray);
    draw_text(centerX, quitTop + buttonHeight / 2, "Quitter");
    
    // clics
    if (mouse_check_button_pressed(mb_left)) {
        if (isHoveringContinue) {
            isPaused = false;
            game_set_speed(60, gamespeed_fps);
        }
        if (isHoveringQuit) {
            game_end();
        }
    }
    }

