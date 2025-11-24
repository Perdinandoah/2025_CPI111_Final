function save_player_data(fileName, playerX, playerY, roomName){
	ini_open(fileName)
	ini_write_real("PlayerPos", "X", playerX)
	ini_write_real("PlayerPos", "Y", playerY)
	ini_write_string("PlayerPos", "Room", roomName)
	
	ini_close()
}
