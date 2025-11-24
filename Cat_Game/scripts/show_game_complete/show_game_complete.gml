function show_game_complete() {
    for (var i = 0; i < array_length(buttons); i++) {
        with (buttons[i]) instance_destroy();
    }
    instance_create_layer(room_width/2, room_height/2, "GUI", obj_game_complete_text);
}
