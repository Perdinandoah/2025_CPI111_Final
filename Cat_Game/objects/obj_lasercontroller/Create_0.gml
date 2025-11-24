// Make sure global score exists
if (!variable_global_exists("score")) {
    global.score = 0;
}

// Save starting score so we can see how much was earned in the minigame
starting_score  = global.score;
minigame_score  = 0;

// 30-second minigame timer
timer      = 30 * room_speed;
exit_timer = -1; // not counting down yet

// Pause main game music and start minigame music
if (audio_is_playing(snd_bkg_mus)) {
    audio_pause_sound(snd_bkg_mus);
}
audio_play_sound(snd_puzzle_bkg1, 1, true); // loop = true
