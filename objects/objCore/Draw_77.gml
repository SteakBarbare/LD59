/// @description Shadow Background
draw_surface(application_surface, 0, 0);
draw_set_alpha(shadowAlpha);
draw_surface_stretched(lightSurface, 0, 0, cameraWidth, cameraHeight);
draw_set_alpha(1);

// stroke mini-cam sonar
if (keyboard_check(vk_space) && instance_exists(objSonar) && !objSonar.isCarried) {
    var viewX = view_xport[1];
    var viewY = view_yport[1];
    var viewW = view_wport[1];
    var viewH = view_hport[1];
    
    draw_set_color(c_white);
    draw_rectangle(viewX, viewY, viewX + viewW, viewY + viewH, true);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_text(viewX, viewY - 20, "SONAR CAM");
}