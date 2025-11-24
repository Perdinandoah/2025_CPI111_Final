/// obj_simoncontroller – Create

// Round setup
current_round = 1;
max_rounds = 3;
round_lengths = [4, 6, 8]; // notes per round

// Sequence + state
sequence      = [];
player_index  = 0;

playing_sequence = false;
flash_index      = 0;
flash_timer      = 0;
flash_time       = 15;  // frames for one flash
player_turn      = false;
game_over        = false;

// Button instances + sounds
buttons = [];
notes   = [];

if (instance_exists(obj_a)) { array_push(buttons, instance_find(obj_a, 0)); array_push(notes, snd_a); }
if (instance_exists(obj_b)) { array_push(buttons, instance_find(obj_b, 0)); array_push(notes, snd_b); }
if (instance_exists(obj_c)) { array_push(buttons, instance_find(obj_c, 0)); array_push(notes, snd_c); }
if (instance_exists(obj_d)) { array_push(buttons, instance_find(obj_d, 0)); array_push(notes, snd_d); }
if (instance_exists(obj_e)) { array_push(buttons, instance_find(obj_e, 0)); array_push(notes, snd_e); }
if (instance_exists(obj_f)) { array_push(buttons, instance_find(obj_f, 0)); array_push(notes, snd_f); }
if (instance_exists(obj_g)) { array_push(buttons, instance_find(obj_g, 0)); array_push(notes, snd_g); }

// ---------- Flash system ----------
flash_count = 0;             // remaining flashes for end-of-round
flash_timer_between = 10;    // frames between flashes
post_flash_pause = 15;       // frames to pause after end-of-round flashes
pause_timer = 0;             // countdown

// Generate random sequence
fn_generate_sequence = function(len) {
    var seq = [];
    var count = array_length(buttons);
    for (var i = 0; i < len; i++) {
        seq[i] = buttons[irandom(count-1)];
    }
    return seq;
};

// Start a round
fn_start_round = function() {
    sequence      = fn_generate_sequence(round_lengths[current_round - 1]);
    player_index  = 0;
    playing_sequence = true;
    flash_index      = 0;
    flash_timer      = flash_time;
    player_turn      = false;
};

// Restart a round (after mistake)
fn_restart_round = function() {
    player_index     = 0;
    playing_sequence = true;
    flash_index      = 0;
    flash_timer      = flash_time;
    player_turn      = false;
};

// Flash all buttons white (end-of-round)
fn_flash_all_buttons = function(times) {
    flash_count = times;
    flash_timer = 0;
};

// Flash all buttons red (wrong press)
fn_flash_all_buttons_red = function() {
    for (var i = 0; i < array_length(buttons); i++) {
        var inst = buttons[i];
        if (instance_exists(inst)) inst.flash_red = flash_time;
    }
};

// End of game
fn_show_game_complete = function() {
    for (var i = 0; i < array_length(buttons); i++) {
        var inst = buttons[i];
        if (instance_exists(inst)) instance_destroy(inst);
    }

    game_over        = true;
    player_turn      = false;
    playing_sequence = false;

    // Use first available layer
    var lay = layer;
    if (layer_exists("GUI")) lay = "GUI";
    instance_create_layer(room_width/2, room_height/2, lay, obj_game_complete_text);
};

// Start the first round
fn_start_round();
