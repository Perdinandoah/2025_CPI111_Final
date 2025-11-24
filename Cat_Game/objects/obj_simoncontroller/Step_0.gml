/// --- obj_simoncontroller Step Event ---

if (playing_sequence && !game_over) {

    if (flash_timer > 0) {
        flash_timer -= 1;
    } else if (flash_index < array_length(sequence)) {

        var btn_instance = sequence[flash_index]; // safe local variable

        if (instance_exists(btn_instance)) {
            // Flash the button
            with (btn_instance) {
                flash = obj_simoncontroller.flash_time;
            }

            // Play corresponding sound
            for (var i = 0; i < array_length(buttons); i++) {
                if (btn_instance == buttons[i]) {
                    audio_play_sound(notes[i], 1, false);
                    break;
                }
            }
        }

        flash_index += 1;
        flash_timer = flash_time * 2;

    } else {
        // Sequence finished
        playing_sequence = false;
        player_turn = true;
        player_index = 0;
    }
}


