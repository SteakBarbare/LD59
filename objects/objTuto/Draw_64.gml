
if (distance_to_object(objPlayer) < interactRange && !showTuto) {
    var guiX = x * display_get_gui_width() / camera_get_view_width(view_camera[0]);
    var guiY = y * display_get_gui_height() / camera_get_view_height(view_camera[0]);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(guiX, guiY - 40, "E - Interact");
}

if (showTuto || tutoOpening) {
    var sw = display_get_gui_width();
    var sh = display_get_gui_height();
    var w = 400;
    var h = 565 * tutoScale;
    draw_sprite_stretched(sprTutoPlaceholder, 0, sw/2 - w/2, sh/2 - h/2, w, h);
}
