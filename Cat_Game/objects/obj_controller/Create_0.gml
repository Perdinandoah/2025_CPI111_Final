audio_play_sound(snd_bkg_mus, 1, true);
if(file_exists("playerData.ini")){
	obj_player.x = load_data_playerX("playerData.ini")
	obj_player.y = load_data_playerY("playerData.ini")
	
	save_player_data("playerData.ini", 484, 1324, room_get_name(Tutorial))
}