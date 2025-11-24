// Make sure we have a controller
if (controller == noone && instance_exists(obj_lasercontroller)) {
    controller = instance_find(obj_lasercontroller, 0);
}

// Only count clicks while the timer is running
if (controller != noone && controller.timer > 0) {

    // Big clickable radius around the laser
    var click_radius = 50; // make bigger/smaller for difficulty
    var d = point_distance(mouse_x, mouse_y, x, y);

    if (d <= click_radius) {
        // Add points directly to global score
        global.score += 100;

        // Play success sound
        audio_play_sound(snd_b, 1, false);

        // Visual feedback
        effect_create_above(ef_ring, x, y, 1, c_red);

        // Debug (optional)
        // show_debug_message("CLICKED LASER, SCORE: " + string(global.score));
    }
}
