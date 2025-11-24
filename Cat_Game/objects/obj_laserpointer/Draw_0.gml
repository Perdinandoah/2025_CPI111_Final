// Draw the fading trail
if (surface_exists(trail_surface)) {
    draw_surface(trail_surface, 0, 0);

    // Slightly fade the old trail over time
    surface_set_target(trail_surface);
    draw_set_alpha(0.05);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    surface_reset_target();
}

// Draw the laser dot
draw_set_color(c_red);
draw_circle(x, y, 5, false);
draw_set_color(c_white);
draw_circle(x, y, 2, false);
