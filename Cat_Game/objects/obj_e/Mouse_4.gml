if (obj_simoncontroller.player_turn && !obj_simoncontroller.game_over) {
    // Play sound
    audio_play_sound(note,1,false);
    
    // Check if correct
    if (id == obj_simoncontroller.sequence[obj_simoncontroller.player_index]) {
        obj_simoncontroller.player_index += 1;
        
        // Completed sequence
        if (obj_simoncontroller.player_index >= array_length(obj_simoncontroller.sequence)) {
            player_turn = false;
            
            // Flash success
            obj_simoncontroller.flash_all_buttons(3);
            
            // Next round or win
            obj_simoncontroller.round += 1;
            if (obj_simoncontroller.round > obj_simoncontroller.max_rounds) {
                obj_simoncontroller.game_over = true;
                show_game_complete();
            } else {
                start_round();
            }
        }
    } else {
        // Failed sequence
        obj_simoncontroller.flash_all_buttons_red();
        restart_round();
    }
}
