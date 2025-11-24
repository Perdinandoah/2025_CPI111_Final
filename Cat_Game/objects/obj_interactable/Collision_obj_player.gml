if(keyboard_check_pressed(ord("S"))){
	save_player_data("playerData.ini", obj_player.x, obj_player.y, room_get_name(obj_controller.currentRoom))
	room_goto(roomToGoTo)	
}