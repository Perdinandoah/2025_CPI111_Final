fn_show_game_complete = function() {
    for (var i = 0; i < array_length(buttons); i++) {
        var inst = buttons[i];
        if (instance_exists(inst)) instance_destroy(inst);
    }

    game_over        = true;
    player_turn      = false;
    playing_sequence = false;

    // Increase global score
    global.score += 100;
	
	// Give small health boost to the player
with (obj_player) {
    health = clamp(health + 10, 0, 100); // +10 health, capped at 100
}


    // Start exit timer
    minigame_complete = true;
    exit_timer = 0;

    // Show "Minigame Complete!" text
    var lay = layer;
    if (layer_exists("GUI")) lay = "GUI";
    instance_create_layer(room_width/2, room_height/2, lay, obj_game_complete_text);
};
