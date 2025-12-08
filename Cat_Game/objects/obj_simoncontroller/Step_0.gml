/// obj_simoncontroller – Step
// ----- Failure pause before replay -----
if (fail_timer > 0) {
    fail_timer--;
    if (fail_timer == 0) {
        // Now actually restart the round
        player_index     = 0;
        playing_sequence = true;
        flash_index      = 0;
        flash_timer      = flash_time;
    }
    exit; // skip sequence playback while waiting
}

// ---------- Computer plays sequence ----------
if (playing_sequence && !game_over) {

    if (flash_timer > 0) {
        flash_timer--;
    }
    else if (flash_index < array_length(sequence)) {

        var btn_instance = sequence[flash_index];

        if (instance_exists(btn_instance)) {
            // Computer flash: green (longer)
            with (btn_instance) {
                flash_green = other.flash_time * 2;
            }

            // Play corresponding note
            for (var i=0; i<array_length(buttons); i++) {
                if (buttons[i] == btn_instance) {
                    audio_play_sound(notes[i], 1, false);
                    break;
                }
            }
        }

        flash_index++;
        flash_timer = flash_time * 2;
    }
    else {
        // Done playing: hand control to player
        playing_sequence = false;
        player_turn      = true;
        player_index     = 0;
    }
}



// ---------- Pause before next round ----------
if (pause_timer > 0) {
    pause_timer--;
    if (pause_timer == 0 && !game_over) {
        fn_start_round();
    }
}

// ---------- Exit minigame after delay ----------
if (minigame_complete) {
	    // Increase global score
    exit_timer++;
    if (exit_timer >= exit_delay) {
        // Go back to previous room or main game room
         room_goto(asset_get_index(load_data_playerRoom("playerData.ini")));
    }
}
