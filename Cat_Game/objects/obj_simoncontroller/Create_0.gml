/// --- obj_simoncontroller Create Event ---

current_round = 1;            // Track current round
max_rounds = 3;
round_lengths = [4,6,8];      // Number of notes per round
sequence = [];
player_index = 0;

playing_sequence = true;
flash_index = 0;
flash_timer = 0;
flash_time = 30;
player_turn = false;
game_over = false;

// Find button instances in the room and store valid ones
buttons = [];
notes = [];

if (instance_exists(obj_a)) { array_push(buttons, instance_find(obj_a,0)); array_push(notes, snd_a); }
if (instance_exists(obj_b)) { array_push(buttons, instance_find(obj_b,0)); array_push(notes, snd_b); }
if (instance_exists(obj_c)) { array_push(buttons, instance_find(obj_c,0)); array_push(notes, snd_c); }
if (instance_exists(obj_d)) { array_push(buttons, instance_find(obj_d,0)); array_push(notes, snd_d); }
if (instance_exists(obj_e)) { array_push(buttons, instance_find(obj_e,0)); array_push(notes, snd_e); }
if (instance_exists(obj_f)) { array_push(buttons, instance_find(obj_f,0)); array_push(notes, snd_f); }
if (instance_exists(obj_g)) { array_push(buttons, instance_find(obj_g,0)); array_push(notes, snd_g); }

// Start first round
start_round();
