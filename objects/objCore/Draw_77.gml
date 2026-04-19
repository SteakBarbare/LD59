/// @description Shadow Background
draw_surface(application_surface, 0, 0);
draw_set_alpha(shadowAlpha);
draw_surface_stretched(lightSurface, 0, 0, display_get_width(), display_get_height());
draw_set_alpha(1);

// stroke mini-cam sonar
if (secondCameraOn) {
    var viewX = camX;
    var viewY = camY
    var viewW = view_wport[1];
    var viewH = view_hport[1];
}

