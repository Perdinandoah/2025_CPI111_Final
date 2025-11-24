/// obj_simoncontroller – Step

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

// ---------- End-of-round white flashes ----------
if (flash_count > 0) {
    if (flash_timer <= 0) {

        // Flash all buttons for one frame using flash_end
        for (var i=0; i<array_length(buttons); i++) {
            var inst = buttons[i];
            if (instance_exists(inst)) inst.flash_end = flash_time;
        }

        flash_timer = flash_timer_between;
        flash_count--;

        // After last flash, start pause
        if (flash_count == 0) {
            pause_timer = post_flash_pause;
        }
    }
    else flash_timer--;
}


// ---------- Pause before next round ----------
if (pause_timer > 0) {
    pause_timer--;
    if (pause_timer == 0 && !game_over) {
        fn_start_round();
    }
}
