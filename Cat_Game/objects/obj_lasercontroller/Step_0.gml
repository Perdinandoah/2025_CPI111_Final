// --- MINIGAME TIMER ---
if (timer > 0) {
<<<<<<< Updated upstream
    timer -= 1;
} else {
    timer = 0;
    // You can add "end game" logic here (e.g., stop laser, show message)
=======
    timer -= 1; // count down
}
else if (timer == 0) {
    // Minigame just finished
    timer = -1; // mark finished
    minigame_score = global.score - starting_score; // points gained during minigame

    // Give 100 bonus points to global score for main game
    global.score += 100;

    // Start 5-second exit countdown
    exit_timer = 5 * room_speed;
}


    
// Exit after 5 seconds
if (timer == -1) {
    exit_timer -= 1;
    if (exit_timer <= 0) {
        // Stop minigame music, resume main music
        if (audio_is_playing(snd_puzzle_bkg1)) {
            audio_stop_sound(snd_puzzle_bkg1);
        }
     

        // Return to main room
        room_goto(Tutorial); // replace with your main room name
    }
>>>>>>> Stashed changes
}
