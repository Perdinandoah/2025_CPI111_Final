// Ensure controller exists
if (controller == noone && instance_exists(obj_lasercontroller)) {
    controller = instance_find(obj_lasercontroller, 0);
}

// Only award points if controller exists and timer is active
if (controller != noone && controller.timer > 0) {

    // Click detection radius
    var click_radius = 25;
    var d = point_distance(mouse_x, mouse_y, x, y);

    if (d <= click_radius) {
        global.score += 100;   // add points to global score

        // Play click feedback sound
        audio_play_sound(snd_b, 0, false);

        // Visual feedback
        effect_create_above(ef_ring, x, y, 1, c_red);

        // Debug
        show_debug_message("CLICKED LASER, GLOBAL SCORE: " + string(global.score));
    }
}
