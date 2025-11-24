// Local controller variables
score = 0;
timer = 30 * room_speed; // 30 seconds in steps

// Optionally store a reference so other objects can find it easily
controller_id = id;

audio_play_sound(snd_puzzle_bkg1, 1, true);