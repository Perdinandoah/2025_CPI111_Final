/// obj_a – Left Pressed

var controller = obj_simoncontroller; // adjust if your controller instance has a different name
if (!instance_exists(controller)) exit; // safety check

// Only allow input during player turn and if game is not over
if (controller.player_turn && !controller.game_over) {

    // Play button sound
    audio_play_sound(snd_g, 1, false);

    var idx = controller.player_index;
    var seq = controller.sequence;

    // Safety: index in bounds
    if (idx >= array_length(seq)) exit;

    var expected_inst = seq[idx];

    if (expected_inst == id) {
        // ✅ Correct click
        flash = controller.flash_time;      // White flash for player feedback
        controller.player_index++;

        // End of sequence?
        if (controller.player_index >= array_length(seq)) {
            controller.player_turn = false;


            
            // Prepare next round or end game
            controller.current_round++;
            if (controller.current_round > controller.max_rounds) {
                controller.fn_show_game_complete();
            } else {
                // The controller Step will handle the pause and then start next round
                controller.pause_timer = controller.post_flash_pause;
            }
        }

    } else {
        // ❌ Wrong click
        controller.fn_flash_all_buttons_red(); // flash all buttons red
        controller.fn_restart_round();         // replay same round
    }
}


