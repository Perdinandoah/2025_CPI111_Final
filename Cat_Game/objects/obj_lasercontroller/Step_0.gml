/// obj_lasercontroller – Step Event

// --- MAIN MINIGAME TIMER ---
if (timer > 0) {
    timer -= 1;

    if (timer <= 0) {
        // Clamp to 0 to avoid negatives
        timer = 0;

        // How much the player earned during the minigame (optional info)
        minigame_score = global.score - starting_score;

        // Give the player +100 bonus points for completing the minigame
        global.score += 100;

        // Start 5-second countdown before exiting back to main game
        exit_timer = 5 * room_speed;
    }
}
// --- EXIT COUNTDOWN AFTER MINIGAME ENDS ---
else if (exit_timer >= 0) {
    exit_timer -= 1;

    if (exit_timer <= 0) {
        // Stop all sounds (including minigame music)
        audio_stop_all();

        // Start main game music again
        audio_play_sound(snd_bkg_mus, 1, true);

        // Go back to your main game room
        room_goto(asset_get_index(load_data_playerRoom("playerData.ini"))); // <-- replace with your main room name
    }
}
