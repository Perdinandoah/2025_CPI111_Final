// Ensure global.score exists
if (!variable_global_exists("score")) {
    global.score = 0; // initialize if it doesn’t exist
}

// Save the starting global score
starting_score = global.score;

// Minigame points tracker
minigame_score = 0;

// Minigame timer
timer = 30 * room_speed; // 30 seconds

// Music handling
if (audio_is_playing(snd_bkg_mus)) {  // your main game music
    audio_pause_sound(snd_bkg_mus);   // pause it
}
audio_play_sound(snd_puzzle_bkg1, 1, true); // play minigame music
