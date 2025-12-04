function load_data_playerX(fileName){
	if(file_exists(fileName)){
		ini_open(fileName)
		var playerPosX = ini_read_real("PlayerPos", "X", 0)
		ini_close()
		return playerPosX
	}
}
function load_data_playerY(fileName){
	if(file_exists(fileName)){
		ini_open(fileName)
		var playerPosY = ini_read_real("PlayerPos", "Y", 0)
		ini_close()
		return playerPosY
	}
}
function load_data_playerRoom(fileName){
	if(file_exists(fileName)){
		ini_open(fileName)
		var playerPosRoom = ini_read_string("PlayerPos", "Room", "")
		ini_close()
		return playerPosRoom
	}
}