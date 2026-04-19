
if (distance_to_object(objPlayer) < interactRange && !showTuto) {
    var guiX = display_get_gui_width() / 2;
    var guiY = display_get_gui_height() / 2 - 100;
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(guiX, guiY - 40, "R - Interact");
}

if (showTuto || tutoOpening) {
    var sw = display_get_gui_width();
    var sh = display_get_gui_height();
    var w = sprite_get_width(docToShow);
    var h = sprite_get_height(docToShow) * tutoScale;
    draw_sprite_stretched(docToShow, 0, sw/2 - w/2, sh/2 - h/2, w, h);
}
