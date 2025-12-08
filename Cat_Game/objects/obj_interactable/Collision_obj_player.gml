
if (keyboard_check_pressed(ord("S"))) {

    // Save player data before entering the minigame
    save_player_data("playerData.ini", obj_player.x, obj_player.y, room_get_name(obj_controller.currentRoom));

    // Pick random minigame
    var minigames = [simonminigame_room, laserminigameRoom];
    var choice = choose(minigames[0], minigames[1]);

    // Go to the chosen minigame
    room_goto(choice);
}
